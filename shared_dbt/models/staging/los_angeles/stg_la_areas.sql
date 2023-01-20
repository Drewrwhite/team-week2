with stg_areas as (
    select * from {{ ref('stg_los_angeles') }}
), 

final as (
    select distinct
        area_id,
        area_name,
        current_timestamp as created_at,
        current_timestamp as modified_at
    from stg_areas
    
)

select * from final