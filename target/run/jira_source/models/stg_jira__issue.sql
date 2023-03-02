
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue`
    
    
    OPTIONS(
      description="""Table of all issues in your organization's Jira (captures soft deletes)."""
    )
    as (
      with base as (
    
    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_tmp`
    where not coalesce(_fivetran_deleted, false)
),

fields as (

    select 
        
    
    
    _fivetran_deleted
    
 as 
    
    _fivetran_deleted
    
, 
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    _original_estimate
    
 as 
    
    _original_estimate
    
, 
    
    
    _remaining_estimate
    
 as 
    
    _remaining_estimate
    
, 
    
    
    _time_spent
    
 as 
    
    _time_spent
    
, 
    
    
    assignee
    
 as 
    
    assignee
    
, 
    
    
    created
    
 as 
    
    created
    
, 
    
    
    creator
    
 as 
    
    creator
    
, 
    
    
    description
    
 as 
    
    description
    
, 
    
    
    due_date
    
 as 
    
    due_date
    
, 
    
    
    environment
    
 as 
    
    environment
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    issue_type
    
 as 
    
    issue_type
    
, 
    
    
    key
    
 as 
    
    key
    
, 
    
    
    original_estimate
    
 as 
    
    original_estimate
    
, 
    
    
    parent_id
    
 as 
    
    parent_id
    
, 
    
    
    priority
    
 as 
    
    priority
    
, 
    
    
    project
    
 as 
    
    project
    
, 
    
    
    remaining_estimate
    
 as 
    
    remaining_estimate
    
, 
    
    
    reporter
    
 as 
    
    reporter
    
, 
    
    
    resolution
    
 as 
    
    resolution
    
, 
    
    
    resolved
    
 as 
    
    resolved
    
, 
    
    
    status
    
 as 
    
    status
    
, 
    
    
    status_category_changed
    
 as 
    
    status_category_changed
    
, 
    
    
    summary
    
 as 
    
    summary
    
, 
    
    
    time_spent
    
 as 
    
    time_spent
    
, 
    
    
    updated
    
 as 
    
    updated
    
, 
    
    
    work_ratio
    
 as 
    
    work_ratio
    



    from base
),

final as (

    select
        coalesce(original_estimate, _original_estimate) as original_estimate_seconds,
        coalesce(remaining_estimate, _remaining_estimate) as remaining_estimate_seconds,
        coalesce(time_spent, _time_spent) as time_spent_seconds,
        assignee as assignee_user_id,
        cast(created as TIMESTAMP) as created_at,
        cast(resolved  as TIMESTAMP) as resolved_at,
        creator as creator_user_id,
        description as issue_description,
        due_date,
        environment,
        id as issue_id,
        issue_type as issue_type_id,
        key as issue_key,
        parent_id as parent_issue_id,
        priority as priority_id,
        project as project_id,
        reporter as reporter_user_id,
        resolution as resolution_id,
        status as status_id,
        cast(status_category_changed as TIMESTAMP) as status_changed_at,
        summary as issue_name,
        cast(updated as TIMESTAMP) as updated_at,
        work_ratio,
        _fivetran_synced
    from fields
)

select * 
from final
    );
  