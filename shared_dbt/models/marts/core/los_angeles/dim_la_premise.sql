{{ config (
    materialized="table"
)}}

with stg_premise as (
    select * from {{ ref('stg_la_premise') }}
), 

crime as (
    select * from {{ ref('fct_los_angeles') }}
),

type_la as (
    select 
        premis_cd
    from crime
),

final as (
    select distinct
        type_la.premis_cd,
        stg_premise.premis_desc,
        current_timestamp as created_at,
        current_timestamp as modified_at
    
    from stg_premise
    left join type_la using (premis_cd)

)

select * from final