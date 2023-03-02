-- just grabs user attributes for issue assignees and reporters 

with issue as (

    -- including issue_id in here because snowflake for some reason ignores issue_id,
    -- so we'll just always pull it out and explicitly select it
    

    select
        issue_id,
        coalesce(revised_parent_issue_id, parent_issue_id) as parent_issue_id,

        `original_estimate_seconds`,
  `remaining_estimate_seconds`,
  `time_spent_seconds`,
  `assignee_user_id`,
  `created_at`,
  `resolved_at`,
  `creator_user_id`,
  `issue_description`,
  `due_date`,
  `environment`,
  `issue_type_id`,
  `issue_key`,
  `priority_id`,
  `project_id`,
  `reporter_user_id`,
  `resolution_id`,
  `status_id`,
  `status_changed_at`,
  `issue_name`,
  `updated_at`,
  `work_ratio`,
  `_fivetran_synced`,
  `issue_type`,
  `parent_issue_type`,
  `parent_issue_name`,
  `parent_issue_key`,
  `is_parent_epic`


    
    from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__issue_type_parents`

),

-- user is a reserved keyword in AWS
jira_user as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__user`
),

issue_user_join as (

    select
        issue.*,
        assignee.user_display_name as assignee_name,
        assignee.time_zone as assignee_timezone,
        assignee.email as assignee_email,
        reporter.email as reporter_email,
        reporter.user_display_name as reporter_name,
        reporter.time_zone as reporter_timezone
        
        
    from issue
    left join jira_user as assignee on issue.assignee_user_id = assignee.user_id 
    left join jira_user as reporter on issue.reporter_user_id = reporter.user_id

)

select * 
from issue_user_join