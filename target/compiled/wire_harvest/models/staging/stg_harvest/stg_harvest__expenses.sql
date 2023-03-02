

with source as (

   select * from `ra-development`.`stitch_harvest`.`expenses`    

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

   select

      cast(id as numeric) as harvest_expense_natural_key,
      cast(expense_category_id as numeric) as harvest_expense_category_natural_key,
      cast(client_id as numeric) as harvest_client_natural_key,
      cast(invoice_id as numeric) as harvest_invoice_natural_key,
      cast(project_id as numeric) as harvest_project_natural_key,
      cast(user_assignment_id as numeric) as harvest_employee_assignment_natural_key,
      cast(user_id as numeric) as harvest_employee_natural_key,

      lower(cast(notes as string)) as harvest_expense_notes,
      lower(cast(receipt_file_name as string)) as harvest_expense_receipt_file_name,
      lower(cast(locked_reason as string)) as harvest_expense_locked_reason,
      lower(cast(receipt_content_type as string)) as harvest_expense_receipt_content_type,
      lower(cast(receipt_url as string)) as harvest_expense_receipt_url,

      nullif(cast(total_cost as numeric),0) as harvest_expense_total_cost,
      nullif(cast(receipt_file_size as numeric),0) as harvest_expense_receipt_file_size,
      nullif(cast(units as numeric),0) as harvest_expense_units,

      cast(is_closed as boolean) as harvest_expense_is_closed,
      cast(billable as boolean) as harvest_expense_billable,
      cast(is_billed as boolean) as harvest_expense_is_billed,
      cast(is_locked as boolean) as harvest_expense_is_locked,

      cast(created_at as timestamp) as harvest_expense_created_at,
      cast(updated_at as timestamp) as harvest_expense_updated_at,
      cast(spent_date as timestamp) as harvest_expense_spent_date

   from deduplicated

)

select * from base