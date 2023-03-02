
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__version`
    
    
    OPTIONS(
      description="""Table of project versions in your organization."""
    )
    as (
      

with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__version_tmp`
),

fields as (

    select
        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    archived
    
 as 
    
    archived
    
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
    
    
    overdue
    
 as 
    
    overdue
    
, 
    
    
    project_id
    
 as 
    
    project_id
    
, 
    
    
    release_date
    
 as 
    
    release_date
    
, 
    
    
    released
    
 as 
    
    released
    
, 
    
    
    start_date
    
 as 
    
    start_date
    



    from base
),

final as (
    
    select 
        archived as is_archived,
        description,
        id as version_id,
        name as version_name,
        overdue as is_overdue,
        project_id,
        cast(release_date as TIMESTAMP) as release_date,
        released as is_released,
        cast(start_date as TIMESTAMP) as start_date
    from fields
)

select * 
from final
    );
  