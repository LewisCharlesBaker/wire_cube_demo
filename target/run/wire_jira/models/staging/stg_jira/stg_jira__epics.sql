

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__epics`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

    select * from `ra-development`.`fivetran_jira`.`epic`    

),

base as (

    select
	
        cast(id as numeric) as jira_epic_natural_key,

        lower(cast(name as string)) as jira_epic_name,
        lower(cast(summary as string)) as jira_epic_summary,
        cast(done as boolean) as jira_epic_is_done,
        lower(cast(key as string)) as jira_epic_key
 
    from source

)

select * from base;

