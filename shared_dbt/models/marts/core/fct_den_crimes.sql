with src_den_crimes as (

  select * from {{ source('denver', 'den_crimes') }}
), 

final as (

  select 
    incident_id,
    MD5(CONCAT(CAST(offense_code AS STRING), CAST(offense_code_ext AS STRING))) as off_id_hash,
    first_occurrence, 
    last_occurrence, 
    reported_date, 
    address,
    geo_lon as lon,
    geo_lat as lat, 
    district_id, 
    precinct_id, 
    neighborhood_id

  from src_den_crimes
)

select * from final

