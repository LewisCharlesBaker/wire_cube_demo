

with int_jira__sprints as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__sprints`

),

final as (

    select

        
    
to_hex(md5(cast(coalesce(cast(jira_sprint_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_sprint_pk,

        
    
to_hex(md5(cast(coalesce(cast(jira_project_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_project_fk,

        jira_sprint_name,
        jira_sprint_goal,

        jira_sprint_state,

        jira_start_at_date,
        jira_complete_at_date,
        jira_end_at_date

    from int_jira__sprints

)

select * from final