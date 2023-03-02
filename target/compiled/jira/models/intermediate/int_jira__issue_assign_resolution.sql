with  __dbt__cte__int_jira__issue_field_history as (
with field_history as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_field_history`
    
), 

fields as (
      
    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__field`

), 

joined as (
  
  select
    field_history.*,
    fields.field_name

  from field_history
  join fields using (field_id)

)

select *
from joined
),issue_field_history as (
    
    select *
    from __dbt__cte__int_jira__issue_field_history

), 

filtered as (
    -- we're only looking at assignments and resolutions, which are single-field values
    select *
    from issue_field_history

    where (lower(field_id) = 'assignee'
    or lower(field_id) = 'resolutiondate')

    and field_value is not null -- remove initial null rows
),

issue_dates as (

    select

        issue_id,
        min(case when field_id = 'assignee' then updated_at end) as first_assigned_at,
        max(case when field_id = 'assignee' then updated_at end) as last_assigned_at,
        min(case when field_id = 'resolutiondate' then updated_at end) as first_resolved_at -- in case it's been re-opened

    from filtered
    group by 1
)

select *
from issue_dates