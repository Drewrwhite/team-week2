with source as (
 select * from {{ source('los_angeles', 'LA_2010_2019') }}
 union all
 select * from {{ source('los_angeles', 'LA_2020_PRESENT') }}
),

staged as (

    select
      md5(concat(cast(location as string), cast(lat as string), cast(lon as string))) as location_id,
      location,
      premis_cd,
      area_id,
      current_timestamp as created_at,
      current_timestamp as modified_at


    from source
)

select * from staged