

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__invoices`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

   select * from `ra-development`.`stitch_harvest`.`invoices`    

),

deduplicated as (

   select unique.*
    from (
        select
            array_agg (
                original
                order by _sdc_batched_at desc
                limit 1
            )[offset(0)] unique
        from source original
        group by id
    )

),

base as (

   select

      cast(id as numeric) as harvest_invoice_natural_key,
      cast(client_id as numeric) as harvest_client_natural_key,
      cast(creator_id as numeric) as harvest_creator_natural_key,
      
      lower(cast(client_key as string)) as harvest_invoice_client_key,

      lower(cast(number as string)) as harvest_invoice_number,
      lower(cast(purchase_order as string)) as harvest_invoice_purchase_order,
      lower(cast(state as string)) as harvest_invoice_state,
      lower(cast(notes as string)) as harvest_invoice_notes,
      lower(cast(subject as string)) as harvest_invoice_subject,
      lower(cast(currency as string)) as harvest_invoice_currency,
      lower(cast(payment_term as string)) as harvest_invoice_payment_term,

      nullif(cast(amount as numeric),0) as harvest_invoice_amount,
      nullif(cast(due_amount as numeric),0) as harvest_invoice_due_amount,

      nullif(cast(discount_amount as numeric),0) as harvest_invoice_discount_amount,
      nullif(cast(discount as numeric),0) as harvest_invoice_discount,

      nullif(cast(tax_amount as numeric),0) as harvest_invoice_tax_amount,
      nullif(cast(tax as numeric),0) as harvest_invoice_tax,

      cast(period_start as timestamp) as harvest_invoice_period_start,
      cast(period_end as timestamp) as harvest_invoice_period_end,

      cast(paid_date as timestamp) as harvest_invoice_paid_date,
      cast(issue_date as timestamp) as harvest_invoice_issue_date,
      cast(due_date as timestamp) as harvest_invoice_due_date,

      cast(created_at as timestamp) as harvest_invoice_created_at,
      cast(sent_at as timestamp) as harvest_invoice_sent_at,
      cast(paid_at as timestamp) as harvest_invoice_paid_at,
      cast(updated_at as timestamp) as harvest_invoice_updated_at

   from deduplicated

)

select * from base;

