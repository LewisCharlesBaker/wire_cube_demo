

with int_harvest__projects as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__projects`

),

final as (

    select 

        
    
to_hex(md5(cast(coalesce(cast(harvest_project_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_project_pk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_client_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_client_fk,

        harvest_project_name,
        harvest_project_code,
        harvest_project_notes,

        harvest_project_bill_by,
        harvest_project_budget_by,

        harvest_project_hourly_rate,
        harvest_project_cost_budget,
        harvest_project_fee,
        harvest_project_budget,
        harvest_project_over_budget_notification_percentage,

        harvest_project_show_budget_to_all,
        harvest_project_cost_budget_include_expenses,
        harvest_project_budget_is_monthly,
        harvest_project_notify_when_over_budget,
        
        harvest_project_is_billable,
        harvest_project_is_fixed_fee,
        harvest_project_is_active,

        harvest_project_over_budget_notification_date,
        harvest_project_created_at,
        harvest_project_ends_on,
        harvest_project_updated_at,
        harvest_project_starts_on

    from int_harvest__projects

)

select * from final