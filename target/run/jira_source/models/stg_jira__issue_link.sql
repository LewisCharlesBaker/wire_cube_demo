
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_link`
    
    
    OPTIONS(
      description="""Table of relationships (links) created between issues. Issue links can include blockers, clones/duplicates, and general relationships.\n"""
    )
    as (
      with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_link_tmp`
),

fields as (

    select
        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    issue_id
    
 as 
    
    issue_id
    
, 
    
    
    related_issue_id
    
 as 
    
    related_issue_id
    
, 
    
    
    relationship
    
 as 
    
    relationship
    



    from base
),

final as (
    
    select 
        issue_id,
        related_issue_id,
        relationship,
        _fivetran_synced 
    from fields
)

select * 
from final
    );
  