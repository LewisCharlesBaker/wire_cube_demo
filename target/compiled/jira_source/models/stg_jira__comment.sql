with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__comment_tmp`
),

fields as (

    select
        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    author_id
    
 as 
    
    author_id
    
, 
    
    
    body
    
 as 
    
    body
    
, 
    
    
    created
    
 as 
    
    created
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    is_public
    
 as 
    
    is_public
    
, 
    
    
    issue_id
    
 as 
    
    issue_id
    
, 
    
    
    update_author_id
    
 as 
    
    update_author_id
    
, 
    
    
    updated
    
 as 
    
    updated
    



    from base
),

final as (
    
    select 
        author_id as author_user_id,
        body,
        cast(created as TIMESTAMP) as created_at,
        id as comment_id,
        issue_id,
        is_public,
        update_author_id as last_update_user_id,
        cast(updated as TIMESTAMP) as last_updated_at,
        _fivetran_synced
    from fields
)

select * 
from final