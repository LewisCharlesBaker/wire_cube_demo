

with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__component_tmp`
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
    
, 
    
    
    project_id
    
 as 
    
    project_id
    



    from base
),

final as (
    
    select 
        description as component_description,
        id as component_id,
        name as component_name,
        project_id,
        _fivetran_synced
    from fields
)

select * 
from final