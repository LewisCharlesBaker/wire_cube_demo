

with source as (

   select * from `ra-development`.`stitch_harvest`.`projects`    

),

deduplicated as (

   select unique.*
    from (
        select
            array_agg (
                original
                order by updated_at desc
                limit 1
            )[offset(0)] unique
        from source original
        group by id
    )

),

base as (

   select

      cast(id as numeric) as harvest_project_natural_key,
      cast(client_id as numeric) as harvest_client_natural_key,

      lower(cast(name as string)) as harvest_project_name,
      lower(cast(code as string)) as harvest_project_code,
      lower(cast(notes as string)) as harvest_project_notes,

      lower(cast(bill_by as string)) as harvest_project_bill_by,
      lower(cast(budget_by as string)) as harvest_project_budget_by,

      cast(hourly_rate as numeric) as harvest_project_hourly_rate,
      cast(cost_budget as numeric) as harvest_project_cost_budget,
      cast(fee as numeric) as harvest_project_fee,
      cast(budget as numeric) as harvest_project_budget,
      cast(over_budget_notification_percentage as numeric) as harvest_project_over_budget_notification_percentage,

      cast(show_budget_to_all as boolean) as harvest_project_show_budget_to_all,
      cast(cost_budget_include_expenses as boolean) as harvest_project_cost_budget_include_expenses,
      cast(budget_is_monthly as boolean) as harvest_project_budget_is_monthly,
      cast(notify_when_over_budget as boolean) as harvest_project_notify_when_over_budget,
      cast(is_billable as boolean) as harvest_project_is_billable,
      cast(is_fixed_fee as boolean) as harvest_project_is_fixed_fee,
      cast(is_active as boolean) as harvest_project_is_active,

      cast(over_budget_notification_date as timestamp) as harvest_project_over_budget_notification_date,
      cast(created_at as timestamp) as harvest_project_created_at,
      cast(ends_on as timestamp) as harvest_project_ends_on,
      cast(updated_at as timestamp) as harvest_project_updated_at,
      cast(starts_on as timestamp) as harvest_project_starts_on

   from deduplicated

)

select * from base