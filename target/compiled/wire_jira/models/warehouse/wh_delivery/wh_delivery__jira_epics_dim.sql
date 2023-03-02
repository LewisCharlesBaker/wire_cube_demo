

with int_jira__epics as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__epics`

),

final as (

    select 

        
    
to_hex(md5(cast(coalesce(cast(jira_epic_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_epic_pk,

        jira_epic_name,
        jira_epic_summary,
        jira_epic_is_done,
        jira_epic_key

    from int_jira__epics

)

select * from final