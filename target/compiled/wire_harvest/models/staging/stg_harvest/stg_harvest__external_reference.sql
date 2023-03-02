

with source as (

   select * from `ra-development`.`stitch_harvest`.`external_reference`    

),

deduplicated as (

   select unique.*
    from (
        select
            array_agg (
                original
                order by _sdc_batched_at desc
                limit 1
            )[offset(0)] unique
        from source original
        group by id, _sdc_sequence
    )

),

base as (

   select

      cast(id as numeric) as harvest_external_reference_natural_key,
      cast(group_id as numeric) as harvest_external_reference_group_natural_key,

      last_value(permalink) over (partition by id order by _sdc_batched_at asc rows between unbounded preceding and unbounded following) as harvest_external_reference_permalink,

      lower(regexp_extract(permalink, '([a-zA-Z]+-[0-9]+)')) as harvest_external_reference_jira_issue_key,
      
      lower(cast(service as string)) as harvest_external_reference_platform

   from deduplicated

)

select * from base