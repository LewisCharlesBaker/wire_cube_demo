
  
    

    create or replace table `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__field_history_scd`
    
    
    OPTIONS(
      description="""Slowly-changing-dimension model that fills values from differnt fields in the pivoted daily history model.  Note: this is the singular field history-related model that is not incremental (materialized as table)\n"""
    )
    as (
      with change_data as (

    select *
    from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__pivot_daily_field_history`

), set_values as (

    select 
        valid_starting_on, 
        issue_id,
        issue_day_id

         
        , status
        -- create a batch/partition once a new value is provided
        , sum( case when status is null then 0 else 1 end) over ( partition by issue_id 
            order by valid_starting_on rows unbounded preceding) as status_field_partition

         
        , sprint
        -- create a batch/partition once a new value is provided
        , sum( case when sprint is null then 0 else 1 end) over ( partition by issue_id 
            order by valid_starting_on rows unbounded preceding) as sprint_field_partition

        
    
    from change_data

), fill_values as (

-- each row of the pivoted table includes field values if that field was updated on that day
-- we need to backfill to persist values that have been previously updated and are still valid 
    select 
        valid_starting_on, 
        issue_id,
        issue_day_id
        
         

        -- grab the value that started this batch/partition
        , first_value( status ) over (
            partition by issue_id, status_field_partition 
            order by valid_starting_on asc rows between unbounded preceding and current row) as status

         

        -- grab the value that started this batch/partition
        , first_value( sprint ) over (
            partition by issue_id, sprint_field_partition 
            order by valid_starting_on asc rows between unbounded preceding and current row) as sprint

        

    from set_values

)

select *
from fill_values
    );
  