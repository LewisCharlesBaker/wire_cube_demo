
  
    

    create or replace table `ra-development`.`lewis_analytics_dev`.`wh_delivery__harvest_clients_dim`
    
    
    OPTIONS(
      description=""""""
    )
    as (
      

with int_harvest__clients as (

    select * from `ra-development`.`lewis_analytics_dev_integration`.`int_harvest__clients`

),

final as (

    select 

        
    
to_hex(md5(cast(coalesce(cast(harvest_client_natural_key as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as harvest_client_pk,

        harvest_client_name,
        harvest_client_currency,

        harvest_client_is_active,
        
        harvest_client_created_at_ts,
        harvest_client_updated_at_ts

    from int_harvest__clients

)

select * from final
    );
  