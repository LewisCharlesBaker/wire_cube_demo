

with wh_delivery__harvest_invoices_fact as (

    select * from `ra-development`.`lewis_analytics_dev`.`wh_delivery__harvest_invoices_fact`

),

wh_delivery__harvest_expenses_fact as (

    select * from `ra-development`.`lewis_analytics_dev`.`wh_delivery__harvest_expenses_fact`

),

wh_delivery__harvest_invoice_line_items_fact as (

    select * from `ra-development`.`lewis_analytics_dev`.`wh_delivery__harvest_invoice_line_items_fact`

),

joined as (

    select distinct
    
        wh_delivery__harvest_invoices_fact.harvest_invoice_pk,
        wh_delivery__harvest_invoices_fact.harvest_client_fk,
        
        wh_delivery__harvest_invoices_fact.harvest_invoice_tax_amount,
        
        wh_delivery__harvest_invoices_fact.harvest_invoice_created_at,
        
        sum(wh_delivery__harvest_invoice_line_items_fact.harvest_invoice_line_item_services_amount_billed) +
        sum(wh_delivery__harvest_invoice_line_items_fact.harvest_invoice_line_item_license_referral_fee_amount_billed) as harvest_invoice_revenue_amount_billed,
    
    from wh_delivery__harvest_invoices_fact

    left join wh_delivery__harvest_invoice_line_items_fact
    on wh_delivery__harvest_invoice_line_items_fact.harvest_invoice_fk = wh_delivery__harvest_invoices_fact.harvest_invoice_pk

    group by 1,2,3,4

), 

invoice_aggregates as (

    select

        harvest_invoice_pk,
        
        harvest_invoice_revenue_amount_billed,
        row_number() over (partition by harvest_client_fk order by harvest_invoice_created_at) as harvest_client_invoice_sequence_nunber

    from joined

)

select * from invoice_aggregates