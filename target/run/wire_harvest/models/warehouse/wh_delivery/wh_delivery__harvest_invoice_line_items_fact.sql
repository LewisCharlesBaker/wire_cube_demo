
  
    

    create or replace table `ra-development`.`lewis_analytics_dev`.`wh_delivery__harvest_invoice_line_items_fact`
    
    
    OPTIONS(
      description=""""""
    )
    as (
      

with int_harvest__invoice_line_items as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__invoice_line_items`

),

final as (

    select 

        
    
to_hex(md5(cast(coalesce(cast(harvest_invoice_line_item_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_invoice_line_item_pk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_project_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_project_fk,

        
    
to_hex(md5(cast(coalesce(cast(harvest_invoice_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_invoice_fk,

        harvest_invoice_line_item_kind,
        harvest_invoice_line_item_description,

        harvest_invoice_line_item_amount,
        harvest_invoice_line_item_unit_price,
        harvest_invoice_line_item_quantity,

        harvest_invoice_line_item_services_amount_billed,
        harvest_invoice_line_item_license_referral_fee_amount_billed,
        harvest_invoice_line_item_expenses_amount_billed,
        harvest_invoice_line_item_support_amount_billed,

        harvest_invoice_line_item_is_taxed

    from int_harvest__invoice_line_items

)

select * from final
    );
  