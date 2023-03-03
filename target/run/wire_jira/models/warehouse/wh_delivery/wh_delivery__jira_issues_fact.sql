
  
    

    create or replace table `ra-development`.`lewis_analytics_dev`.`wh_delivery__jira_issues_fact`
    
    
    OPTIONS(
      description=""""""
    )
    as (
      

with int_jira__issues as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__issues`

),

final as (

    select distinct

        
    
to_hex(md5(cast(coalesce(cast(jira_issue_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_issue_pk,

        
    
to_hex(md5(cast(coalesce(cast(jira_issue_parent_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_issue_parent_fk,

        
    
to_hex(md5(cast(coalesce(cast(jira_issue_assignee as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_user_fk,

        
    
to_hex(md5(cast(coalesce(cast(jira_creator_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_creator_fk,

        
    
to_hex(md5(cast(coalesce(cast(jira_reporter_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_reporter_fk,

        
    
to_hex(md5(cast(coalesce(cast(jira_resolution_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_resolution_fk,        

        
    
to_hex(md5(cast(coalesce(cast(jira_current_sprint_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_current_sprint_fk, 

        
    
to_hex(md5(cast(coalesce(cast(jira_issue_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_external_reference_jira_fk, 

        jira_issue_natural_key,
        jira_issue_summary,
        jira_issue_description,
        jira_issue_project,
        jira_issue_assignee,
        jira_issue_reporter,
        jira_issue_priority,
        jira_issue_creator,
        jira_issue_issue_type,
        jira_issue_key,

        jira_issue_status_description,
        jira_issue_status_name,

        case 
            when jira_issue_status_name = 'to do'
                then  '1'
            when jira_issue_status_name = 'design in progress'
                then  '2'
            when jira_issue_status_name = 'in progress'
                then  '2'
            when jira_issue_status_name = 'warehouse in progress'
                then  '3'
            when jira_issue_status_name = 'in progress dbt'
                then  '3'                
            when jira_issue_status_name = 'warehouse qa'
                then  '4'
            when jira_issue_status_name = 'looker in progess'
                then  '5'
            when jira_issue_status_name = 'looker in progress'
                then  '5'
            when jira_issue_status_name = 'looker qa'
                then  '6'
            when jira_issue_status_name = 'internal qa'
                then  '6'
            when jira_issue_status_name = 'blocked'
                then  '7'
            when jira_issue_status_name = 'done'
                then  '8'

            else null

        end as jira_issue_status_stage,

        case 
            when jira_issue_status_name = 'done'
                then true
            else false
        end as jira_issue_is_done,

        jira_issue_type,
        jira_issue_parent_issue_type,
        jira_issue_parent_issue_name,
        jira_issue_is_parent_epic,
        jira_issue_resolution_type,
        jira_issue_work_ratio,
        jira_issue_status,
        jira_issue_conversation,
        jira_issue_current_status,
        jira_issue_current_status_category,
        jira_issue_current_priority,
        jira_issue_sprint,
        jira_issue_current_sprint_name,
        jira_issue_is_active_sprint,
        jira_issue_fixes_versions,

        jira_issue_count_sprint_changes,
        jira_issue_time_spent_seconds,
        jira_issue_count_comments,
        jira_issue_open_duration_seconds,
        jira_issue_any_assignment_duration_seconds,
        jira_issue_last_assignment_duration_seconds,

        jira_issue_story_point_estimate,
        jira_issue_original_estimate,
        jira_issue_remaining_estimate,

        jira_issue_sprint_started_at,
        jira_issue_sprint_ended_at,
        jira_issue_sprint_completed_at,
        jira_issue_first_assigned_at,
        jira_issue_last_assigned_at,
        jira_issue_first_resolved_at,

        jira_issue_status_category_changed_at_ts,
        jira_issue_resolved_at_ts,
        jira_issue_last_viewed_at_ts,
        jira_issue_due_date_at_ts,
        jira_issue_created_at_ts,
        jira_issue_updated_at_ts

    from int_jira__issues

)

select * from final
    );
  