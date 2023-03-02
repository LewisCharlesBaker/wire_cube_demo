

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_jira__fields`
  OPTIONS(
      description=""""""
    )
  as with stg_jira__fields as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__fields`

)

select * from stg_jira__fields;

