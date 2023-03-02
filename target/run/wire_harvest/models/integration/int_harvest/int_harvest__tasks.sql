

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__tasks`
  OPTIONS(
      description=""""""
    )
  as with stg_harvest__tasks as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__tasks`

)

select * from stg_harvest__tasks;

