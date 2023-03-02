

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__boards`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

    select * from `ra-development`.`fivetran_jira`.`board`    

),

base as (

    select
	
        lower(cast(id as string)) as jira_board_natural_key,

        lower(cast(name as string)) as jira_board_name,
        lower(cast(type as string)) as jira_board_type

    from source

)

select * from base;

