

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__time_sheets`
  OPTIONS(
      description=""""""
    )
  as with stg_harvest__time_sheets as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__time_sheets`

),

stg_harvest__time_sheet_external_reference as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__time_sheet_external_reference`

),

stg_harvest__external_reference as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__external_reference`

),

joined as (

    select 

        stg_harvest__time_sheets.harvest_timesheet_sk,
        stg_harvest__time_sheets.harvest_timesheet_natural_key,
        stg_harvest__time_sheets.harvest_employee_natural_key,
        stg_harvest__time_sheets.harvest_task_natural_key,
        stg_harvest__time_sheets.harvest_task_assignment_natural_key,
        stg_harvest__time_sheets.harvest_employee_assignment_natural_key,
        stg_harvest__time_sheets.harvest_invoice_natural_key,
        stg_harvest__time_sheets.harvest_project_natural_key,
        stg_harvest__time_sheets.harvest_external_reference_natural_key,
        stg_harvest__time_sheets.harvest_client_natural_key,

        stg_harvest__time_sheets.harvest_timesheet_notes,
        stg_harvest__time_sheets.harvest_timesheet_locked_reason,

        stg_harvest__time_sheets.harvest_timesheet_billable_rate,
        stg_harvest__time_sheets.harvest_timesheet_cost_rate,
        stg_harvest__time_sheets.harvest_timesheet_hours,
        stg_harvest__time_sheets.harvest_timesheet_hours_budgeted,

        stg_harvest__time_sheets.harvest_timesheet_is_billable,
        stg_harvest__time_sheets.harvest_timesheet_is_closed,
        stg_harvest__time_sheets.harvest_timesheet_is_running,
        stg_harvest__time_sheets.harvest_timesheet_is_billed,
        stg_harvest__time_sheets.harvest_timesheet_is_locked,

        stg_harvest__time_sheets.harvest_timesheet_created_at_ts,
        stg_harvest__time_sheets.harvest_timesheet_timer_started_at_ts,
        stg_harvest__time_sheets.harvest_timesheet_started_at,
        stg_harvest__time_sheets.harvest_timesheet_updated_at_ts,
        stg_harvest__time_sheets.harvest_timesheet_spent_at_ts,

        stg_harvest__external_reference.harvest_external_reference_permalink,
        stg_harvest__external_reference.harvest_external_reference_jira_issue_key,
        stg_harvest__external_reference.harvest_external_reference_platform
    
    
    from stg_harvest__time_sheets

    left join stg_harvest__time_sheet_external_reference
    on stg_harvest__time_sheets.harvest_timesheet_natural_key = stg_harvest__time_sheet_external_reference.harvest_timesheet_natural_key

    left join stg_harvest__external_reference
    on stg_harvest__external_reference.harvest_external_reference_natural_key = stg_harvest__time_sheet_external_reference.harvest_external_reference_natural_key

)

select * from joined;

