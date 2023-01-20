with stg_chi_crimes as (

  select * from {{ ref('stg_chi_crimes') }} 
),

stg_geometries as (
  select * from {{  ref('stg_geometries') }} 
),

final as (
  select 
    EXTRACT(YEAR from date_time) as year,
    EXTRACT(MONTH from date_time) as month,
    beat,
    IUCR_code,
    count(crime_id) as total_crimes,
    countif(arrest = true) as total_arrests,
    countif(domestic = true) as total_domestic
  from stg_chi_crimes
  group by year, month, beat, IUCR_code
) 

select * from final
order by year, month, total_crimes desc

-- YOU CAN'T GROUP BY GEOM IN BIG QUERY.
-- >> Any joins to stg_geometry must be made *after* the final aggregation step
-- >> So we'd lost the geometry info when making agg_arr_domestic_month and have to rejoin anyways
-- select 
--   a.year, 
--   a.month, 
--   a.beat, 
--   a.IUCR_code, 
--   a.total_crimes,
--   a.total_arrests, 
--   a.total_domestic, 
--   b.geom
-- from final as a 
-- join stg_geometries as b
-- on a.beat = b.beat



