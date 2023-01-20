with stg_month_type as (

  select * from {{ ref('stg_month_type') }} 
),

final as (

  select
    year,
    month,
    count(crime_id) as total_crimes, 
    countif(arrest = true) as total_arrests,
    countif(domestic = true) as total_domestic
  from stg_month_type
  group by year, month
  order by year, month
)

select * from final