

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__employee`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

   select * from `ra-development`.`stitch_harvest`.`users`    

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

      cast(id as numeric) as harvest_employee_natural_key,

      lower(cast(first_name as string)) as harvest_employee_first_name,
      lower(cast(last_name as string)) as harvest_employee_last_name,
      lower(cast(first_name as string)) || " " || lower(cast(last_name as string)) as harvest_employee_full_name,
     
      lower(cast(email as string)) as harvest_employee_email,

      cast(weekly_capacity as numeric) as harvest_employee_weekly_capacity,
      cast(cost_rate as numeric) as harvest_employee_cost_rate,
      cast(default_hourly_rate as numeric) as harvest_employee_default_hourly_rate,

      cast(is_contractor as boolean) as harvest_employee_is_contractor,
      cast(is_active as boolean) as harvest_employee_is_active,
      
      cast(created_at as timestamp) as harvest_employee_created_at_ts,
      cast(updated_at as timestamp) as harvest_employee_updated_at_ts

   from deduplicated

)

select * from base;

