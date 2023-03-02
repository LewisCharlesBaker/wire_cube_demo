
  
    

    create or replace table `ra-development`.`lewis_analytics_dev`.`wh_delivery__harvest_tasks_dim`
    
    
    OPTIONS(
      description=""""""
    )
    as (
      

with int_harvest__tasks as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__tasks`

),

final as (

    select 

        
    
to_hex(md5(cast(coalesce(cast(harvest_task_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_task_pk,

        harvest_task_name,

        harvest_task_default_hourly_rate,

        harvest_task_is_billable_by_default,
        harvest_task_is_default,
        harvest_task_is_active,

        harvest_task_created_at_ts,
        harvest_task_updated_at_ts

    from int_harvest__tasks

)

select * from final
    );
  