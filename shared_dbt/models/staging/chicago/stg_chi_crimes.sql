with src_chi_crimes as (

  select * from {{ source('chicago', 'chi_crimes') }}
), 

final as (

  select
    crime_id, 
    PARSE_DATETIME('%m/%d/%Y %T %p', date_time) as date_time, 
    block, 
    IUCR_code, 
    primary_IUCR, 
    secondary_IUCR,
    location_description,
    arrest, 
    domestic, 
    beat, 
    district,
    ward, 
    community_area,
    FBI_code, 
    lat, 
    lon, 
    location
  from src_chi_crimes
)

select * from final