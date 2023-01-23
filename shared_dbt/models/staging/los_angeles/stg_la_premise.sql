with stg_premise as (
    select * from {{ ref('stg_los_angeles') }}
), 

final as (
    select distinct
        premis_cd,
        premis_desc,
        current_timestamp as created_at,
        current_timestamp as modified_at
    
    from stg_premise
    where 
    (
    premis_cd is not null
    and 
    premis_desc is not null
)
)

select * from final