

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__projects`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

    select * from `ra-development`.`fivetran_jira`.`project`    

),

base as (

    select

        cast(id as numeric) as jira_project_natural_key,
        lower(cast(lead_id as string)) as jira_project_lead_natural_key,

        lower(cast(name as string)) as jira_project_name,
        lower(cast(description as string)) as jira_project_description,
        lower(cast(key as string)) as jira_project_key,
        lower(cast(project_type_key as string)) as jira_project_project_type_key
        
    from source

)

select * from base;

