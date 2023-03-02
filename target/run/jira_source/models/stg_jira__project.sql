
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__project`
    
    
    OPTIONS(
      description="""Table of all projects in your organization."""
    )
    as (
      with base as (
    
    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__project_tmp`
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
    
    
    key
    
 as 
    
    key
    
, 
    
    
    lead_id
    
 as 
    
    lead_id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    permission_scheme_id
    
 as 
    
    permission_scheme_id
    
, 
    
    
    project_category_id
    
 as 
    
    project_category_id
    



    from base

),

final as (

    select 
        description as project_description,
        id as project_id,
        key as project_key,
        lead_id as project_lead_user_id,
        name as project_name,
        project_category_id,
        permission_scheme_id,
        _fivetran_synced
    from fields
)

select * 
from final
    );
  