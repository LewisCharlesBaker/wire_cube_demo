
  
    

    create or replace table `ra-development`.`lewis_analytics_dev`.`wh_delivery__harvest_invoices_fact`
    
    
    OPTIONS(
      description=""""""
    )
    as (
      

with int_harvest__invoices as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__invoices`

),

final as (

    select 

        
    
to_hex(md5(cast(coalesce(cast(harvest_invoice_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_invoice_pk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_client_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_client_fk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_creator_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_employee_fk,
            
        harvest_invoice_client_key,

        harvest_invoice_number,
        harvest_invoice_purchase_order,
        harvest_invoice_state,
        harvest_invoice_notes,
        harvest_invoice_subject,
        harvest_invoice_currency,
        harvest_invoice_payment_term,

        harvest_invoice_amount,
        harvest_invoice_due_amount,

        harvest_invoice_discount_amount,
        harvest_invoice_discount,

        harvest_invoice_tax_amount,
        harvest_invoice_tax,

        harvest_invoice_period_start,
        harvest_invoice_period_end,

        harvest_invoice_paid_date,
        harvest_invoice_issue_date,
        harvest_invoice_due_date,

        harvest_invoice_created_at,
        harvest_invoice_sent_at,
        harvest_invoice_paid_at,
        harvest_invoice_updated_at

    from int_harvest__invoices

)

select * from final
    );
  