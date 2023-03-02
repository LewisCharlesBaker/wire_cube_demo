

with source as (

   select * from `ra-development`.`stitch_harvest`.`user_roles`

),

base as (

   select

      cast(user_id as numeric) as harvest_employee_natural_key,
      cast(role_id as numeric) as harvest_role_natural_key,

   from source

)

select * from base