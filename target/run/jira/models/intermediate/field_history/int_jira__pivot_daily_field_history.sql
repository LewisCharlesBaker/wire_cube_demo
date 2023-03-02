
        
            
            
        
    

    

    merge into `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__pivot_daily_field_history` as DBT_INTERNAL_DEST
        using (
          

-- latest value per issue field (already limited included fields to sprint, status, and var(issue_field_history_columns))
with daily_field_history as (

    select * 
    from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__daily_field_history`

    
    where valid_starting_on >= (select max(valid_starting_on) from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__pivot_daily_field_history` )
    
),

pivot_out as (

    -- pivot out default columns (status and sprint) and others specified in the var(issue_field_history_columns)
    -- only days on which a field value was actively changed will have a non-null value. the nulls will need to 
    -- be backfilled in the final jira__daily_issue_field_history model
    select 
        valid_starting_on, 
        issue_id,
        max(case when lower(field_id) = 'status' then field_value end) as status,
        max(case when lower(field_name) = 'sprint' then field_value end) as sprint

        from daily_field_history

    group by 1,2
),

surrogate_key as (

    select 
        *,
        
    
to_hex(md5(cast(coalesce(cast(valid_starting_on as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(issue_id as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as issue_day_id

    from pivot_out
)

select * from surrogate_key
        ) as DBT_INTERNAL_SOURCE
        on 
                DBT_INTERNAL_SOURCE.issue_day_id = DBT_INTERNAL_DEST.issue_day_id
            

    
    when matched then update set
        `valid_starting_on` = DBT_INTERNAL_SOURCE.`valid_starting_on`,`issue_id` = DBT_INTERNAL_SOURCE.`issue_id`,`status` = DBT_INTERNAL_SOURCE.`status`,`sprint` = DBT_INTERNAL_SOURCE.`sprint`,`issue_day_id` = DBT_INTERNAL_SOURCE.`issue_day_id`
    

    when not matched then insert
        (`valid_starting_on`, `issue_id`, `status`, `sprint`, `issue_day_id`)
    values
        (`valid_starting_on`, `issue_id`, `status`, `sprint`, `issue_day_id`)


    