

  create or replace view `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__field_option_tmp`
  OPTIONS(
      description=""""""
    )
  as select * 
from `ra-development`.`fivetran_jira`.`field_option`;

