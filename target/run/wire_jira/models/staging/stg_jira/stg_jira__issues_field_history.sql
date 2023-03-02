

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__issues_field_history`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

    select * from `ra-development`.`fivetran_jira`.`issue_field_history`    

),

base as (

    select

        lower(cast(field_id as string)) as jira_field_natural_key,
        lower(cast(author_id as string)) as jira_issue_field_history_author_natural_key,
        cast(issue_id as numeric) as jira_issue_natural_key,

        lower(cast(value as string)) as jira_issue_field_history_value,
   
        cast(is_active as boolean) as jira_issue_field_history_is_active,

        cast(time as timestamp) as jira_issue_field_history_timestamp        
        
    from source

)

select * from base;

