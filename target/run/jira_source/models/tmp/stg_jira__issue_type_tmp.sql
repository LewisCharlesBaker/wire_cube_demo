

  create or replace view `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__issue_type_tmp`
  OPTIONS(
      description=""""""
    )
  as select * 
from `ra-development`.`fivetran_jira`.`issue_type`;

