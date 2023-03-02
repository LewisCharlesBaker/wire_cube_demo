

with  __dbt__cte__int_jira__issue_field_history as (
with field_history as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_field_history`
    
), 

fields as (
      
    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__field`

), 

joined as (
  
  select
    field_history.*,
    fields.field_name

  from field_history
  join fields using (field_id)

)

select *
from joined
),issue_field_history as (

    select * from __dbt__cte__int_jira__issue_field_history

    
    where cast( updated_at as date) >= (select max(valid_starting_on) from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__combine_field_histories` )
    
),

issue_multiselect_batch_history as (

    select * from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__agg_multiselect_history`

    
    where cast( updated_at as date) >= (select max(valid_starting_on) from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__combine_field_histories` )
    
),

combine_field_history as (
-- combining all the field histories together
    select 
        field_id,
        issue_id,
        updated_at,
        field_value,
        field_name

    from issue_field_history

    union all

    select 
        field_id,
        issue_id,
        updated_at,
        field_values as field_value, -- this is an aggregated list but we'll just call it field_value
        field_name

    from issue_multiselect_batch_history
),

get_valid_dates as (


    select 
        field_id,
        issue_id,
        field_value,
        field_name,
        updated_at as valid_starting_at,

        -- this value is valid until the next value is updated
        lead(updated_at, 1) over(partition by issue_id, field_id order by updated_at asc) as valid_ending_at, 

        cast( timestamp_trunc(
        cast(updated_at as timestamp),
        day
    ) as date) as valid_starting_on

    from combine_field_history

),

surrogate_key as (

    select 
    *,
    
    
to_hex(md5(cast(coalesce(cast(field_id as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(issue_id as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(valid_starting_at as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as combined_history_id

    from get_valid_dates

)

select * from surrogate_key