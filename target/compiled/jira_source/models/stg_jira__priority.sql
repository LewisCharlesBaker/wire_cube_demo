

with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__priority_tmp`
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
        description as priority_description,
        id as priority_id,
        name as priority_name,
        _fivetran_synced
    from fields
)

select * 
from final