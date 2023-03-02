

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_harvest__project_users`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

   select * from `ra-development`.`stitch_harvest`.`project_users`    

),

base as (

   select

      cast(id as numeric) as harvest_project_user_natural_key,
      cast(user_id as numeric) as harvest_employee_natural_key,
      cast(project_id as numeric) as harvest_project_natural_key,

      cast(hourly_rate as numeric) as harvest_project_user_hourly_rate,
      cast(budget as numeric) as harvest_project_user_budget,

      cast(is_active as boolean) as harvest_project_user_is_active,

      cast(created_at as timestamp) as harvest_project_user_created_at,
      cast(updated_at as timestamp) as harvest_project_user_updated_at,


   from source

)

select * from base;

