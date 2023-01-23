SELECT 
  opendatalat as latitude,
  opendatalon as longitude,
  address,
  neighborhood
FROM 
  {{ source('portland', 'portland_crime') }}