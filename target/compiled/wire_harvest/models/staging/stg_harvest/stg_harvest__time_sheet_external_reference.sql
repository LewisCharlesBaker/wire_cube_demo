

with source as (

   select * from `ra-development`.`stitch_harvest`.`time_entry_external_reference`    

),

base as (

   select

      cast(time_entry_id as numeric) as harvest_timesheet_natural_key,
      cast(external_reference_id as numeric) as harvest_external_reference_natural_key,

   from source

)

select * from base