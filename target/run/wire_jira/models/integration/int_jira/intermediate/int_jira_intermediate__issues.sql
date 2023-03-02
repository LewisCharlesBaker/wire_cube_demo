

  create or replace view `ra-development`.`lewis_analytics_dev_integration`.`int_jira_intermediate__issues`
  OPTIONS(
      description=""""""
    )
  as with stg_jira__issues_field_history as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__issues_field_history`

),

stg_jira__fields as (

    select * from `ra-development`.`lewis_analytics_dev_staging`.`stg_jira__fields`

),

joined as (

    select 
    
        stg_jira__issues_field_history.jira_field_natural_key,
        stg_jira__issues_field_history.jira_issue_natural_key,

        stg_jira__issues_field_history.jira_issue_field_history_value,
        stg_jira__issues_field_history.jira_issue_field_history_is_active,

        regexp_replace(replace(replace(replace(replace(stg_jira__fields.jira_field_name
                                                            ," ", "_")
                                                            ,":","_")
                                                            ,"(","_")
                                                            ,")","_")
                                                            , r"[^a-zA-Z0-9_-]", "")
                                                            
                                                            as field_name,

        stg_jira__issues_field_history.jira_issue_field_history_timestamp
    
    from stg_jira__issues_field_history

    left join stg_jira__fields
    on stg_jira__issues_field_history.jira_field_natural_key = stg_jira__fields.jira_field_natural_key

)

select * from joined;

