

with source as (

   select * from `ra-development`.`stitch_harvest`.`invoice_line_items`    

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

      cast(id as numeric) as harvest_invoice_line_item_natural_key,
      cast(project_id as numeric) as harvest_project_natural_key,
      cast(invoice_id as numeric) as harvest_invoice_natural_key,

      lower(cast(kind as string)) as harvest_invoice_line_item_kind,
      lower(cast(description as string)) as harvest_invoice_line_item_description,

      ifnull(cast(amount as numeric),0) as harvest_invoice_line_item_amount,
      ifnull(cast(unit_price as numeric),0) as harvest_invoice_line_item_unit_price,
      ifnull(cast(quantity as numeric),0) as harvest_invoice_line_item_quantity,

      ifnull((case when lower(kind) = 'service' then amount end),0) as harvest_invoice_line_item_services_amount_billed,
      ifnull((case when lower(kind) = 'license referral fee' then amount end),0) as harvest_invoice_line_item_license_referral_fee_amount_billed,
      ifnull((case when lower(kind) = 'product' then amount end),0) as harvest_invoice_line_item_expenses_amount_billed,
      ifnull((case when lower(kind) = 'support' then amount end),0) as harvest_invoice_line_item_support_amount_billed,

      cast(taxed as boolean) as harvest_invoice_line_item_is_taxed

   from deduplicated

)

select * from base