{{ config (
    materialized="table"
)}}

with stg_locations as (
    select * from {{ ref('stg_la_locations') }}
),

crime as (
    select * from {{ ref('fct_los_angeles') }}
),

loc_la as (
    select 
        location_id
    from crime
),

final as (
    select
        loc_la.location_id,
        stg_locations.location,
        stg_locations.premis_cd,
        stg_locations.area_id,
        current_timestamp as created_at,
        current_timestamp as modified_at

    from stg_locations
    left join loc_la using (location_id)
    where premis_cd is  not null
)


select * from final 