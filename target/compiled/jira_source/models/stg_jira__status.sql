with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__status_tmp`
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
    
    
    status_category_id
    
 as 
    
    status_category_id
    



    from base
),

final as (

    select
        description as status_description,
        id as status_id,
        name as status_name,
        status_category_id,
        _fivetran_synced
    from fields
)

select * 
from final