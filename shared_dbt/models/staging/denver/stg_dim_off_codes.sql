with src_off_codes as (

  select * from {{ source('denver','off_codes') }}
),

final as (

  select 
    MD5(CONCAT(CAST(offense_code AS STRING), CAST(offense_code_ext AS STRING))) as off_id_hash,
    offense_code,
    offense_code_ext,
    offense_type_id,
    offense_type_name,
    offense_cat_id,
    offense_cat_name,
    is_crime,
    is_traffic

  from src_off_codes
)

select * from final