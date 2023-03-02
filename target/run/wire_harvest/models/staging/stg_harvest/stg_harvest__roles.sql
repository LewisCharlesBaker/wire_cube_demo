

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__roles`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

   select * from `ra-development`.`stitch_harvest`.`roles`    

),

base as (

   select

      cast(id as numeric) as harvest_role_natural_key,

      lower(cast(name as string)) as harvest_role_name,

      cast(created_at as timestamp) as harvest_role_created_at_ts,
      cast(updated_at as timestamp) as harvest_role_updated_at_ts

   from source

)

select * from base;

