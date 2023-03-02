
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__issue_type_parents`
    
    
    OPTIONS(
      description="""Table relating issues with data regarding their parent issues (which may be epics). Contains all columns present in `stg_jira__issue`.\n"""
    )
    as (
      
-- needs to be a view to use the dbt_utils.star macro in int_jira__issue_users

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
),  __dbt__cte__int_jira__issue_epic as (
-- issue-epic relationships are either captured via the issue's parent_issue_id (next-gen projects)
-- or through the 'Epic Link' field (classic projects)
with epic_field_history as (

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
),issue as (

    select * 
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue`
    
),

issue_type as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_type`
), 
-- issue-epic relationships are either captured via the issue's parent_issue_id (next-gen projects)
-- or through the 'Epic Link' field (classic projects)

issues_w_epics as (

  select * 
  from __dbt__cte__int_jira__issue_epic

), 

issue_enriched_with_epics as (

  select
  
    issue.*,
    coalesce(parent_issue_id, epic_issue_id) as revised_parent_issue_id
  
  from issue
  
  left join issues_w_epics on issues_w_epics.issue_id = issue.issue_id

), 

issue_w_types as (

    select 

        issue_enriched_with_epics.*,
        issue_type.issue_type_name as issue_type
        
    from issue_enriched_with_epics 
    
    left join issue_type on issue_type.issue_type_id = issue_enriched_with_epics.issue_type_id
),

add_parent_info as (

    select
        issue_w_types.*,
        parent.issue_type as parent_issue_type,
        parent.issue_name as parent_issue_name,
        parent.issue_key as parent_issue_key,
        lower(coalesce(parent.issue_type, '')) = 'epic' as is_parent_epic

    from
    issue_w_types

    -- do a left join so we can grab all issue types from this table in `issue_join`
    left join issue_w_types as parent on issue_w_types.revised_parent_issue_id = parent.issue_id

)

select * 
from add_parent_info
    );
  