

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
),version as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__version`
),

version_history as (

    select *
    from __dbt__cte__int_jira__issue_multiselect_history

    where field_id = 'versions'
        or field_id = 'fixVersions'
),

order_versions as (

    select
        *,
        -- using rank so batches stick together
        rank() over (
            partition by field_id, issue_id
            order by updated_at desc
            ) as row_num

    from version_history
),

latest_versions as (

    select 
        field_id,
        issue_id,	
        updated_at,
        cast(field_value as INT64) as version_id
    from order_versions
    where row_num = 1
),

version_info as (

    select 
        latest_versions.field_id,
        latest_versions.issue_id,
        
    string_agg(version.version_name, ', ')

 as versions

    from latest_versions
    join version on latest_versions.version_id = version.version_id

    group by 1,2
),

split_versions as (

    select 
        issue_id,
        case when field_id = 'versions' then versions else null end as affects_versions,
        case when field_id = 'fixVersions' then versions else null end as fixes_versions
    from version_info
),

final as (

    select 
        issue_id,
        max(affects_versions) as affects_versions,
        max(fixes_versions) as fixes_versions
    from split_versions
    group by 1
)

select *
from final