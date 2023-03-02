with stg_jira__boards as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__boards`

),

stg_jira__project_board as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__project_board`

),

joined as (

    select

        stg_jira__boards.jira_board_natural_key,
        stg_jira__project_board.jira_project_natural_key,

        stg_jira__boards.jira_board_name,
        stg_jira__boards.jira_board_type
    
    from stg_jira__boards

    left join stg_jira__project_board
    on stg_jira__project_board.jira_board_natural_key = stg_jira__boards.jira_board_natural_key

)

select * from joined