with agg_month_beat_type as (

  select * from {{ ref('agg_month_beat_type') }} 
),

stg_geometries as (

  select * from {{ ref('stg_geometries') }} 
),


a as (

  select
    year,
    month,
    beat,
    sum(total_crimes) as total_crimes, 
    sum(total_arrests) as total_arrests,
    sum(total_domestic) as total_domestic
  from agg_month_beat_type
  group by year, month, beat
)

select 
  a.year, 
  a.month, 
  a.beat, 
  a.total_crimes, 
  a.total_arrests, 
  a.total_domestic, 
  b.geom
from a 
join stg_geometries as b
on a.beat = b.beat
order by year, month, total_crimes desc