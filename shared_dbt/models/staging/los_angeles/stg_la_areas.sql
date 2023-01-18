with source as (
 select * from {{ source('los_angeles', 'LA_2010_2019') }}
 union all
 select * from {{ source('los_angeles', 'LA_2020_PRESENT') }}
),

staged as (

    select 
      area_id,
      area_name,
      lat,
      lon,
      current_timestamp as created_at,
      current_timestamp as modified_at

    from source
)

select * from staged


