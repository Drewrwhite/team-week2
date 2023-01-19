with src_chi_crimes as (

  select * from {{ source('chicago', 'chi_crimes') }} 
),

final as (
  select 
    EXTRACT(YEAR from date_time) as year,
    EXTRACT(MONTH from date_time) as month,
    IUCR_code,
    crime_id,
    arrest, 
    domestic
  from chicago.fct_chi_crimes 
  order by year, month 
)

select * from final
