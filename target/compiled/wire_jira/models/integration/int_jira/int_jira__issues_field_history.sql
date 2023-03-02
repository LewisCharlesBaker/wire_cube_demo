with int_jira_intermediate__issues_pivot as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira_intermediate__issues_pivot`

),

stg_jira__status as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__statuses`

),

base as (

    select

        jira_field_natural_key,
        jira_issue_natural_key,

        row_number() over(partition by jira_issue_natural_key order by jira_issue_field_history_timestamp) as issue_field_history_index,

        jira_issue_field_history_is_active,
        
        cast(jira_issue_field_history_story_point_estimate as numeric) as jira_issue_field_history_story_point_estimate,
        cast(jira_issue_field_history_status as numeric) as jira_status_natural_key,

        jira_issue_field_history_timestamp

    from int_jira_intermediate__issues_pivot

),

joined as (

    select 

        base.*,
        stg_jira__status.jira_status_description as jira_issue_field_history_status_description,
        stg_jira__status.jira_status_name as jira_issue_field_history_status_name

    from base

    left join stg_jira__status
    on base.jira_status_natural_key = stg_jira__status.jira_status_natural_key

)

select * from joined