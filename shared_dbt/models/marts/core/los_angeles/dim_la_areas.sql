{{ config (
    materialized="table"
)}}

with stg_areas as (
    select * from {{ ref('stg_la_areas') }}
),

crime as (
    select * from {{ ref('fct_los_angeles') }}
),

area_la as (
    select distinct
        area_id
    from crime
),

final as (

    select distinct
        area_la.area_id,
        stg_areas.area_name,
        current_timestamp as created_at,
        current_timestamp as modified_at

    from stg_areas
    left join area_la using (area_id)
)
select * from final