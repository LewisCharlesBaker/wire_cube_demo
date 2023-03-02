

with source as (

    select * from `ra-development`.`fivetran_jira`.`status`    

),

base as (

    select
	
        cast(id as numeric) as jira_status_natural_key,
        cast(status_category_id as numeric) as jira_status_category_natural_key,

        lower(cast(description as string)) as jira_status_description,
        lower(cast(name as string)) as jira_status_name
        
    from source

)

select * from base