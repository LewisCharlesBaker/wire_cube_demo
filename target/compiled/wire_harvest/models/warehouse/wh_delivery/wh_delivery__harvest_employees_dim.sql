

with int_harvest__employees as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__employees`

),

final as (

    select 

        
    
to_hex(md5(cast(coalesce(cast(harvest_employee_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_employee_pk,

        harvest_employee_first_name,
        harvest_employee_last_name,
        harvest_employee_full_name,
        harvest_employee_email,

        harvest_employee_weekly_capacity,
        harvest_employee_cost_rate,
        harvest_employee_default_hourly_rate,

        harvest_employee_is_contractor,
        harvest_employee_is_active,

        harvest_employee_created_at_ts,
        harvest_employee_updated_at_ts

    from int_harvest__employees

)

select * from final