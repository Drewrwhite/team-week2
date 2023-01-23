SELECT
  case_number as incident_number,
  crime_against,
  offense_category,
  offense_count,
  offense_type,
  occur_date,
  occur_month_year,
  occur_time,
  report_date,
  reportmonthyear
FROM 
  {{ source('portland', 'portland_crime') }}