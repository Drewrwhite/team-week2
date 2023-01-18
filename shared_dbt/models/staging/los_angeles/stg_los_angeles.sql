with src_los_angeles as (
 select * from {{ source('los_angeles', 'LA_2010_2019') }}
 union all
 select * from {{ source('los_angeles', 'LA_2020_PRESENT') }}
),

final as (
    
    select
        dr_no, 
        date_occ, 
        area_id, 
        area_name, 
        crm_cd, 
        crm_cd_desc, 
        premis_cd, 
        premis_desc, 
        location, 
        lat,
        lon

    from src_los_angeles
)

select * from final
