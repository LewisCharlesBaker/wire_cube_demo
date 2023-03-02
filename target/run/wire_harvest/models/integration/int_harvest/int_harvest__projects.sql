

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__projects`
  OPTIONS(
      description=""""""
    )
  as with stg_harvest__projects as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__projects`

)

select * from stg_harvest__projects;

