with stg_jira__users as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__users`

),

jira__user_enhanced as (

    select * from `ra-development`.`lewis_analytics_dev_jira`.`jira__user_enhanced`

),

joined as (

    select

        stg_jira__users.jira_user_natural_key,

        stg_jira__users.jira_user_name,
        stg_jira__users.jira_user_email,
        stg_jira__users.jira_user_locale,
        stg_jira__users.jira_user_time_zone,

        jira__user_enhanced.projects as jira_user_projects,
        jira__user_enhanced.count_closed_issues as jira_user_count_closed_issues,
        jira__user_enhanced.count_open_issues as jira_user_count_open_issues,
        jira__user_enhanced.avg_close_time_days as jira_user_avg_close_time_days,
        jira__user_enhanced.avg_age_currently_open_days as jira_user_avg_age_currently_open_days,
        jira__user_enhanced.median_close_time_days as jira_user_median_close_time_days,
        jira__user_enhanced.median_age_currently_open_days as jira_user_median_age_currently_open_days,
        jira__user_enhanced.avg_close_time_seconds as jira_user_avg_close_time_seconds,
        jira__user_enhanced.avg_age_currently_open_seconds as jira_user_avg_age_currently_open_seconds,
        jira__user_enhanced.median_close_time_seconds as jira_user_median_close_time_seconds,
        jira__user_enhanced.median_age_currently_open_seconds as jira_user_median_age_currently_open_seconds

    from stg_jira__users

    left join jira__user_enhanced
    on stg_jira__users.jira_user_natural_key = jira__user_enhanced.user_id

)

select * from joined