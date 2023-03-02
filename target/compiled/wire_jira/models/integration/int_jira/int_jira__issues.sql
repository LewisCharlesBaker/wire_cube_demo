with stg_jira__issues as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__issues`

),

stg_jira__status as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__statuses`

),

int_jira__issues_field_history as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__issues_field_history`

),

fivetran_jira__issue_enhanced as (

    select * from `ra-development`.`lewis_analytics_dev_jira`.`jira__issue_enhanced`

),

int_jira__boards as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__boards`

),

int_jira__sprints as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__sprints`

),

stg_jira__issue_board as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__issue_board`

),

most_recent_jira__issues_field as (

    select distinct

        jira_issue_natural_key,
        jira_issue_field_history_story_point_estimate
    
    from int_jira__issues_field_history

    where jira_issue_field_history_is_active = true

),

joined as (

    select 
    
        stg_jira__issues.jira_issue_natural_key,
        stg_jira__issues.jira_issue_parent_natural_key,

        stg_jira__issue_board.jira_board_natural_key,
        int_jira__sprints.jira_sprint_natural_key,

        fivetran_jira__issue_enhanced.creator_user_id as jira_creator_natural_key,
        fivetran_jira__issue_enhanced.reporter_user_id as jira_reporter_natural_key,
        fivetran_jira__issue_enhanced.resolution_id as jira_resolution_natural_key,
        fivetran_jira__issue_enhanced.current_sprint_id as jira_current_sprint_natural_key,

        stg_jira__issues.jira_issue_summary,
        stg_jira__issues.jira_issue_description,
        stg_jira__issues.jira_issue_project,
        stg_jira__issues.jira_issue_assignee,
        stg_jira__issues.jira_issue_reporter,
        stg_jira__issues.jira_issue_priority,
        stg_jira__issues.jira_issue_creator,
        stg_jira__issues.jira_issue_issue_type,
        stg_jira__issues.jira_issue_key,

        fivetran_jira__issue_enhanced.issue_type as jira_issue_type,
        fivetran_jira__issue_enhanced.parent_issue_type as jira_issue_parent_issue_type,
        fivetran_jira__issue_enhanced.parent_issue_name as jira_issue_parent_issue_name,
        fivetran_jira__issue_enhanced.is_parent_epic as jira_issue_is_parent_epic,
        fivetran_jira__issue_enhanced.resolution_type as jira_issue_resolution_type,
        fivetran_jira__issue_enhanced.work_ratio as jira_issue_work_ratio,
        fivetran_jira__issue_enhanced.status as jira_issue_status,
        fivetran_jira__issue_enhanced.conversation as jira_issue_conversation,
        fivetran_jira__issue_enhanced.current_status as jira_issue_current_status,
        fivetran_jira__issue_enhanced.current_status_category as jira_issue_current_status_category,
        fivetran_jira__issue_enhanced.current_priority as jira_issue_current_priority,
        fivetran_jira__issue_enhanced.sprint as jira_issue_sprint,
        fivetran_jira__issue_enhanced.current_sprint_name as jira_issue_current_sprint_name,
        fivetran_jira__issue_enhanced.is_active_sprint as jira_issue_is_active_sprint,
        fivetran_jira__issue_enhanced.fixes_versions as jira_issue_fixes_versions,
        fivetran_jira__issue_enhanced.sprint_started_at as jira_issue_sprint_started_at,
        fivetran_jira__issue_enhanced.sprint_ended_at as jira_issue_sprint_ended_at,
        fivetran_jira__issue_enhanced.sprint_completed_at as jira_issue_sprint_completed_at,
        fivetran_jira__issue_enhanced.first_assigned_at as jira_issue_first_assigned_at,
        fivetran_jira__issue_enhanced.last_assigned_at as jira_issue_last_assigned_at,
        fivetran_jira__issue_enhanced.first_resolved_at as jira_issue_first_resolved_at,
        fivetran_jira__issue_enhanced.count_sprint_changes as jira_issue_count_sprint_changes,
        fivetran_jira__issue_enhanced.time_spent_seconds as jira_issue_time_spent_seconds,
        fivetran_jira__issue_enhanced.count_comments as jira_issue_count_comments,
        fivetran_jira__issue_enhanced.open_duration_seconds as jira_issue_open_duration_seconds,
        fivetran_jira__issue_enhanced.any_assignment_duration_seconds as jira_issue_any_assignment_duration_seconds,
        fivetran_jira__issue_enhanced.last_assignment_duration_seconds as jira_issue_last_assignment_duration_seconds,

        stg_jira__status.jira_status_description as jira_issue_status_description,
        stg_jira__status.jira_status_name as jira_issue_status_name,
        fivetran_jira__issue_enhanced.status_changed_at as jira_issue_status_changed_at,

        first_value (most_recent_jira__issues_field.jira_issue_field_history_story_point_estimate ignore nulls) 
            over(partition by stg_jira__issues.jira_issue_natural_key order by stg_jira__issues.jira_issue_updated_at_ts 
            rows between unbounded preceding and unbounded following
        ) as jira_issue_story_point_estimate,

        stg_jira__issues.jira_issue_original_estimate,
        stg_jira__issues.jira_issue_remaining_estimate,

        stg_jira__issues.jira_issue_status_category_changed_at_ts,
        stg_jira__issues.jira_issue_resolved_at_ts,
        stg_jira__issues.jira_issue_last_viewed_at_ts,
        stg_jira__issues.jira_issue_due_date_at_ts,
        stg_jira__issues.jira_issue_created_at_ts,
        stg_jira__issues.jira_issue_updated_at_ts
    
    from stg_jira__issues

    left join stg_jira__status 
    on stg_jira__issues.jira_status_natural_key = stg_jira__status.jira_status_natural_key

    left join most_recent_jira__issues_field 
    on stg_jira__issues.jira_issue_natural_key = most_recent_jira__issues_field.jira_issue_natural_key

    left join fivetran_jira__issue_enhanced 
    on stg_jira__issues.jira_issue_natural_key = fivetran_jira__issue_enhanced.issue_id

    left join stg_jira__issue_board
    on stg_jira__issue_board.jira_issue_natural_key = stg_jira__issues.jira_issue_natural_key

    left join int_jira__boards
    on int_jira__boards.jira_board_natural_key = stg_jira__issue_board.jira_board_natural_key

    left join int_jira__sprints
    on int_jira__boards.jira_board_natural_key = int_jira__sprints.jira_board_natural_key

)

select * from joined