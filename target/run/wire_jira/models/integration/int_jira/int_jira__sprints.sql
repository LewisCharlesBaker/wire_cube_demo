

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_jira__sprints`
  OPTIONS(
      description=""""""
    )
  as with stg_jira__sprints as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__sprints`

),

int_jira__boards as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__boards`

),

joined as (

    select

        stg_jira__sprints.jira_sprint_natural_key,
        int_jira__boards.jira_board_natural_key,
        int_jira__boards.jira_project_natural_key,

        stg_jira__sprints.jira_sprint_name,
        stg_jira__sprints.jira_sprint_goal,
        stg_jira__sprints.jira_sprint_state,

        stg_jira__sprints.jira_start_at_date,
        stg_jira__sprints.jira_complete_at_date,
        stg_jira__sprints.jira_end_at_date
    
    from stg_jira__sprints

    left join int_jira__boards
    on int_jira__boards.jira_board_natural_key = stg_jira__sprints.jira_sprint_board_natural_key

)

select * from joined;

