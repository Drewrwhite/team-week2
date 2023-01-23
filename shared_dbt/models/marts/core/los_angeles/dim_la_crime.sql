{{ config (
    materialized="table"
)}}

with stg_crime as (
    select * from {{ ref('stg_la_crime') }}
),

crime as (
    select * from {{ ref('fct_los_angeles') }}
),

crime_code as (
    select 
        crm_cd
    from crime
),

final as (
    select distinct
        crime_code.crm_cd,
        stg_crime.crm_cd_desc,
        current_timestamp as created_at,
        current_timestamp as modified_at
    from stg_crime
    left join crime_code using (crm_cd)
)

select * from final
