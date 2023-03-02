

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__invoices`
  OPTIONS(
      description=""""""
    )
  as with stg_harvest__invoices as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__invoices`

)

select * from stg_harvest__invoices;

