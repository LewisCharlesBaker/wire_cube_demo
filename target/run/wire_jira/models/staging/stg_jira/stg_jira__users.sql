

  create or replace view `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__users`
  OPTIONS(
      description=""""""
    )
  as 

with source as (

    select * from `ra-development`.`fivetran_jira`.`user`    

),

base as (

    select
	
        lower(cast(id as string)) as jira_user_natural_key,

        lower(cast(name as string)) as jira_user_name,
        lower(cast(email as string)) as jira_user_email,
        lower(cast(locale as string)) as jira_user_locale,
        lower(cast(time_zone as string)) as jira_user_time_zone

    from source

)

select * from base;

