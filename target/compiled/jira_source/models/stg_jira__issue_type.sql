with base as (

    select * from 
    `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_type_tmp`
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
    
    
    subtask
    
 as 
    
    subtask
    



    from base
),

final as (

    select
        description,
        id as issue_type_id,
        name as issue_type_name,
        subtask as is_subtask,
        _fivetran_synced
    from fields
)

select * 
from final