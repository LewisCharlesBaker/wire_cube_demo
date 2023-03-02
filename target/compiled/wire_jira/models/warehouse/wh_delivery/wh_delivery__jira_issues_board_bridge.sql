

with int_jira__issues as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__issues`

),

final as (

    select distinct

        
    
to_hex(md5(cast(coalesce(cast(jira_issue_natural_key as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(jira_board_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_issue_board_bridge_pk,
        
        
    
to_hex(md5(cast(coalesce(cast(jira_issue_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_issue_fk,

        
    
to_hex(md5(cast(coalesce(cast(jira_board_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_board_fk

    from int_jira__issues

) 

select * from final