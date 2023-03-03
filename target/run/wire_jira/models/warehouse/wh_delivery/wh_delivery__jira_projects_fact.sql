
  
    

    create or replace table `ra-development`.`lewis_analytics_dev`.`wh_delivery__jira_projects_fact`
    
    
    OPTIONS(
      description=""""""
    )
    as (
      

with int_jira__projects as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__projects`

),

final as (

    select distinct
        
        
    
to_hex(md5(cast(coalesce(cast(jira_project_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_project_pk, 
        
        
    
to_hex(md5(cast(coalesce(cast(jira_project_lead_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_user_fk,  
        
        jira_project_name,
        jira_project_description,
        jira_project_key,
        jira_project_project_type_key,

        jira_project_epics,
        jira_project_components,
        jira_project_count_closed_issues,
        jira_project_count_open_issues,
        jira_project_count_open_assigned_issues,
        jira_project_avg_close_time_days,
        jira_project_avg_assigned_close_time_days,
        jira_project_avg_age_currently_open_days,
        jira_project_avg_age_currently_open_assigned_days,
        jira_project_median_close_time_days,
        jira_project_median_age_currently_open_days,
        jira_project_median_assigned_close_time_days,
        jira_project_median_age_currently_open_assigned_days,
        jira_project_avg_close_time_seconds,
        jira_project_avg_assigned_close_time_seconds,
        jira_project_avg_age_currently_open_seconds,
        jira_project_avg_age_currently_open_assigned_seconds,
        jira_project_median_close_time_seconds,
        jira_project_median_age_currently_open_seconds,
        jira_project_median_assigned_close_time_seconds,
        jira_project_median_age_currently_open_assigned_seconds

    from int_jira__projects


)

select * from final
    );
  