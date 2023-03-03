


with int_jira_intermediate__issues as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira_intermediate__issues`

),

pivot_issue_history as (


    select 
    
      jira_issue_natural_key,
      jira_field_natural_key,

      

      status as jira_issue_field_history_status,

      

      assignee as jira_issue_field_history_assignee,

      

      resolution as jira_issue_field_history_resolution,

      

      story_point_estimate as jira_issue_field_history_story_point_estimate,

      

      description as jira_issue_field_history_description,

      

      summary as jira_issue_field_history_summary,

      

      parent as jira_issue_field_history_parent,

      

      start_date as jira_issue_field_history_start_date,

      

      due_date as jira_issue_field_history_due_date,

      

      end_date as jira_issue_field_history_end_date,

      

      source as jira_issue_field_history_source,

      

      issue_type as jira_issue_field_history_issue_type,

      

      epic_link as jira_issue_field_history_epic_link,

      

      project as jira_issue_field_history_project,

      

      remaining_estimate as jira_issue_field_history_remaining_estimate,

      

      reporter as jira_issue_field_history_reporter,

      

      original_estimate as jira_issue_field_history_original_estimate,

      

      priority as jira_issue_field_history_priority,

      

      time_spent as jira_issue_field_history_time_spent,

      

      baseline_end_date as jira_issue_field_history_baseline_end_date,

      

      baseline_start_date as jira_issue_field_history_baseline_start_date,

      

      satisfaction_date as jira_issue_field_history_satisfaction_date,

      

      satisfaction as jira_issue_field_history_satisfaction,

      

      hubspot_ticket_count__hub_id__4402794_ as jira_issue_field_history_hubspot_ticket_count__hub_id__4402794_,

      

      issue_color as jira_issue_field_history_issue_color,

      

      request_type as jira_issue_field_history_request_type,

      

      creator as jira_issue_field_history_creator,

      

      _remaining_estimate as jira_issue_field_history__remaining_estimate,

      

      operational_categorization as jira_issue_field_history_operational_categorization,

      

      affected_hardware as jira_issue_field_history_affected_hardware,

      

      severity as jira_issue_field_history_severity,

      

      status_category_changed as jira_issue_field_history_status_category_changed,

      

      change_completion_date as jira_issue_field_history_change_completion_date,

      

      product_categorization as jira_issue_field_history_product_categorization,

      

      number_of_linked_intercom_conversations as jira_issue_field_history_number_of_linked_intercom_conversations,

      

      change_reason as jira_issue_field_history_change_reason,

      

      change_start_date as jira_issue_field_history_change_start_date,

      

      planned_start_date as jira_issue_field_history_planned_start_date,

      

      planned_end_date as jira_issue_field_history_planned_end_date,

      

      security_level as jira_issue_field_history_security_level,

      

      created as jira_issue_field_history_created,

      

      change_type as jira_issue_field_history_change_type,

      

      change_risk as jira_issue_field_history_change_risk,

      

      backout_plan as jira_issue_field_history_backout_plan,

      

      test_plan as jira_issue_field_history_test_plan,

      

      resolved as jira_issue_field_history_resolved,

      

      work_ratio as jira_issue_field_history_work_ratio,

      

      parent_link as jira_issue_field_history_parent_link,

      

      investigation_reason as jira_issue_field_history_investigation_reason,

      

      root_cause as jira_issue_field_history_root_cause,

      

      workaround as jira_issue_field_history_workaround,

      

      updated as jira_issue_field_history_updated,

      

      target_start as jira_issue_field_history_target_start,

      

      accelo as jira_issue_field_history_accelo,

      

      _time_spent as jira_issue_field_history__time_spent,

      

      last_viewed as jira_issue_field_history_last_viewed,

      

      program_increment as jira_issue_field_history_program_increment,

      

      task_progress as jira_issue_field_history_task_progress,

      

      target_end as jira_issue_field_history_target_end,

      

      _original_estimate as jira_issue_field_history__original_estimate,

      

      impact as jira_issue_field_history_impact,

      

      urgency as jira_issue_field_history_urgency,

      

      pending_reason as jira_issue_field_history_pending_reason,

      

      implementation_plan as jira_issue_field_history_implementation_plan,

      

      environment as jira_issue_field_history_environment,

      

      planned_end as jira_issue_field_history_planned_end,

      

      planned_start as jira_issue_field_history_planned_start,

      

      linked_intercom_conversation_ids as jira_issue_field_history_linked_intercom_conversation_ids,

      

      time_to_first_response as jira_issue_field_history_time_to_first_response,

      

      time_to_resolution as jira_issue_field_history_time_to_resolution,

      

      work_category as jira_issue_field_history_work_category,

      

      risk_consequence as jira_issue_field_history_risk_consequence,

      

      risk_probability as jira_issue_field_history_risk_probability,

      

      time_to_close_after_resolution as jira_issue_field_history_time_to_close_after_resolution,

      

      time_to_review_normal_change as jira_issue_field_history_time_to_review_normal_change,

      

      team as jira_issue_field_history_team,

      

      rank as jira_issue_field_history_rank,

      

      development as jira_issue_field_history_development,

      

      total_forms as jira_issue_field_history_total_forms,

      

      submitted_forms as jira_issue_field_history_submitted_forms,

      

      locked_forms as jira_issue_field_history_locked_forms,

      

      open_forms as jira_issue_field_history_open_forms,

      

      compass as jira_issue_field_history_compass,

      

      category as jira_issue_field_history_category,

      

      external_issue_id as jira_issue_field_history_external_issue_id,

      

      deliverable_id as jira_issue_field_history_deliverable_id,

      

      deliverable_type as jira_issue_field_history_deliverable_type,

      

      development_stage as jira_issue_field_history_development_stage,

      

      story_points as jira_issue_field_history_story_points,

      

      key as jira_issue_field_history_key,

      

      product as jira_issue_field_history_product,

      

      acceptance_criteria as jira_issue_field_history_acceptance_criteria,

      

      epic_name as jira_issue_field_history_epic_name,

      

      domain as jira_issue_field_history_domain,

      

      position_in_hierarchy_ as jira_issue_field_history_position_in_hierarchy_,

      

      epic_status as jira_issue_field_history_epic_status,

      

      epic_color as jira_issue_field_history_epic_color,

      

      bug_category as jira_issue_field_history_bug_category,

      

      jira_issue_field_history_timestamp,
      jira_issue_field_history_is_active
    
    from

      (select * from int_jira_intermediate__issues)
        pivot(string_agg(jira_issue_field_history_value) for field_name in ( 

      

      'status'

      ,

      

      'assignee'

      ,

      

      'resolution'

      ,

      

      'story_point_estimate'

      ,

      

      'description'

      ,

      

      'summary'

      ,

      

      'parent'

      ,

      

      'start_date'

      ,

      

      'due_date'

      ,

      

      'end_date'

      ,

      

      'source'

      ,

      

      'issue_type'

      ,

      

      'epic_link'

      ,

      

      'project'

      ,

      

      'remaining_estimate'

      ,

      

      'reporter'

      ,

      

      'original_estimate'

      ,

      

      'priority'

      ,

      

      'time_spent'

      ,

      

      'baseline_end_date'

      ,

      

      'baseline_start_date'

      ,

      

      'satisfaction_date'

      ,

      

      'satisfaction'

      ,

      

      'hubspot_ticket_count__hub_id__4402794_'

      ,

      

      'issue_color'

      ,

      

      'request_type'

      ,

      

      'creator'

      ,

      

      '_remaining_estimate'

      ,

      

      'operational_categorization'

      ,

      

      'affected_hardware'

      ,

      

      'severity'

      ,

      

      'status_category_changed'

      ,

      

      'change_completion_date'

      ,

      

      'product_categorization'

      ,

      

      'number_of_linked_intercom_conversations'

      ,

      

      'change_reason'

      ,

      

      'change_start_date'

      ,

      

      'planned_start_date'

      ,

      

      'planned_end_date'

      ,

      

      'security_level'

      ,

      

      'created'

      ,

      

      'change_type'

      ,

      

      'change_risk'

      ,

      

      'backout_plan'

      ,

      

      'test_plan'

      ,

      

      'resolved'

      ,

      

      'work_ratio'

      ,

      

      'parent_link'

      ,

      

      'investigation_reason'

      ,

      

      'root_cause'

      ,

      

      'workaround'

      ,

      

      'updated'

      ,

      

      'target_start'

      ,

      

      'accelo'

      ,

      

      '_time_spent'

      ,

      

      'last_viewed'

      ,

      

      'program_increment'

      ,

      

      'task_progress'

      ,

      

      'target_end'

      ,

      

      '_original_estimate'

      ,

      

      'impact'

      ,

      

      'urgency'

      ,

      

      'pending_reason'

      ,

      

      'implementation_plan'

      ,

      

      'environment'

      ,

      

      'planned_end'

      ,

      

      'planned_start'

      ,

      

      'linked_intercom_conversation_ids'

      ,

      

      'time_to_first_response'

      ,

      

      'time_to_resolution'

      ,

      

      'work_category'

      ,

      

      'risk_consequence'

      ,

      

      'risk_probability'

      ,

      

      'time_to_close_after_resolution'

      ,

      

      'time_to_review_normal_change'

      ,

      

      'team'

      ,

      

      'rank'

      ,

      

      'development'

      ,

      

      'total_forms'

      ,

      

      'submitted_forms'

      ,

      

      'locked_forms'

      ,

      

      'open_forms'

      ,

      

      'compass'

      ,

      

      'category'

      ,

      

      'external_issue_id'

      ,

      

      'deliverable_id'

      ,

      

      'deliverable_type'

      ,

      

      'development_stage'

      ,

      

      'story_points'

      ,

      

      'key'

      ,

      

      'product'

      ,

      

      'acceptance_criteria'

      ,

      

      'epic_name'

      ,

      

      'domain'

      ,

      

      'position_in_hierarchy_'

      ,

      

      'epic_status'

      ,

      

      'epic_color'

      ,

      

      'bug_category'

      

      

      ))

)

select * from pivot_issue_history