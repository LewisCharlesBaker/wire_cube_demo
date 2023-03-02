

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__employees`
  OPTIONS(
      description=""""""
    )
  as with stg_harvest__employee as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__employee`

)

select * from stg_harvest__employee;

