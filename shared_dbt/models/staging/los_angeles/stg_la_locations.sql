with stg_locations as (
    select * from {{ ref('stg_los_angeles') }}
),


final as (
    select
        location_id,
        location,
        premis_cd,
        area_id,
        current_timestamp as created_at,
        current_timestamp as modified_at

    from stg_locations
    where premis_cd is  not null
)


select * from final 