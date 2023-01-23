with stg_crime as (
    select * from {{ ref('stg_los_angeles') }}
),


final as (
    select distinct
        crm_cd,
        crm_cd_desc,
        current_timestamp as created_at,
        current_timestamp as modified_at
    from stg_crime
)

select * from final