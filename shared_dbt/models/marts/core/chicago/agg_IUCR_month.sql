with stg_month_type as (

  select * from {{ ref('stg_month_type') }} 
),

dim_IUCR as (

  select * from {{ ref('dim_IUCR') }}

), 

final as (

  select 
    a.year, 
    a.month, 
    a.IUCR_code,
    b.primary_IUCR, 
    b.secondary_IUCR, 
    count(crime_id) as crimes
  from stg_month_type as a 
  inner join dim_IUCR as b
  on a.IUCR_code = b.IUCR_code
  group by year, month, IUCR_code, primary_IUCR, secondary_IUCR
  order by year, month, crimes desc
) 

select * from final