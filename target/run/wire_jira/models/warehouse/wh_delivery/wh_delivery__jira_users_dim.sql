
  
    

    create or replace table `ra-development`.`lewis_analytics_dev`.`wh_delivery__jira_users_dim`
    
    
    OPTIONS(
      description=""""""
    )
    as (
      

with int_jira__users as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__users`

),

final as (

    select

        
    
to_hex(md5(cast(coalesce(cast(jira_user_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_user_pk,

        jira_user_name,
        jira_user_email,
        jira_user_locale,
        jira_user_time_zone,

        jira_user_projects,
        jira_user_count_closed_issues,
        jira_user_count_open_issues,
        jira_user_avg_close_time_days,
        jira_user_avg_age_currently_open_days,
        jira_user_median_close_time_days,
        jira_user_median_age_currently_open_days,
        jira_user_avg_close_time_seconds,
        jira_user_avg_age_currently_open_seconds,
        jira_user_median_close_time_seconds,
        jira_user_median_age_currently_open_seconds
            
    from int_jira__users

)

select * from final
    );
  