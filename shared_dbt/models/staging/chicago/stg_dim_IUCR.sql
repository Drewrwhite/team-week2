with src_chi_crimes as (

  select * from {{ source('chicago', 'chi_crimes')}}
), 

row_numbers as (

select 
  IUCR_code, primary_IUCR, secondary_IUCR,
  ROW_NUMBER()OVER(PARTITION BY IUCR_code
  ORDER BY IUCR_code) as RN
from src_chi_crimes
)

select 
  IUCR_code,
  primary_IUCR, 
  secondary_IUCR,
from row_numbers  
where RN = 1 
order by IUCR_code