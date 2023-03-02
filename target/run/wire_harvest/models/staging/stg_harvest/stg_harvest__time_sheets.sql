

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__time_sheets`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

    select * from `ra-development`.`stitch_harvest`.`time_entries`    

),

deduplicated as (

    select unique.*
    from (
        select
            array_agg (
                original
                order by updated_at desc
                limit 1
            )[offset(0)] unique
        from source original
        group by id
    )

),

base as (

    select distinct
        
        
    
to_hex(md5(cast(coalesce(cast(id as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(updated_at as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_timesheet_sk,

        cast(id as numeric) harvest_timesheet_natural_key,
        cast(user_id as numeric) as harvest_employee_natural_key,
        cast(task_id as numeric) as harvest_task_natural_key,
        cast(task_assignment_id as numeric) as harvest_task_assignment_natural_key,
        cast(user_assignment_id as numeric) as harvest_employee_assignment_natural_key,
        cast(invoice_id as numeric) as harvest_invoice_natural_key,
        cast(project_id as numeric) as harvest_project_natural_key,
        cast(external_reference_id as numeric) as harvest_external_reference_natural_key,
        cast(client_id as numeric) as harvest_client_natural_key,

        lower(cast(notes as string)) harvest_timesheet_notes,
        lower(cast(locked_reason as string)) harvest_timesheet_locked_reason,

        cast(billable_rate as numeric) as harvest_timesheet_billable_rate,
        cast(cost_rate as numeric) as harvest_timesheet_cost_rate,
        cast(hours as numeric) as harvest_timesheet_hours,
        cast(budgeted as numeric) as harvest_timesheet_hours_budgeted,

        cast(billable as boolean) as harvest_timesheet_is_billable,
        cast(is_closed as boolean) as harvest_timesheet_is_closed,
        cast(is_running as boolean) as harvest_timesheet_is_running,
        cast(is_billed as boolean) as harvest_timesheet_is_billed,
        cast(is_locked as boolean) as harvest_timesheet_is_locked,

        cast(started_time as string) as harvest_timesheet_started_at,
        cast(timer_started_at as timestamp) as harvest_timesheet_timer_started_at_ts,
        cast(created_at as timestamp) as harvest_timesheet_created_at_ts,
        cast(updated_at as timestamp) as harvest_timesheet_updated_at_ts,
        cast(spent_date as timestamp) as harvest_timesheet_spent_at_ts
    
    from deduplicated  

)

select * from base;

