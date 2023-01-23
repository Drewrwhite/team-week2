SELECT
  location,
  lat as latitude,
  long as longtitude,
  street,
  district
FROM 
  {{ source('boston','boston_crime') }}