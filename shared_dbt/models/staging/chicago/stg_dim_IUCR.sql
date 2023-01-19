with src_chi_crimes as (

  select * from {{ source('chicago', 'chi_crimes')}}
), 

final as (

select IUCR_code, primary_IUCR, secondary_IUCR
from src_chi_crimes
)

select * from final