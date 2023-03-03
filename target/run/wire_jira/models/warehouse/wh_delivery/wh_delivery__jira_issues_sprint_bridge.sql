
  
    

    create or replace table `ra-development`.`lewis_analytics_dev`.`wh_delivery__jira_issues_sprint_bridge`
    
    
    OPTIONS(
      description=""""""
    )
    as (
      

with int_jira__issues as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__issues`

),

final as (

    select distinct

        
    
to_hex(md5(cast(coalesce(cast(jira_issue_natural_key as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(jira_sprint_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_issue_sprint_bridge_pk,
        
        
    
to_hex(md5(cast(coalesce(cast(jira_issue_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_issue_fk,

        
    
to_hex(md5(cast(coalesce(cast(jira_sprint_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_sprint_fk

    from int_jira__issues

) 

select * from final
    );
  