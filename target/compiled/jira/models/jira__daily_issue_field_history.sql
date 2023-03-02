

-- grab column names that were pivoted out-- in intermediate/field_history/
with pivoted_daily_history as (

    select * 
    from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__field_history_scd`

    
    
    where valid_starting_on >= (select max(date_day) from `ra-development`.`lewis_analytics_dev_jira`.`jira__daily_issue_field_history` )

-- If no issue fields have been updated since the last incremental run, the pivoted_daily_history CTE will return no record/rows.
-- When this is the case, we need to grab the most recent day's records from the previously built table so that we can persist 
-- those values into the future.

), most_recent_data as ( 
 
    select 
        *
    from `ra-development`.`lewis_analytics_dev_jira`.`jira__daily_issue_field_history`
    where date_day = (select max(date_day) from `ra-development`.`lewis_analytics_dev_jira`.`jira__daily_issue_field_history` )



), field_option as (
    
    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__field_option`
),

statuses as (
    
    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__status`
),

-- in intermediate/field_history/
calendar as (

    select *
    from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__issue_calendar_spine`

    
    where date_day >= (select max(date_day) from `ra-development`.`lewis_analytics_dev_jira`.`jira__daily_issue_field_history` )
    
),

joined as (

    select
        calendar.date_day,
        calendar.issue_id

        
         
        , coalesce(pivoted_daily_history.status, most_recent_data.status) as status
         
        , coalesce(pivoted_daily_history.sprint, most_recent_data.sprint) as sprint
        
    
    
    
    from calendar
    left join pivoted_daily_history 
        on calendar.issue_id = pivoted_daily_history.issue_id
        and calendar.date_day = pivoted_daily_history.valid_starting_on
    
    
    left join most_recent_data
        on calendar.issue_id = most_recent_data.issue_id
        and calendar.date_day = most_recent_data.date_day
    
),

set_values as (

    select
        date_day,
        issue_id,
        statuses.status_name as status,
        sum( case when statuses.status_name is null then 0 else 1 end) over ( partition by issue_id
            order by date_day rows unbounded preceding) as status_field_partition

        
        , coalesce(field_option_sprint.field_option_name, sprint) as sprint
        -- create a batch/partition once a new value is provided
        , sum( case when sprint is null then 0 else 1 end) over ( partition by issue_id
            order by date_day rows unbounded preceding) as sprint_field_partition

        

    from joined

    left join statuses
        on cast(statuses.status_id as STRING) = joined.status

    
    left join field_option as field_option_sprint
        on cast(field_option_sprint.field_id as STRING) = sprint
    
),

fill_values as (

    select  
        date_day,
        issue_id,
        first_value( status ) over (
            partition by issue_id, status_field_partition 
            order by date_day asc rows between unbounded preceding and current row) as status

        
        -- grab the value that started this batch/partition
        , first_value( sprint ) over (
            partition by issue_id, sprint_field_partition 
            order by date_day asc rows between unbounded preceding and current row) as sprint
        

    from set_values
),

fix_null_values as (

    select  
        date_day,
        issue_id,
        case when status = 'is_null' then null else status end as status
         

        -- we de-nulled the true null values earlier in order to differentiate them from nulls that just needed to be backfilled
        , case when sprint = 'is_null' then null else sprint end as sprint
        

    from fill_values

),

surrogate_key as (

    select
        *,
        
    
to_hex(md5(cast(coalesce(cast(date_day as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(issue_id as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as issue_day_id

    from fix_null_values
)

select *
from surrogate_key