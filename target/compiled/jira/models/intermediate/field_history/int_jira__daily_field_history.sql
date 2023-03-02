

with combined_field_histories as (

    select * 
    from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__combine_field_histories`

    
    where valid_starting_on >= (select max(valid_starting_on) from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__daily_field_history` )
    
),


limit_to_relevant_fields as (

-- let's remove unncessary rows moving forward and grab field names 
    select 
        combined_field_histories.*

    from combined_field_histories

    where lower(field_id) = 'status' 
            or lower(field_name) in ('sprint')
    
),

order_daily_values as (

    select 
        *,

        -- want to grab last value for an issue's field for each day
        row_number() over (
            partition by valid_starting_on, issue_id, field_id
            order by valid_starting_at desc
            ) as row_num

    from limit_to_relevant_fields
),

-- only looking at the latest value for each day
get_latest_daily_value as (

    select * 
    from order_daily_values

    where row_num = 1
), 

final as (

    select
        field_id,
        issue_id,
        field_name,

        -- doing this to figure out what values are actually null and what needs to be backfilled in jira__daily_issue_field_history
        case when field_value is null then 'is_null' else field_value end as field_value,
        valid_starting_at,
        valid_ending_at, 
        valid_starting_on,

        
    
to_hex(md5(cast(coalesce(cast(field_id as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(issue_id as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(valid_starting_on as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as issue_field_day_id
        
    from get_latest_daily_value
)

select * from final