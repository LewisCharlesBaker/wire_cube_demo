

with int_jira__daily_issue_field_history as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__daily_issue_field_history`

),

final as (

    select

        
    
to_hex(md5(cast(coalesce(cast(jira_daily_issue_field_history_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_daily_issue_field_history_pk,  
        
        
    
to_hex(md5(cast(coalesce(cast(jira_issue_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_issue_fk,       

        jira_daily_issue_field_history_status,
        jira_daily_issue_field_history_sprint,
        jira_daily_issue_field_history_date_day

    from int_jira__daily_issue_field_history

)

select * from final