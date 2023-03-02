
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__field`
    
    
    OPTIONS(
      description="""Table of all issue fields."""
    )
    as (
      with base as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__field_tmp`
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
    
    
    is_array
    
 as 
    
    is_array
    
, 
    
    
    is_custom
    
 as 
    
    is_custom
    
, 
    
    
    name
    
 as 
    
    name
    



    from base
),

final as (
    
    select 
        cast(id as STRING) as field_id,
        is_array,
        is_custom,
        name as field_name,
        _fivetran_synced
    from fields
)

select * 
from final
    );
  