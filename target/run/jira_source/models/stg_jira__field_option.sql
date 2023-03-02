
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__field_option`
    
    
    OPTIONS(
      description="""Table of all options related to custom fields."""
    )
    as (
      with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__field_option_tmp`
),

fields as (

    select
        
    
    
    id
    
 as 
    
    id
    
, 
    
    
    parent_id
    
 as 
    
    parent_id
    
, 
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    name
    
 as 
    
    name
    



    from base
),

final as (
    
    select 
        id as field_id,
        parent_id as parent_field_id,
        name as field_option_name
    from fields
)

select * 
from final
    );
  