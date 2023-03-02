

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__clients`
  OPTIONS(
      description=""""""
    )
  as with stg_harvest__clients as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__clients`

)

select * from stg_harvest__clients;

