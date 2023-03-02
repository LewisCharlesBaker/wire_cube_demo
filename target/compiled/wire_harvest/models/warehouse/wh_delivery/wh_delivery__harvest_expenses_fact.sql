

with int_harvest__expenses as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__expenses`

),

final as (

    select 

        
    
to_hex(md5(cast(coalesce(cast(harvest_expense_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_expense_pk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_client_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_client_fk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_invoice_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_invoice_fk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_project_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_project_fk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_employee_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_employee_fk,
            
        harvest_expense_category_natural_key,
        harvest_employee_assignment_natural_key,

        harvest_expense_notes,
        harvest_expense_receipt_file_name,
        harvest_expense_locked_reason,
        harvest_expense_receipt_content_type,
        harvest_expense_receipt_url,

        harvest_expense_total_cost,
        harvest_expense_receipt_file_size,
        harvest_expense_units,

        harvest_expense_is_closed,
        harvest_expense_billable,
        harvest_expense_is_billed,
        harvest_expense_is_locked,

        harvest_expense_created_at,
        harvest_expense_updated_at,
        harvest_expense_spent_date,

    from int_harvest__expenses

)

select * from final