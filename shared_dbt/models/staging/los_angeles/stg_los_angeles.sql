with src_los_angeles as (
 select * from {{ source('los_angeles', 'LA_2010_2019') }}
 union all
 select * from {{ source('los_angeles', 'LA_2020_PRESENT') }}
),

los_angeles as (
    
    select
        dr_no, 
        date_occ, 
        area_id, 
        area_name, 
        crm_cd, 
        crm_cd_desc, 
        cast(premis_cd as int64) as premis_cd, 
        premis_desc, 
        location,
        md5(concat(cast(location as string))) as location_id,

    from src_los_angeles
)

select * from los_angeles
