
        
            
            
        
    

    

    merge into `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__agg_multiselect_history` as DBT_INTERNAL_DEST
        using (
          

-- issue_multiselect_history splits out an array-type field into multiple rows with unique individual values
-- to combine with issue_field_history we need to aggregate the multiselect field values.

with  __dbt__cte__int_jira__issue_multiselect_history as (
with issue_multiselect_history as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_multiselect_history`
    
), 

fields as (
      
    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__field`

), 

joined as (
  
  select
    issue_multiselect_history.*,
    fields.field_name

  from issue_multiselect_history
  join fields using (field_id)

)

select *
from joined
),issue_multiselect_history as (

    select *
    from __dbt__cte__int_jira__issue_multiselect_history

    
    -- always refresh the most recent day of data
    where cast(updated_at as date) >= 

        datetime_add(
            cast( (select max(date_day) from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__agg_multiselect_history`) as datetime),
        interval -1 day
        )


    

),

-- each field value has its own row, but each batch of values for that field has the same timestamp
batch_updates as (

    select 
        *,
        
    
to_hex(md5(cast(coalesce(cast(field_id as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(issue_id as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(updated_at as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as batch_id

    from issue_multiselect_history 
),

consolidate_batches as (

    select 
        field_id,
        field_name,
        issue_id,
        updated_at,
        batch_id,
        cast( timestamp_trunc(
        cast(updated_at as timestamp),
        day
    ) as date) as date_day,

        -- if the field refers to an object captured in a table elsewhere (ie sprint, users, field_option for custom fields),
        -- the value is actually a foreign key to that table. 
        
    string_agg(batch_updates.field_value, ', ')

 as field_values 

    from batch_updates

    group by 1,2,3,4,5,6
)

select *
from consolidate_batches
        ) as DBT_INTERNAL_SOURCE
        on 
                DBT_INTERNAL_SOURCE.batch_id = DBT_INTERNAL_DEST.batch_id
            

    
    when matched then update set
        `field_id` = DBT_INTERNAL_SOURCE.`field_id`,`field_name` = DBT_INTERNAL_SOURCE.`field_name`,`issue_id` = DBT_INTERNAL_SOURCE.`issue_id`,`updated_at` = DBT_INTERNAL_SOURCE.`updated_at`,`batch_id` = DBT_INTERNAL_SOURCE.`batch_id`,`date_day` = DBT_INTERNAL_SOURCE.`date_day`,`field_values` = DBT_INTERNAL_SOURCE.`field_values`
    

    when not matched then insert
        (`field_id`, `field_name`, `issue_id`, `updated_at`, `batch_id`, `date_day`, `field_values`)
    values
        (`field_id`, `field_name`, `issue_id`, `updated_at`, `batch_id`, `date_day`, `field_values`)


    