SELECT
  incident_number,
  offense_code,
  offense_code_group,
  offense_description,
  occurred_on_date,
  year,
  month,
  day_of_week,
  hour,
  location
FROM 
  {{ source('boston', 'boston_crime') }}