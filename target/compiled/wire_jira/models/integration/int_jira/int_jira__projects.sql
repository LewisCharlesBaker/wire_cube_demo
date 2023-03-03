with stg_jira__projects as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__projects`

),

fivetran_jira__project_enhanced as (

    select * from `ra-development`.`lewis_analytics_dev_jira`.`jira__project_enhanced`

),

joined as (

    select

        stg_jira__projects.jira_project_natural_key,
        stg_jira__projects.jira_project_lead_natural_key,

        stg_jira__projects.jira_project_name,
        stg_jira__projects.jira_project_description,
        stg_jira__projects.jira_project_key,
        stg_jira__projects.jira_project_project_type_key,
        
        fivetran_jira__project_enhanced.epics as jira_project_epics,
        fivetran_jira__project_enhanced.components as jira_project_components,
        fivetran_jira__project_enhanced.count_closed_issues as jira_project_count_closed_issues,
        fivetran_jira__project_enhanced.count_open_issues as jira_project_count_open_issues,
        fivetran_jira__project_enhanced.count_open_assigned_issues as jira_project_count_open_assigned_issues,
        fivetran_jira__project_enhanced.avg_close_time_days as jira_project_avg_close_time_days,
        fivetran_jira__project_enhanced.avg_assigned_close_time_days as jira_project_avg_assigned_close_time_days,
        fivetran_jira__project_enhanced.avg_age_currently_open_days as jira_project_avg_age_currently_open_days,
        fivetran_jira__project_enhanced.avg_age_currently_open_assigned_days as jira_project_avg_age_currently_open_assigned_days,
        fivetran_jira__project_enhanced.median_close_time_days as jira_project_median_close_time_days,
        fivetran_jira__project_enhanced.median_age_currently_open_days as jira_project_median_age_currently_open_days,
        fivetran_jira__project_enhanced.median_assigned_close_time_days as jira_project_median_assigned_close_time_days,
        fivetran_jira__project_enhanced.median_age_currently_open_assigned_days as jira_project_median_age_currently_open_assigned_days,
        fivetran_jira__project_enhanced.avg_close_time_seconds as jira_project_avg_close_time_seconds,
        fivetran_jira__project_enhanced.avg_assigned_close_time_seconds as jira_project_avg_assigned_close_time_seconds,
        fivetran_jira__project_enhanced.avg_age_currently_open_seconds as jira_project_avg_age_currently_open_seconds,
        fivetran_jira__project_enhanced.avg_age_currently_open_assigned_seconds as jira_project_avg_age_currently_open_assigned_seconds,
        fivetran_jira__project_enhanced.median_close_time_seconds as jira_project_median_close_time_seconds,
        fivetran_jira__project_enhanced.median_age_currently_open_seconds as jira_project_median_age_currently_open_seconds,
        fivetran_jira__project_enhanced.median_assigned_close_time_seconds as jira_project_median_assigned_close_time_seconds,
        fivetran_jira__project_enhanced.median_age_currently_open_assigned_seconds as jira_project_median_age_currently_open_assigned_seconds
    
    from stg_jira__projects

    left join fivetran_jira__project_enhanced
    on fivetran_jira__project_enhanced.project_id = stg_jira__projects.jira_project_natural_key
  
)

select * from joined