

with wh_delivery__issues_fact as (

    select * from `ra-development`.`lewis_analytics_dev`.`wh_delivery__jira_issues_fact`

),

final as (

    select

        
    
to_hex(md5(cast(coalesce(cast(jira_issue_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_issue_summary_pk,

        case
            when jira_issue_summary like "%stage%"
                and jira_issue_summary like "%warehouse%"
                then "warehouse staging layer"
            when jira_issue_summary like "%integrate%"
                and jira_issue_summary like "%warehouse%"
                then "warehouse integration layer"
            when jira_issue_summary like "%warehouse%"
                and jira_issue_summary like "%warehouse%"
                then "warehouse warehousing layer"

            when jira_issue_summary like "%stage%"
                and jira_issue_summary like "%bi%"
                then "bi staging layer"
            when jira_issue_summary like "%integrate%"
                and jira_issue_summary like "%bi%"
                then "bi integration layer"
            when jira_issue_summary like "%aggregate%"
                and jira_issue_summary like "%bi%"
                then "bi aggregate layer"

            when jira_issue_summary like "%stage%"
                and jira_issue_summary like "%looker%"
                then "bi staging layer"
            when jira_issue_summary like "%integrate%"
                and jira_issue_summary like "%looker%"
                then "bi integration layer"
            when jira_issue_summary like "%aggregate%"
                and jira_issue_summary like "%looker%"
                then "looker aggregate layer"

        end as jira_issue_development_stage,

        cast( timestamp_diff(jira_issue_resolved_at_ts, jira_issue_created_at_ts, day) as numeric) as jira_issue_duration,
        cast( timestamp_diff( current_date(), date(jira_issue_created_at_ts), day) as numeric) as jira_issue_age_in_days,

        case 
            when jira_issue_story_point_estimate = 0.5
                then 0.5
            when jira_issue_story_point_estimate = 1
                then 1
            when jira_issue_story_point_estimate = 2
                then 2            
            when jira_issue_story_point_estimate = 3
                then 3
            when jira_issue_story_point_estimate = 4
                then 5
            when jira_issue_story_point_estimate = 5
                then 5      
            when jira_issue_story_point_estimate = 6
                then 5    
            when jira_issue_story_point_estimate >6 or jira_issue_story_point_estimate <=8
                then 8
            when jira_issue_story_point_estimate >8
                then 16
        end as jira_issue_summary_story_point_estimate,







    from wh_delivery__issues_fact
    
)

select * from final