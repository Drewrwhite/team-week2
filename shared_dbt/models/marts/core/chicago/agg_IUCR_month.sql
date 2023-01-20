with agg_month_beat_type as (

  select * from {{ ref('agg_month_beat_type') }} 
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
    sum(total_crimes) as total_crimes,
    sum(total_arrests) as total_arrests,
    sum(total_domestic) as total_domestic
  from agg_month_beat_type as a 
  inner join dim_IUCR as b
  on a.IUCR_code = b.IUCR_code
  group by year, month, IUCR_code, primary_IUCR, secondary_IUCR
  order by year, month, total_crimes desc
) 

select * from final