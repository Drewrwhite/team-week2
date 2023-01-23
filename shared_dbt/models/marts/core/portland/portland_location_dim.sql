SELECT 
  CONCAT(latitude, ',', longitude) AS location,
  *
FROM 
  {{ ref('stg_portland_location') }}
