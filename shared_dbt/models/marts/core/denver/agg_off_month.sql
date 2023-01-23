with stg_off_month as (

  select * from {{ ref('stg_off_month') }} 
), 

dim_off_codes as (

  select * from {{ ref('dim_off_codes')}} 
),

final as (

  select 
    a.year,
    a.month, 
    a.off_id_hash, 
    b.offense_type_name, 
    b.offense_cat_name, 
    b.is_crime, 
    b.is_traffic,
    count(incident_id) as incidents
  from stg_off_month as a
  join dim_off_codes as b
  on a.off_id_hash = b.off_id_hash
  group by year, month, off_id_hash, offense_type_name, offense_cat_name, is_crime, is_traffic
  order by year, month, incidents desc
)

select * from final