

with source as (

    select * from `ra-development`.`fivetran_jira`.`issue`    

),

base as (

    select

        cast(id as numeric) as jira_issue_natural_key,
        cast(parent_id as numeric) as jira_issue_parent_natural_key,
        cast(status as numeric) as jira_status_natural_key,

        lower(cast(summary as string)) as jira_issue_summary,
        lower(cast(description as string)) as jira_issue_description,
        lower(cast(project as string)) as jira_issue_project,
        lower(cast(assignee as string)) as jira_issue_assignee,
        lower(cast(reporter as string)) as jira_issue_reporter,
        lower(cast(priority as string)) as jira_issue_priority,
        lower(cast(creator as string)) as jira_issue_creator,
        lower(cast(issue_type as string)) as jira_issue_issue_type,
        lower(cast(key as string)) as jira_issue_key,

        cast(original_estimate as numeric) as jira_issue_original_estimate,
        cast(remaining_estimate as numeric) as jira_issue_remaining_estimate,

        cast(status_category_changed as timestamp) as jira_issue_status_category_changed_at_ts,
        cast(resolved as timestamp) as jira_issue_resolved_at_ts,
        cast(last_viewed as timestamp) as jira_issue_last_viewed_at_ts,
        cast(due_date as timestamp) as jira_issue_due_date_at_ts,
        cast(created as timestamp) as jira_issue_created_at_ts,
        cast(updated as timestamp) as jira_issue_updated_at_ts

    from source

)

select * from base