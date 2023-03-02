

  create or replace view `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__status_category_tmp`
  OPTIONS(
      description=""""""
    )
  as select * 
from `ra-development`.`fivetran_jira`.`status_category`;

