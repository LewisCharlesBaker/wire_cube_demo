

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__invoice_line_items`
  OPTIONS(
      description=""""""
    )
  as with stg_harvest__invoice_line_items as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__invoice_line_items`

)

select * from stg_harvest__invoice_line_items;

