

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__clients`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

   select * from `ra-development`.`stitch_harvest`.`clients`    

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

      cast(id as numeric) as harvest_client_natural_key,

      lower(cast(currency as string)) as harvest_client_currency,
      lower(replace(replace(replace(name,'limited',''),'ltd',''),', inc.','')) as harvest_client_name,

      cast(is_active as boolean) as harvest_client_is_active,

      cast(created_at as timestamp) as harvest_client_created_at_ts,
      cast(updated_at as timestamp) as harvest_client_updated_at_ts

   from deduplicated

)

select * from base;

