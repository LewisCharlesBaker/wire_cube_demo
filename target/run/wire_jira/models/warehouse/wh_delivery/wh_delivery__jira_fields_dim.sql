
  
    

    create or replace table `ra-development`.`lewis_analytics_dev`.`wh_delivery__jira_fields_dim`
    
    
    OPTIONS(
      description=""""""
    )
    as (
      

with int_jira__fields as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_jira__fields`

),

final as (

    select 

        
    
to_hex(md5(cast(coalesce(cast(jira_field_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as jira_field_pk,
        
        jira_field_name,
        jira_field_is_array,
        jira_field_is_custom

    from int_jira__fields

)

select * from final
    );
  