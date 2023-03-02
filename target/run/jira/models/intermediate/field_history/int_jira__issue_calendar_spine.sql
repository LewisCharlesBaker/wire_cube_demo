
        
            
            
        
    

    

    merge into `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__issue_calendar_spine` as DBT_INTERNAL_DEST
        using (
          

with spine as (

    
    
    
    
    


    select * 
    from (
        





with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
     + 
    
    p2.generated_number * power(2, 2)
     + 
    
    p3.generated_number * power(2, 3)
     + 
    
    p4.generated_number * power(2, 4)
     + 
    
    p5.generated_number * power(2, 5)
     + 
    
    p6.generated_number * power(2, 6)
     + 
    
    p7.generated_number * power(2, 7)
     + 
    
    p8.generated_number * power(2, 8)
     + 
    
    p9.generated_number * power(2, 9)
     + 
    
    p10.generated_number * power(2, 10)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
     cross join 
    
    p as p4
     cross join 
    
    p as p5
     cross join 
    
    p as p6
     cross join 
    
    p as p7
     cross join 
    
    p as p8
     cross join 
    
    p as p9
     cross join 
    
    p as p10
    
    

    )

    select *
    from unioned
    where generated_number <= 1681
    order by generated_number



),

all_periods as (

    select (
        

        datetime_add(
            cast( cast('2018-08-01' as date) as datetime),
        interval row_number() over (order by 1) - 1 day
        )


    ) as date_day
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_day <= 

        datetime_add(
            cast( current_timestamp as datetime),
        interval 1 week
        )



)

select * from filtered

 
    ) as date_spine

    
    -- compare to the earliest possible open_until date so that if a resolved issue is updated after a long period of inactivity, we don't need a full refresh
    -- essentially we need to be able to backfill
    where cast( date_day as date) >= (select min(earliest_open_until_date) from `ra-development`.`lewis_analytics_dev_int_jira`.`int_jira__issue_calendar_spine` )
    
),

issue_dates as (

    select
        issue_id,
        cast( timestamp_trunc(
        cast(created_at as timestamp),
        day
    ) as date) as created_on,

        -- resolved_at will become null if an issue is marked as un-resolved. if this sorta thing happens often, you may want to run full-refreshes of the field_history models often
        -- if it's not resolved include everything up to today. if it is, look at the last time it was updated 
        cast(timestamp_trunc(
        cast(case when resolved_at is null then current_timestamp else updated_at end as timestamp),
        day
    ) as date) as open_until

    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue`

),

issue_spine as (

    select 
        cast(spine.date_day as date) as date_day,
        issue_dates.issue_id,
        -- will take the table-wide min of this in the incremental block at the top of this model
        min(issue_dates.open_until) as earliest_open_until_date

    from spine 
    join issue_dates on
        issue_dates.created_on <= spine.date_day
        and 

        datetime_add(
            cast( issue_dates.open_until as datetime),
        interval 1 month
        )

 >= spine.date_day
        -- if we cut off issues, we're going to have to do a full refresh to catch issues that have been un-resolved

    group by 1,2
),

surrogate_key as (

    select 
        date_day,
        issue_id,
        
    
to_hex(md5(cast(coalesce(cast(date_day as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(issue_id as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as issue_day_id,
        earliest_open_until_date

    from issue_spine

    where date_day <= cast( timestamp_trunc(
        cast(current_timestamp as timestamp),
        day
    ) as date)
)

select * from surrogate_key
        ) as DBT_INTERNAL_SOURCE
        on 
                DBT_INTERNAL_SOURCE.issue_day_id = DBT_INTERNAL_DEST.issue_day_id
            

    
    when matched then update set
        `date_day` = DBT_INTERNAL_SOURCE.`date_day`,`issue_id` = DBT_INTERNAL_SOURCE.`issue_id`,`issue_day_id` = DBT_INTERNAL_SOURCE.`issue_day_id`,`earliest_open_until_date` = DBT_INTERNAL_SOURCE.`earliest_open_until_date`
    

    when not matched then insert
        (`date_day`, `issue_id`, `issue_day_id`, `earliest_open_until_date`)
    values
        (`date_day`, `issue_id`, `issue_day_id`, `earliest_open_until_date`)


    