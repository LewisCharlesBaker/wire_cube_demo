with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__resolution_tmp`
),

fields as (

    select
        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    description
    
 as 
    
    description
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    



    from base
),

final as (
    
    select 
        description as resolution_description,
        id as resolution_id,
        name as resolution_name,
        _fivetran_synced
    from fields
)

select * 
from final