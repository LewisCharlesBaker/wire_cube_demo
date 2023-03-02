-- issue-epic relationships are either captured via the issue's parent_issue_id (next-gen projects)
-- or through the 'Epic Link' field (classic projects)
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
),epic_field_history as (

    select *
    from __dbt__cte__int_jira__issue_field_history
    where lower(field_name) like 'epic%link'
    
),

order_epic_links as (

    select
        issue_id,
        cast(field_value as INT64 ) as epic_issue_id,

        row_number() over (
                partition by issue_id order by updated_at desc
                ) as row_num

    from epic_field_history
),

last_epic_link as (

    select 
      issue_id, 
      epic_issue_id 
    
    from order_epic_links
    where row_num = 1
)

select *
from last_epic_link