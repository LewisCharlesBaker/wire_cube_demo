
  
    

    create or replace table `ra-development`.`lewis_analytics_dev`.`wh_delivery__jira_issues_field_history_fact`
    
    
    OPTIONS(
      description=""""""
    )
    as (
      

with int_jira__issues_field_history as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__issues_field_history`

),

final as (

    select

        
    
to_hex(md5(cast(coalesce(cast(jira_field_natural_key as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(jira_issue_natural_key as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(jira_issue_field_history_timestamp as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_issues_field_history_pk,  
        
        
    
to_hex(md5(cast(coalesce(cast(jira_field_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_field_fk,
        
        
    
to_hex(md5(cast(coalesce(cast(jira_issue_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_issue_fk,       

        jira_issue_field_history_is_active,
        jira_issue_field_history_story_point_estimate,
        jira_issue_field_history_status_description,
        jira_issue_field_history_status_name,
        jira_issue_field_history_timestamp

    from int_jira__issues_field_history

)

select * from final
    );
  