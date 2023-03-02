
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__sprint`
    
    
    OPTIONS(
      description="""Table of all sprints."""
    )
    as (
      

with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__sprint_tmp`
),

fields as (

    select
        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    board_id
    
 as 
    
    board_id
    
, 
    
    
    complete_date
    
 as 
    
    complete_date
    
, 
    
    
    end_date
    
 as 
    
    end_date
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    
    
    start_date
    
 as 
    
    start_date
    



    from base
),

final as (
    
    select 
        id as sprint_id,
        name as sprint_name,
        board_id,
        cast(complete_date as TIMESTAMP) as completed_at,
        cast(end_date as TIMESTAMP) as ended_at,
        cast(start_date as TIMESTAMP) as started_at,
        _fivetran_synced
    from fields
)

select * 
from final
    );
  