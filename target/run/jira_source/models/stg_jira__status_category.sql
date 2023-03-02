
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__status_category`
    
    
    OPTIONS(
      description="""Table of umbrella status categories."""
    )
    as (
      with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__status_category_tmp`
),

fields as (

    select
        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    name
    
 as 
    
    name
    



    from base
),

final as (
    
    select 
        id as status_category_id,
        name as status_category_name
    from fields
)

select * 
from final
    );
  