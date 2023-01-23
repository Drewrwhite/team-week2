SELECT
  location,
  lat as latitude,
  long as longtitude,
  street,
  district
FROM 
  {{ sources('boston','boston_crime') }}