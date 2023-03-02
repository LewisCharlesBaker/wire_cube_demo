with issue_multiselect_history as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_multiselect_history`
    
), 

fields as (
      
    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__field`

), 

joined as (
  
  select
    issue_multiselect_history.*,
    fields.field_name

  from issue_multiselect_history
  join fields using (field_id)

)

select *
from joined