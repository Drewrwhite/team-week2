{{ config (
    materialized="table"
)}}

with stg_crime as (
  select * from {{ ref('stg_los_angeles') }}

),

final as (
  select distinct
    dr_no,
    date_occ,
    area_id,
    crm_cd,
    premis_cd,
    location_id,
    current_timestamp as created_at,
    current_timestamp as modified_at

  from stg_crime
)

select * from final


