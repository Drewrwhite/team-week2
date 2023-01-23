with stg_den_crimes as (

  select * from {{ ref('stg_den_crimes') }} 
), 

final as (
  select 
    EXTRACT(YEAR from reported_date) as year,
    EXTRACT(MONTH from reported_date) as month,
    incident_id, 
    off_id_hash
  from stg_den_crimes
  order by year, month
)

select * from final 