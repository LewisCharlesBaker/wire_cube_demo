

with int_harvest__time_sheets as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__time_sheets`

),

final as (

    select distinct

        
    
to_hex(md5(cast(coalesce(cast(harvest_timesheet_sk as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_timesheet_pk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_external_reference_jira_issue_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_external_reference_jira_fk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_task_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_task_fk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_project_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_project_fk,

        harvest_external_reference_jira_issue_key,
        harvest_timesheet_natural_key,

        harvest_employee_natural_key,
        harvest_task_assignment_natural_key,
        harvest_employee_assignment_natural_key,
        harvest_invoice_natural_key,
        harvest_client_natural_key,

        harvest_timesheet_notes,
        harvest_timesheet_locked_reason,

        harvest_timesheet_billable_rate,
        harvest_timesheet_cost_rate,
        harvest_timesheet_hours,
        harvest_timesheet_hours_budgeted,

        harvest_external_reference_permalink,
        harvest_external_reference_platform,

        harvest_timesheet_is_billable,
        harvest_timesheet_is_closed,
        harvest_timesheet_is_running,
        harvest_timesheet_is_billed,
        harvest_timesheet_is_locked,

        harvest_timesheet_created_at_ts,
        harvest_timesheet_timer_started_at_ts,
        harvest_timesheet_started_at,
        harvest_timesheet_updated_at_ts,
        harvest_timesheet_spent_at_ts

    from int_harvest__time_sheets

)

select * from final