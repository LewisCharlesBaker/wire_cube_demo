

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_jira__daily_issue_field_history`
  OPTIONS(
      description=""""""
    )
  as with jira__daily_issue_field_history as (

    select * from `ra-development`.`lewis_analytics_dev_jira`.`jira__daily_issue_field_history`

),

final as (

    select 

        issue_id as jira_issue_natural_key,
        issue_day_id as jira_daily_issue_field_history_natural_key,
        
        status as jira_daily_issue_field_history_status,
        sprint as jira_daily_issue_field_history_sprint,
        
        date_day as jira_daily_issue_field_history_date_day,
        
    from jira__daily_issue_field_history

)

select * from final;

