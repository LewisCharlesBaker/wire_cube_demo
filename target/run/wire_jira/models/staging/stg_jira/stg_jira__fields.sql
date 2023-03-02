

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__fields`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

    select * from `ra-development`.`fivetran_jira`.`field`    

),

base as (

    select
	
        lower(cast(id as string)) as jira_field_natural_key,

        lower(cast(name as string)) as jira_field_name,

        cast(is_array as boolean) as jira_field_is_array,
        cast(is_custom as boolean) as jira_field_is_custom

    from source

)

select * from base;

