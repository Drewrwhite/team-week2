-- BEFORE RUNNING: To avoid an ImportError, you must pin shapely < 2.0.0 in your venv
-- pip install -U google-cloud-aiplatform "shapely<2"
-- See: https://stackoverflow.com/questions/74831594/cannot-import-name-wkbwriter-from-shapely-geos-when-import-google-cloud-ai-p

with src_geometries as (

  select * from {{ source('chicago', 'geometries') }} 
), 

final as (

  select 
    CAST(beat_num AS INTEGER) as beat, 
    ST_GEOGFROMTEXT(geometry, make_valid => True) as geom
  from src_geometries 
)

select * from final
