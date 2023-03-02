

with source as (

   select * from `ra-development`.`stitch_harvest`.`project_tasks`    

),

base as (

   select

      cast(id as numeric) as harvest_project_task_natural_key,
      cast(project_id as numeric) as harvest_project_natural_key,
      cast(task_id as numeric) as harvest_task_natural_key,

      cast(hourly_rate as numeric) as harvest_project_task_hourly_rate,
      cast(budget as numeric) as harvest_project_task_budget,

      cast(is_active as boolean) as harvest_project_task_is_active,
      cast(billable as boolean) as harvest_project_task_is_billable,

      cast(created_at as timestamp) as harvest_project_task_created_at,
      cast(updated_at as timestamp) as harvest_project_task_updated_at

   from source

)

select * from base