
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_multiselect_history`
    
    
    OPTIONS(
      description="""Table of every value that each array-type (multiselect) field has been set to. Each row will pertain to **one** value.\n"""
    )
    as (
      with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_multiselect_history_tmp`
),

fields as (

    select
        
    
    
    _fivetran_id
    
 as 
    
    _fivetran_id
    
, 
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    field_id
    
 as 
    
    field_id
    
, 
    
    
    issue_id
    
 as 
    
    issue_id
    
, 
    
    
    value
    
 as 
    
    value
    
, 
    
    
    time
    
 as 
    
    time
    



    from base
),

final as (
    
    select 
        _fivetran_id,
        cast(field_id as STRING) as field_id,
        issue_id,
        
        cast(time as TIMESTAMP)
         as updated_at,
        value as field_value,
        _fivetran_synced
    from fields
)

select * 
from final
    );
  