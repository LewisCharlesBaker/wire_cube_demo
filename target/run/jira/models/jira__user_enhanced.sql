
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_jira`.`jira__user_enhanced`
    
    
    OPTIONS(
      description="""Table of users enriched with their projects, and the volume and velocity of their issues.\n"""
    )
    as (
      with  __dbt__cte__int_jira__user_metrics as (
with issue as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira`.`jira__issue_enhanced` 
    where assignee_user_id is not null
),

calculate_medians as (

    select 
        assignee_user_id as user_id,
        round( cast( 

    percentile_cont( 
        case when resolved_at is not null then last_assignment_duration_seconds end, 
        0.5) 
        over (partition by assignee_user_id    
        )

 as numeric), 0) as median_close_time_seconds,
        round( cast( 

    percentile_cont( 
        case when resolved_at is null then last_assignment_duration_seconds end, 
        0.5) 
        over (partition by assignee_user_id    
        )

 as numeric), 0) as median_age_currently_open_seconds

    from issue

    
),

-- grouping because the medians were calculated using window functions (except postgres)
median_metrics as (

    select 
        user_id, 
        median_close_time_seconds, 
        median_age_currently_open_seconds

    from calculate_medians
    group by 1,2,3
),


user_issues as (

    select
        assignee_user_id as user_id,
        sum(case when resolved_at is not null then 1 else 0 end) as count_closed_issues,
        sum(case when resolved_at is null then 1 else 0 end) as count_open_issues,

        sum(case when resolved_at is not null then last_assignment_duration_seconds end) as sum_close_time_seconds,
        sum(case when resolved_at is null then last_assignment_duration_seconds end) as sum_current_open_seconds

    from issue

    group by 1

),

calculate_avg_metrics as (

    select 
        user_id,
        count_closed_issues,
        count_open_issues,

        case when count_closed_issues = 0 then 0 else
        round( cast(sum_close_time_seconds * 1.0 / count_closed_issues as numeric ), 0) end as avg_close_time_seconds,

        case when count_open_issues = 0 then 0 else
        round( cast(sum_current_open_seconds * 1.0 / count_open_issues as numeric ), 0) end as avg_age_currently_open_seconds

    from user_issues
),

join_metrics as (

    select
        calculate_avg_metrics.*,
        round( cast(calculate_avg_metrics.avg_close_time_seconds / 86400.0 as numeric ), 0) as avg_close_time_days,
        round( cast(calculate_avg_metrics.avg_age_currently_open_seconds / 86400.0 as numeric ), 0) as avg_age_currently_open_days,

        median_metrics.median_close_time_seconds,
        median_metrics.median_age_currently_open_seconds,

        round( cast(median_metrics.median_close_time_seconds / 86400.0 as numeric ), 0) as median_close_time_days,
        round( cast(median_metrics.median_age_currently_open_seconds / 86400.0 as numeric ), 0) as median_age_currently_open_days
        
    from calculate_avg_metrics
    left join median_metrics using(user_id)
)

select * from join_metrics
),jira_user as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__user`
),

user_metrics as (

    select *
    from __dbt__cte__int_jira__user_metrics
),

issue as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira`.`jira__issue_enhanced` 
),

user_project as (

    select 
        assignee_user_id,
        project_name

    from issue
    group by 1,2

),

agg_user_projects as (

    select 
        assignee_user_id,
        
    string_agg(project_name, ', ')

 as projects

    from user_project
    group by 1
),

user_join as (

    select
        jira_user.*,
        agg_user_projects.projects, -- projects they've worked on issues for
        coalesce(user_metrics.count_closed_issues, 0) as count_closed_issues,
        coalesce(user_metrics.count_open_issues, 0) as count_open_issues,

        -- days
        user_metrics.avg_close_time_days,
        user_metrics.avg_age_currently_open_days,
        
        user_metrics.median_close_time_days,
        user_metrics.median_age_currently_open_days,

        -- seconds
        user_metrics.avg_close_time_seconds,
        user_metrics.avg_age_currently_open_seconds,
        
        user_metrics.median_close_time_seconds,
        user_metrics.median_age_currently_open_seconds

    from jira_user 
    left join user_metrics on jira_user.user_id = user_metrics.user_id
    left join agg_user_projects on jira_user.user_id = agg_user_projects.assignee_user_id
)

select * from user_join
    );
  