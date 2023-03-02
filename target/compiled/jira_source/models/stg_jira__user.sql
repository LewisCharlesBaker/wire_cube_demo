with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__user_tmp`
),

fields as (

    select
        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    email
    
 as 
    
    email
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    locale
    
 as 
    
    locale
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    time_zone
    
 as 
    
    time_zone
    
, 
    
    
    username
    
 as 
    
    username
    



    from base
),

final as (

    select 
        email,
        id as user_id,
        locale,
        name as user_display_name,
        time_zone,
        username,
        _fivetran_synced
    from fields
)

select * 
from final