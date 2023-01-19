with stg_year_month as (

  select * from {{ ref('stg_year_month') }} 
),

stg_dim_IUCR as (

  select * from {{ ref('stg_dim_IUCR') }}

), 


final as (

  select 
    a.year, 
    a.month, 
    a.IUCR_code,
    b.primary_IUCR, 
    b.secondary_IUCR, 
    count(crime_id) as crimes
  from stg_year_month as a 
  inner join stg_dim_IUCR as b
  on a.IUCR_code = b.IUCR_code
  group by year, month, IUCR_code, primary_IUCR, secondary_IUCR
  order by year, month, crimes desc
) 

select * from final