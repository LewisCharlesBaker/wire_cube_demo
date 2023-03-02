

with source as (

    select * from `ra-development`.`fivetran_jira`.`sprint`    

),

base as (

    select
	
        cast(id as string) as jira_sprint_natural_key,
        lower(cast(board_id as string)) as jira_sprint_board_natural_key,

        lower(cast(name as string)) as jira_sprint_name,
        lower(cast(goal as string)) as jira_sprint_goal,
        lower(cast(state as string)) as jira_sprint_state,

        cast(start_date as date) as jira_start_at_date,
        cast(complete_date as date) as jira_complete_at_date,
        cast(end_date as date) as jira_end_at_date

    from source

)

select * from base