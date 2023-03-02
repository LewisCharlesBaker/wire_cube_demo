

with source as (

    select * from `ra-development`.`fivetran_jira`.`issue_board`    

),

base as (

    select
	
        lower(cast(board_id as string)) as jira_board_natural_key,	
        cast(issue_id as numeric) as jira_issue_natural_key

    from source

)

select * from base