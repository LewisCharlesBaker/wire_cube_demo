with issue as (

    select *
    from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__issue_join`
),daily_issue_field_history as (
    
    select
        *,
        row_number() over (partition by issue_id order by date_day desc) = 1 as latest_record
    from `ra-development`.`lewis_analytics_dev_jira`.`jira__daily_issue_field_history`

),

latest_issue_field_history as (
    
    select
        *
    from daily_issue_field_history
    where latest_record
),

final as (

    select 
    
        issue.*,

        

    datetime_diff(
        cast(coalesce(resolved_at, current_timestamp) as datetime),
        cast(created_at as datetime),
        second
    )

   open_duration_seconds,

        -- this will be null if no one has been assigned
        

    datetime_diff(
        cast(coalesce(resolved_at, current_timestamp) as datetime),
        cast(first_assigned_at as datetime),
        second
    )

   any_assignment_duration_seconds,

        -- if an issue is not currently assigned this will not be null
        

    datetime_diff(
        cast(coalesce(resolved_at, current_timestamp) as datetime),
        cast(last_assigned_at as datetime),
        second
    )

   last_assignment_duration_seconds 

        , status, sprint

    from issue
    
    left join latest_issue_field_history 
        on issue.issue_id = latest_issue_field_history.issue_id
        
)

select *
from final