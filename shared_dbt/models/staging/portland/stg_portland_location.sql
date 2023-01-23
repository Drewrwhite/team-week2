SELECT 
  opendatalat,
  opendatalon,
  address,
  neighborhood
FROM 
  {{ source('portland', 'portland_crime') }}