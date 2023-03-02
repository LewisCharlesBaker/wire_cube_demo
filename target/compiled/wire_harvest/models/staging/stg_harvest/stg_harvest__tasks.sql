

with source as (

   select * from `ra-development`.`stitch_harvest`.`tasks`    

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

      cast(id as numeric) as harvest_task_natural_key,

      lower(cast(name as string)) as harvest_task_name,

      cast(default_hourly_rate as numeric) as harvest_task_default_hourly_rate,

      cast(billable_by_default as boolean) as harvest_task_is_billable_by_default,
      cast(is_default as boolean) as harvest_task_is_default,
      cast(is_active as boolean) as harvest_task_is_active,

      cast(created_at as timestamp) as harvest_task_created_at_ts,
      cast(updated_at as timestamp) as harvest_task_updated_at_ts

   from deduplicated

)

select * from base