explore: wh_core__clients_bridge
{ hidden: yes }
explore: wh_core__people_bridge
{ hidden: yes }
explore: wh_core__sprints_bridge
{ hidden: yes }
explore: wh_delivery__harvest_clients_dim
{ hidden: yes }
explore: wh_delivery__harvest_employees_dim
{ hidden: yes }
explore: wh_delivery__harvest_expenses_fact
{ hidden: yes }
explore: wh_delivery__harvest_invoice_line_items_fact
{ hidden: yes }
explore: wh_delivery__harvest_invoices_fact
{ hidden: yes }
explore: wh_delivery__harvest_invoices_xa
{ hidden: yes }
explore: wh_delivery__harvest_projects_fact
{ hidden: yes }
explore: wh_delivery__harvest_tasks_dim
{ hidden: yes }
explore: wh_delivery__harvest_time_sheets_fact
{ hidden: yes }
explore: wh_delivery__jira_daily_issue_field_history_fact
{ hidden: yes }
explore: wh_delivery__jira_epics_dim
{ hidden: yes }
explore: wh_delivery__jira_fields_dim
{ hidden: yes }
explore: wh_delivery__jira_issues_board_bridge
{ hidden: yes }
explore: wh_delivery__jira_issues_fact
{ hidden: yes }
explore: wh_delivery__jira_issues_field_history_fact
{ hidden: yes }
explore: wh_delivery__jira_issues_sprint_bridge
{ hidden: yes }
explore: wh_delivery__jira_issues_xa
{ hidden: yes }
explore: wh_delivery__jira_projects_fact
{ hidden: yes }
explore: wh_delivery__jira_sprints_dim
{ hidden: yes }
explore: wh_delivery__jira_users_dim
{ hidden: yes }
view: wh_core__clients_bridge {
sql_table_name: wh_core__clients_bridge ;;
dimension: client_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.client_pk ;;
  description: ""
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: ""
}
dimension: jira_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_project_fk ;;
  description: ""
}
}
view: wh_core__people_bridge {
sql_table_name: wh_core__people_bridge ;;
dimension: person_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.person_pk ;;
  description: ""
}
dimension: jira_user_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_user_fk ;;
  description: ""
}
dimension: harvest_employee_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_employee_fk ;;
  description: ""
}
}
view: wh_core__sprints_bridge {
sql_table_name: wh_core__sprints_bridge ;;
dimension: sprint_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.sprint_pk ;;
  description: ""
}
dimension: jira_sprint_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_sprint_fk ;;
  description: ""
}
dimension: harvest_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_project_fk ;;
  description: ""
}
}
view: wh_delivery__harvest_clients_dim {
sql_table_name: wh_delivery__harvest_clients_dim ;;
set: wh_delivery__harvest_clients_dim_set {
  fields: [harvest_client_name, harvest_client_currency, harvest_client_is_active]
}
dimension: harvest_client_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_client_pk ;;
  description: "Harvest Client PK is an ID belonging to each client in Harvest. It is a unique ID used to identify each individual client, and can be found in the URL when viewing the client profile."
}
dimension: harvest_client_name {
  type: string
  sql: ${TABLE}.harvest_client_name ;;
  description: "The Harvest Client is an online time tracking, invoicing, and expense reporting software and mobile application."
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
dimension: harvest_client_currency {
  type: string
  sql: ${TABLE}.harvest_client_currency ;;
  description: "Harvest Client Currency is the currency that clients will be invoiced in when using the Harvest software. This currency can be set in the Client Settings menu in the Harvest dashboard."
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
dimension: harvest_client_is_active {
  type: yesno
  sql: ${TABLE}.harvest_client_is_active ;;
  description: "Harvest Client is active is an online time tracking and invoicing tool used by many businesses and organizations. It is used to accurately track time and expenses related to any project, invoice customers, and generate detailed reports. It also integrates with popular services like Asana, Basecamp, and Slack. Harvest Client helps streamline processes, provide insights into project performance, and help make sure you get paid on time."
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
dimension_group: harvest_client_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_client_created_at_ts ;;
  description: "Harvest Client Created At TS is a tool designed to help companies manage their time tracking data. It allows users to track employee time and work hours, see the amount of time each active employee has logged, and generate reports with the data."
}
dimension_group: harvest_client_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_client_updated_at_ts ;;
  description: "Harvest Client is a time tracking and project management application that helps users track time and generate invoices, while keeping everyone on the same page. It was last updated on August 12, 2020."
}
}
view: wh_delivery__harvest_employees_dim {
sql_table_name: wh_delivery__harvest_employees_dim ;;
set: wh_delivery__harvest_employees_dim_set {
  fields: [
    harvest_employee_first_name,
    harvest_employee_last_name,
    harvest_employee_full_name,
    harvest_employee_email,
    harvest_employee_weekly_capacity,
    harvest_employee_cost_rate,
    harvest_employee_default_hourly_rate,
    harvest_employee_is_contractor,
    harvest_employee_is_active,
  ]
}
dimension: harvest_employee_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_employee_pk ;;
  description: "A harvest employee primary key is a unique identifier assigned to each individual employee in a harvest system. It is typically a combination of the employee's name and a number, such as 'John_Smith_001', and is used to identify and reference the employee in the system."
}
dimension: harvest_employee_first_name {
  type: string
  sql: ${TABLE}.harvest_employee_first_name ;;
  description: "Harvest employee first names vary depending on the employee."
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_last_name {
  type: string
  sql: ${TABLE}.harvest_employee_last_name ;;
  description: "Harvest does not employ individuals and does not use last names."
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_full_name {
  type: string
  sql: ${TABLE}.harvest_employee_full_name ;;
  description: "Harvest's full name is Harvest Profit, Inc."
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_email {
  type: string
  sql: ${TABLE}.harvest_employee_email ;;
  description: "Harvest employee email addresses typically use the company domain name. For example, if the company domain name is <companyname>.com, then each employee's email address would be their first initial, last name@<companyname>.com."
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_weekly_capacity {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_weekly_capacity ;;
  description: "The exact weekly capacity for a harvest employee will vary depending on the employee's role, workload, and level of expertise. There is no set amount of hours that a harvest employee should work in a given week."
}
dimension: harvest_employee_cost_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_cost_rate ;;
  description: "The exact cost of an employee at harvest can vary depending on the company, their needs, and the individual employee's qualifications. In general, the average cost of a Harvest employee is around $18 per hour."
}
dimension: harvest_employee_default_hourly_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_default_hourly_rate ;;
  description: "Harvest does not have a standard default hourly rate for employees. It is up to the employer to set their own rate."
}
dimension: harvest_employee_is_contractor {
  type: yesno
  sql: ${TABLE}.harvest_employee_is_contractor ;;
  description: "A harvest employee is a contract worker, who is often self-employed, and is hired by a company or individual to complete a specific project. Generally, a harvest employee is paid an hourly rate or set fee for the project, instead of a full-time salary. They are typically used when an employer needs to fill a temporary or short-term need and are otherwise known as freelancers or contract employees."
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension: harvest_employee_is_active {
  type: yesno
  sql: ${TABLE}.harvest_employee_is_active ;;
  description: "A harvest employee is considered active if they have logged in or taken any action on the Harvest platform within the last 6 months."
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
dimension_group: harvest_employee_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_employee_created_at_ts ;;
  description: "Harvest is a time tracking and invoicing software owned by Harvest Inc. It was founded in 2006 by two engineers, Jesse Tane and Shawn Simon, and is headquartered in New York City. The software is used by small businesses, freelancers, and larger corporations to help tracking employee time, projects, and clients."
}
dimension_group: harvest_employee_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_employee_updated_at_ts ;;
  description: "Harvest Employee Updated At TS (or Harvest Employee Update TimeStamp) is a time-stamp used by the software tool Harvest to indicate when an employee was last updated in the system. The time indicated in the timestamp represents the timestamp of the last action taken by an employee on their account, such as updating their personal information, logging hours, completing assignments or submitting timesheets."
}
}
view: wh_delivery__harvest_expenses_fact {
sql_table_name: wh_delivery__harvest_expenses_fact ;;
set: wh_delivery__harvest_expenses_fact_set {
  fields: [
    harvest_expense_notes,
    harvest_expense_receipt_file_name,
    harvest_expense_locked_reason,
    harvest_expense_receipt_content_type,
    harvest_expense_receipt_url,
    harvest_expense_total_cost,
    harvest_expense_receipt_file_size,
    harvest_expense_units,
    harvest_expense_is_closed,
    harvest_expense_billable,
    harvest_expense_is_billed,
    harvest_expense_is_locked,
  ]
}
dimension: harvest_expense_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_expense_pk ;;
  description: "Harvest expense pk is an accounting software designed to help businesses automate their expense tracking, create detailed budgeting reports, and provide detailed financial reporting. It integrates with popular accounting software, such as QuickBooks and Xero, to offer a comprehensive solution for businesses of all sizes."
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: "A harvest client foreign key is a unique identifier associated with a client in a database in order to easily establish relationships with other data tables. It allows a database system to quickly and accurately associate a client with their data."
}
dimension: harvest_invoice_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_invoice_fk ;;
  description: "A harvest invoice foreign key is a field in a database table that links or references a row or record in another table. It is made up of the primary key from one table and is used as the foreign key in another table. The purpose of a foreign key is to ensure data integrity and establish relationships between tables."
}
dimension: harvest_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_project_fk ;;
  description: "A foreign key in a Harvest project is a column in the project's database table which holds the primary key value of another table. This allows related records to be linked together in a many-to-one relationship."
}
dimension: harvest_employee_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_employee_fk ;;
  description: "A harvest employee foreign key is a field in a database table that is used to uniquely identify a particular record or row in another table. This is known as a foreign key because it relates to the primary key of another table, usually located in a different database."
}
dimension: harvest_expense_category_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_category_natural_key ;;
  description: "The natural key for the harvest expense category is typically the unique identifier or code associated with the category, such as a number, a short description, or a combination of both."
}
dimension: harvest_employee_assignment_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_assignment_natural_key ;;
  description: "A harvest employee assignment natural key is a unique identifier for employee assignments, such as a combination of harvest identifier and employee identifier. This natural key is typically used to join multiple tables and queries in a database to ensure accurate and reliable data for reporting and analysis."
}
dimension: harvest_expense_notes {
  type: string
  sql: ${TABLE}.harvest_expense_notes ;;
  description: "Harvest Expense Notes is a feature of the Harvest time tracking service that allows users to create, track, and manage their business expenses. With Harvest Expense Notes, users can easily upload receipts associated with their expenses and have them recorded and tracked in the Harvest system. They can also assign those expenses to the correct task, project, and/or client, making it easy to report on business expenses and their associated costs."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_receipt_file_name {
  type: string
  sql: ${TABLE}.harvest_expense_receipt_file_name ;;
  description: "The harvest expense receipt file name typically follows the format \"YYYYMMDD_harvest_receipts.xxx\" (i.e., the year, month, and day of the harvest, followed by the words \"harvest_receipts\"), with the \".xxx\" suffix depending on the file format being used (e.g., \".pdf\", \".docx\", \".xls\", etc.)."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_locked_reason {
  type: string
  sql: ${TABLE}.harvest_expense_locked_reason ;;
  description: "Harvest Expense Locked Reason is the reason for which a Harvest expense can be locked. There are several reasons why a Harvest Expense may be locked, such as: a request for a payment against the expense has been made but not yet accepted, someone is asking for an additional review of the expense, or the expense has been marked as disputed by the client or customer."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_receipt_content_type {
  type: string
  sql: ${TABLE}.harvest_expense_receipt_content_type ;;
  description: "Harvest Expense Receipt content type is a content type used by Harvest, an online time-tracking service. This content type gives users a way to store and post receipt images to the system for tracking and reimbursement purposes. Receipts are stored electronically for future retrieval and can be used for reporting or auditing purposes."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_receipt_url {
  type: string
  sql: ${TABLE}.harvest_expense_receipt_url ;;
  description: "Harvest Expense Receipts URL is https://id.getharvest.com/expense-receipts."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_total_cost {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_total_cost ;;
  description: "There is no one-size-fits-all answer to this question, as the total cost of harvest expenses will vary depending on many factors, such as the size of the harvest, the type of crop being harvested, and any equipment or supplies that may need to be purchased or rented. In general, harvest expenses can range from a few hundred dollars to thousands of dollars."
}
dimension: harvest_expense_receipt_file_size {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_receipt_file_size ;;
  description: "The size of a harvest expense receipt file will depend on the content of the receipt. It can range from a few kilobytes to several megabytes."
}
dimension: harvest_expense_units {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_expense_units ;;
  description: "Harvest expense units are an accounting measure of value related to collecting, growing and selling agricultural crops. They are used to calculate the cost of resources and are typically tracked per crop or season."
}
dimension: harvest_expense_is_closed {
  type: yesno
  sql: ${TABLE}.harvest_expense_is_closed ;;
  description: "Harvest expense is closed when all the expenses related to a specific harvest have been collected and reconciled with the corresponding income. At this point, the harvest expense account can be closed off and put into inactive status."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_billable {
  type: yesno
  sql: ${TABLE}.harvest_expense_billable ;;
  description: "Harvest Expense Billable is a feature within the Harvest time-tracking and invoicing application that enables businesses to quickly track billable expenses for their clients or projects. It enables businesses to streamline their expense tracking and invoicing process, save time, and take full control of their finances."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_is_billed {
  type: yesno
  sql: ${TABLE}.harvest_expense_is_billed ;;
  description: "Harvest expenses are costs that a farmer incurs such as seed, fertilizer, fuel, labor, and other items used to produce a crop.They are typically billed to the farmer after the crop has been harvested and sold, either through a lump-sum invoice or a series of invoices over the course of the season."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension: harvest_expense_is_locked {
  type: yesno
  sql: ${TABLE}.harvest_expense_is_locked ;;
  description: "Harvest Expense is an expense management feature offered by Harvest, an online accounting and invoicing software. This feature allows businesses to track and manage their expenses, ensuring that all expenses made by the business are compliant with company policies as well as any external regulations. When a Harvest Expense is locked, it means that it can no longer be edited or removed, and the funds for that expense cannot be reclaimed. This ensures that businesses stay compliant and the integrity of their tracking and reporting is maintained."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
dimension_group: harvest_expense_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_expense_created_at ;;
  description: "Harvest Expense is a cloud-based software that was created in 2008. It provides businesses automatic invoicing, expense tracking, and time tracking services."
}
dimension_group: harvest_expense_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_expense_updated_at ;;
  description: "Harvest expense is updated as needed. It is typically updated when a change in the cost of growing, harvesting, or processing the crop requires a change in the amount spent."
}
dimension_group: harvest_expense_spent_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_expense_spent_date ;;
  description: "Harvest expense spend date should be the date associated with the payment transaction for the expenses incurred. It should be the date that the funds were paid out or when the expense was otherwise processed."
}
}
view: wh_delivery__harvest_invoice_line_items_fact {
sql_table_name: wh_delivery__harvest_invoice_line_items_fact ;;
set: wh_delivery__harvest_invoice_line_items_fact_set {
  fields: [
    harvest_invoice_line_item_kind,
    harvest_invoice_line_item_description,
    harvest_invoice_line_item_amount,
    harvest_invoice_line_item_unit_price,
    harvest_invoice_line_item_quantity,
    harvest_invoice_line_item_services_amount_billed,
    harvest_invoice_line_item_license_referral_fee_amount_billed,
    harvest_invoice_line_item_expenses_amount_billed,
    harvest_invoice_line_item_support_amount_billed,
    harvest_invoice_line_item_is_taxed,
  ]
}
dimension: harvest_invoice_line_item_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_invoice_line_item_pk ;;
  description: "A Harvest Invoice Line Item PK is a primary key that uniquely identifies each item listed on a Harvest invoice. This primary key is used to access information about each line item on the invoice, including the amount, quantity, and any discounts or other modifiers that may have been applied to the line item."
}
dimension: harvest_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_project_fk ;;
  description: "A foreign key in a Harvest project is a column in the project's database table which holds the primary key value of another table. This allows related records to be linked together in a many-to-one relationship."
}
dimension: harvest_invoice_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_invoice_fk ;;
  description: "A harvest invoice foreign key is a field in a database table that links or references a row or record in another table. It is made up of the primary key from one table and is used as the foreign key in another table. The purpose of a foreign key is to ensure data integrity and establish relationships between tables."
}
dimension: harvest_invoice_line_item_kind {
  type: string
  sql: ${TABLE}.harvest_invoice_line_item_kind ;;
  description: "A harvest invoice line item kind is a type of item added to a goods and services invoice created in the Harvest invoicing software. Such item types can include project, description of the goods or services, type of the taxes, hours worked, quantity of items, unit rate, and the total amount to be charged."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
dimension: harvest_invoice_line_item_description {
  type: string
  sql: ${TABLE}.harvest_invoice_line_item_description ;;
  description: "A harvest invoice line item description is a brief explanation of each item included on an invoice. It typically includes pertinent information such as the item price, quantity, and total cost."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
dimension: harvest_invoice_line_item_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_amount ;;
  description: "A harvest invoice line item amount is the total monetary amount of an individual line item on an invoice. This amount can include subtotals, sales tax, and shipping charges."
}
dimension: harvest_invoice_line_item_unit_price {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_unit_price ;;
  description: "A harvest invoice line item unit price is the price of an individual item on a harvest invoice. It is calculated by dividing the total price of the invoice line item by the quantity purchased."
}
dimension: harvest_invoice_line_item_quantity {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_quantity ;;
  description: "A harvest invoice line item quantity is the number of items included in a single line item on an invoice from a business. It might refer to the exact number of units of product that a customer purchased, or to the number of hours of service provided by a business."
}
dimension: harvest_invoice_line_item_services_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_services_amount_billed ;;
  description: "The amount billed for harvest invoice line item services depends on the particular services included in the invoice. Generally, harvest invoices will include a full breakdown of the services provided along with the amount billed for each service."
}
dimension: harvest_invoice_line_item_license_referral_fee_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_license_referral_fee_amount_billed ;;
  description: "A harvest invoice line item license referral fee amount billed is the total fee charged for a referral made when the customer purchases a license for a product or service. The amount charged for the referral fee is based on the terms of the agreement between the referring individual or entity and the organization providing the license."
}
dimension: harvest_invoice_line_item_expenses_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_expenses_amount_billed ;;
  description: "A harvest invoice line item expense amount billed is the total amount that is charged to the customer for the item listed on the invoice. This amount includes any applicable taxes and other fees."
}
dimension: harvest_invoice_line_item_support_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_line_item_support_amount_billed ;;
  description: "Harvest Invoice Line Item Support Amount Billed is a term used to describe the total amount of money billed to the customer on the line item of an invoice. It is the sum of the item or service being billed, along with any additional fees such as taxes, shipping, discounts, etc."
}
dimension: harvest_invoice_line_item_is_taxed {
  type: yesno
  sql: ${TABLE}.harvest_invoice_line_item_is_taxed ;;
  description: "A harvest invoice line item that is taxed is an invoice line item that includes the applicable sales tax amount, as dictated by local and state laws."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
}
view: wh_delivery__harvest_invoices_fact {
sql_table_name: wh_delivery__harvest_invoices_fact ;;
set: wh_delivery__harvest_invoices_fact_set {
  fields: [
    harvest_invoice_client_key,
    harvest_invoice_number,
    harvest_invoice_purchase_order,
    harvest_invoice_state,
    harvest_invoice_notes,
    harvest_invoice_subject,
    harvest_invoice_currency,
    harvest_invoice_payment_term,
    harvest_invoice_amount,
    harvest_invoice_due_amount,
    harvest_invoice_discount_amount,
    harvest_invoice_discount,
    harvest_invoice_tax_amount,
    harvest_invoice_tax,
  ]
}
dimension: harvest_invoice_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_invoice_pk ;;
  description: "Harvest Invoice PK (Public Key) is a unique identifier that accompanies each invoice generated within the Harvest platform. This public key allows users to keep track of invoices and securely access the details of them whenever they need to."
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: "A harvest client foreign key is a unique identifier associated with a client in a database in order to easily establish relationships with other data tables. It allows a database system to quickly and accurately associate a client with their data."
}
dimension: harvest_employee_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_employee_fk ;;
  description: "A harvest employee foreign key is a field in a database table that is used to uniquely identify a particular record or row in another table. This is known as a foreign key because it relates to the primary key of another table, usually located in a different database."
}
dimension: harvest_invoice_client_key {
  type: string
  sql: ${TABLE}.harvest_invoice_client_key ;;
  description: "A Harvest Invoice Client Key is a unique identifier that Harvest assigns to each customer when they create a profile. It is used by the Harvest Invoice service to identify customers when sending invoices and processing payments."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_number {
  type: string
  sql: ${TABLE}.harvest_invoice_number ;;
  description: "Harvest invoice numbers are unique numerical identifiers assigned to invoices created in the Harvest software. They are used to track, manage, and organize payments from customers and clients."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_purchase_order {
  type: string
  sql: ${TABLE}.harvest_invoice_purchase_order ;;
  description: "A harvest invoice purchase order is an order created by the purchaser, used to request goods or services from the vendor. It typically includes details on the goods or services requested, the quantity requested, and the agreed-upon pricing. This document serves as an agreement between the buyer and seller and serves as a legal document if any dispute should arise."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_state {
  type: string
  sql: ${TABLE}.harvest_invoice_state ;;
  description: "Harvest Invoice state is a set of information stored by the system when an invoice is created in Harvest. Depending on the invoice status, that information may include its payment status, payment amount, date the invoice was created or sent, date the invoice was paid, email address used to send the invoice, and more."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_notes {
  type: string
  sql: ${TABLE}.harvest_invoice_notes ;;
  description: "Harvest invoice notes are optional fields added to invoices that are used to provide any additional information pertinent to the invoice—such as terms of payment or a special message for the customer. The notes are visible when viewing the invoice, and included in all invoices sent by Harvest."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_subject {
  type: string
  sql: ${TABLE}.harvest_invoice_subject ;;
  description: "Harvest Invoice subject lines typically include the words “Invoice” and a brief description of the services or goods sold. For example, “Invoice for Web Design Services” or “Invoice for Ad Design.”"
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_currency {
  type: string
  sql: ${TABLE}.harvest_invoice_currency ;;
  description: "Harvest Invoice currency is determined by the currency set on your invoice settings page. This page can be accessed from the Settings tab of your project. You can choose from US Dollars, Canadian Dollars, British Pounds, and Euro."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_payment_term {
  type: string
  sql: ${TABLE}.harvest_invoice_payment_term ;;
  description: "The payment term for a harvest invoice is typically 14 days net. This means that the full amount of the invoice is due to the seller 14 days after the invoice was issued."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
dimension: harvest_invoice_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_amount ;;
  description: "Harvest Invoice Amount is the total value of the invoice after any deductions, discounts, taxes, and other fees have been applied."
}
dimension: harvest_invoice_due_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_due_amount ;;
  description: "The amount due for a harvest invoice depends on the terms of the invoice, such as payment terms and any discounts given. It could range from the full invoice amount to a percentage of the invoice amount. Additionally, taxes, late fees and other charges may be added in, which could influence the final amount due."
}
dimension: harvest_invoice_discount_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_discount_amount ;;
  description: "Harvest Invoice Discount Amount is the amount of a discount taken off billed amounts that the customer can take advantage of after invoicing. The discount may be calculated according to a percentage, dollar amount, or a combination of both."
}
dimension: harvest_invoice_discount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_discount ;;
  description: "Harvest Invoice Discounting is a form of financial services that enables businesses to obtain quick advances on outstanding invoices. By using Harvest Invoice Discounting, businesses are able to gain access to cash much faster than traditional invoicing systems. As a result, businesses are able to grow and expand without the need to wait for full payment from client invoices. The process works by “discounting” the invoice amount at a predetermined rate and providing businesses with a lump sum."
}
dimension: harvest_invoice_tax_amount {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_tax_amount ;;
  description: "Harvest invoice tax amount is the amount of tax owed on an invoice that is being paid through Harvest. This tax amount may vary depending on the country and the tax rate imposed by the local governing authority."
}
dimension: harvest_invoice_tax {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_tax ;;
  description: "Harvest Invoice Tax is a tax which is applied to invoices generated in the Harvest accounting software. It is used to more accurately report income and expenses for businesses, and is based on the business' country of origin and the state or province in which the business is located."
}
dimension_group: harvest_invoice_period_start {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_period_start ;;
  description: "A harvest invoice period start is the date that a billing period starts, usually when a new contract is in effect or an invoice is generated. It is usually used to define when an amount of payment is due."
}
dimension_group: harvest_invoice_period_end {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_period_end ;;
  description: "Harvest Invoice Period End is a feature within Harvest that allows you to set an end date for any invoices that you choose to generate. This end date is set so that all invoices that were created will be marked as “complete” by the specified period end."
}
dimension_group: harvest_invoice_paid_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_paid_date ;;
  description: "Harvest invoice paid date is the date on which the invoice is paid by the customer. It is up to the customer to decide when to make the payment, and this date may vary depending on their payment terms."
}
dimension_group: harvest_invoice_issue_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_issue_date ;;
  description: "The issue date of a harvest invoice will depend on the individual vendor and their chosen accounting system. Generally, the issue date is the same as the date of the service or sale."
}
dimension_group: harvest_invoice_due_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_due_date ;;
  description: "Harvest invoice due dates vary according to the payment terms set up with each customer. Most pay invoices within 15 to 30 days of the invoice date."
}
dimension_group: harvest_invoice_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_created_at ;;
  description: "A Harvest invoice is usually created when a payment is made for a service or product. The date of creation is typically the date of purchase."
}
dimension_group: harvest_invoice_sent_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_sent_at ;;
  description: "Harvest invoice sent at is the time that an invoice is generated and sent to a customer or client. This is typically done through email or another online billing system. The invoice can include details of the goods and services bought and any applicable payment terms, taxes, and fees."
}
dimension_group: harvest_invoice_paid_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_paid_at ;;
  description: "A harvest invoice is typically paid at the time of delivery, or within the stipulated payment terms stated in the invoice."
}
dimension_group: harvest_invoice_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_invoice_updated_at ;;
  description: "The exact date an invoice is updated at will depend on several factors, such as the type of invoice being updated, the type of product being purchased, and the location of the seller. Many invoices on Harvest also have the date of the last update listed near the top of the page."
}
}
view: wh_delivery__harvest_invoices_xa {
sql_table_name: wh_delivery__harvest_invoices_xa ;;
set: wh_delivery__harvest_invoices_xa_set {
  fields: [harvest_invoice_revenue_amount_billed, harvest_client_invoice_sequence_nunber]
}
dimension: harvest_invoice_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_invoice_pk ;;
  description: "Harvest Invoice PK (Public Key) is a unique identifier that accompanies each invoice generated within the Harvest platform. This public key allows users to keep track of invoices and securely access the details of them whenever they need to."
}
dimension: harvest_invoice_revenue_amount_billed {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_revenue_amount_billed ;;
  description: "Harvest invoice revenue amount billed is the total amount the customer was invoiced for the harvest. This includes any discounts or promotional amounts due, and may also include any applicable taxes."
}
dimension: harvest_client_invoice_sequence_nunber {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_client_invoice_sequence_nunber ;;
  description: "Harvest Client Invoice Sequence Number is a unique numerical identifier assigned to each invoice created in the Harvest invoicing system. The identifier is unique and helps identify each invoice, ensuring accuracy when managing multiple invoices."
}
}
view: wh_delivery__harvest_projects_fact {
sql_table_name: wh_delivery__harvest_projects_fact ;;
set: wh_delivery__harvest_projects_fact_set {
  fields: [
    harvest_project_name,
    harvest_project_code,
    harvest_project_notes,
    harvest_project_bill_by,
    harvest_project_budget_by,
    harvest_project_hourly_rate,
    harvest_project_cost_budget,
    harvest_project_fee,
    harvest_project_budget,
    harvest_project_over_budget_notification_percentage,
    harvest_project_show_budget_to_all,
    harvest_project_cost_budget_include_expenses,
    harvest_project_budget_is_monthly,
    harvest_project_notify_when_over_budget,
    harvest_project_is_billable,
    harvest_project_is_fixed_fee,
    harvest_project_is_active,
  ]
}
dimension: harvest_project_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_project_pk ;;
  description: "Harvest Project PK is an NGO based in Pakistan that works to build a better future for vulnerable communities. The organization focuses on empowerment, especially for women, through education, health, and sustainable development. Their initiatives have had an impact on nearly 1 million people in 300+ villages. Their main mission is to unlock Pakistan’s potential to end poverty by 2030 and to ensure that all people, regardless of gender, socio-economic status, access to resources, and skill level, can thrive, participate, and contribute to the development of their communities."
}
dimension: harvest_client_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_client_fk ;;
  description: "A harvest client foreign key is a unique identifier associated with a client in a database in order to easily establish relationships with other data tables. It allows a database system to quickly and accurately associate a client with their data."
}
dimension: harvest_project_name {
  type: string
  sql: ${TABLE}.harvest_project_name ;;
  description: "Harvest project names can vary depending on the type of project, but some examples include Harvest Solutions, Croptime, HarvestFarms, AgroHarvest, and FieldLogic."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_code {
  type: string
  sql: ${TABLE}.harvest_project_code ;;
  description: "Harvest Project Code is a website that provides open-source software development tools specifically designed to increase the efficiency, speed, and accuracy of projects. The code is designed to help software developers work together more effectively and quickly in a collaborative, distributed manner. The tools are primarily focused on task management, bug tracking, and source control, although other features also exist."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_notes {
  type: string
  sql: ${TABLE}.harvest_project_notes ;;
  description: "Harvest Project Notes is a mobile web platform that serves as a knowledge tool and central hub for education, evaluation and program planning for community organizations and non-profit agencies. It provides a secure environment for collaboration and central access to a shared set of resources and tools for agency staff to better manage their data. It offers an array of applications including assessment and tracking, monetary and technical resources, workflow automation, reporting and analytics, and more."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_bill_by {
  type: string
  sql: ${TABLE}.harvest_project_bill_by ;;
  description: "The Harvest Project bill is supported and funded by the United States Department of Agriculture's Farm Service Agency and the Natural Resources Conservation Service."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_budget_by {
  type: string
  sql: ${TABLE}.harvest_project_budget_by ;;
  description: "The budget for a harvest project will vary depending on factors such as the size and scope of the project, any equipment that needs to be purchased or rented, and the amount of labor required. Generally speaking, a harvest project budget should include a balance of funds for labor, materials, overhead costs, and contingency funds."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_hourly_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_hourly_rate ;;
  description: "The hourly rate for the Harvest project varies depending on the type of work being done and a number of factors, including the location of the project and the skills of the worker. If you are interested in working on a Harvest project, you should contact the project manager to find out their exact rate."
}
dimension: harvest_project_cost_budget {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_cost_budget ;;
  description: "The cost of a harvest project will depend on the complexity of the project and other factors, such as the number of people involved, the materials and equipment needed, and the duration of the project. Thus, there is no standard budget for a harvest project. Instead, each project should be evaluated individually in order to determine what a reasonable budget should be."
}
dimension: harvest_project_fee {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_fee ;;
  description: "Harvest project fees are the fees that a farmer pays for the services of a harvester hired to collect their crop at harvest time. The fee can include the cost of labor, supplies, and equipment used to harvest the crop. There may also be additional fees for personnel, vehicles, and storage containers required for certain crops."
}
dimension: harvest_project_budget {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_budget ;;
  description: "The budget of a harvest project will depend on the scope of the project, the services and equipment needed, the length of the project and any other applicable factors. It is best to work with a qualified project manager to determine the exact cost for a specific project."
}
dimension: harvest_project_over_budget_notification_percentage {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_project_over_budget_notification_percentage ;;
  description: "There is no standard percentage for Harvest Project over budget notifications. Each project manager must determine the percentage that they believe is appropriate for their specific project."
}
dimension: harvest_project_show_budget_to_all {
  type: yesno
  sql: ${TABLE}.harvest_project_show_budget_to_all ;;
  description: "The Harvest Project show budget will depend on the type of show, location, production elements, and other factors. The best way to get an estimate is to contact the Harvest Project and discuss your needs with their staff."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_cost_budget_include_expenses {
  type: yesno
  sql: ${TABLE}.harvest_project_cost_budget_include_expenses ;;
  description: "The cost of a harvest project will vary greatly depending on the type of harvest, the size and scope of the project, and other factors. A basic harvesting project cost budget will typically include materials and supplies, equipment rental or purchasing, labor costs, transport and accommodation, consultant fees, and other related expenses. Other costs may include permits, marketing, and any contingencies."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_budget_is_monthly {
  type: yesno
  sql: ${TABLE}.harvest_project_budget_is_monthly ;;
  description: "The budget for Harvest projects can vary greatly depending on what is involved. Some projects may require minimal costs, such as purchasing seed and equipment, while others could require more significant investments, such as hiring people to help with the project and buying land. It is best to determine your budget before getting started so that you can plan accordingly."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_notify_when_over_budget {
  type: yesno
  sql: ${TABLE}.harvest_project_notify_when_over_budget ;;
  description: "Harvest Project Notify is a feature of the Harvest Project Management tool that sends notifications when projects exceed their budgets. It helps project managers to monitor the progress of their projects and be informed if they are going over budget. The notifications will include information about the current project cost versus its budgeted cost, and will alert managers to potential financial issues with their projects."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_is_billable {
  type: yesno
  sql: ${TABLE}.harvest_project_is_billable ;;
  description: "No, the Harvest Project is not billable. The Harvest Project is a research effort initiated by the National Center for Aerospace and Transportation Technologies (NCATT) to identify and collect data on the economic and environmental benefits of sustainable aviation biofuel production and use. It is funded by the Federal Aviation Administration (FAA) and a coalition of industry partners. The project includes research activities such as socio-economic impact analysis and policy development, as well as educational outreach."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_is_fixed_fee {
  type: yesno
  sql: ${TABLE}.harvest_project_is_fixed_fee ;;
  description: "Harvest project fixed-fee is a per-project basis that is structured upfront. This fee is used to provide customers with an agreed-upon project timeline, budget, deliverables, and resources. This allows clients to know before a project starts that they are paying a fixed fee and that there will be no surprises or hidden costs. The fixed-fee option also allows customers to rest assured that their project is completed on time and on budget."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension: harvest_project_is_active {
  type: yesno
  sql: ${TABLE}.harvest_project_is_active ;;
  description: "Yes, the Harvest Project is currently active and operating in several locations in the United States. The Harvest Project works to provide immediate, tangible resources to families facing crisis, and works to build trust, referrals and connections to lead to pathways to end poverty and to increase self-sufficiency."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
dimension_group: harvest_project_over_budget_notification_date {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_over_budget_notification_date ;;
  description: "The exact date for a harvest project over budget notification depends on the particular project and its budget guidelines. In most cases, over budget notifications are issued as soon as it is identified that the project is unable to meet its budget."
}
dimension_group: harvest_project_created_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_created_at ;;
  description: "Harvest Project was created at the University of Calgary in Canada."
}
dimension_group: harvest_project_ends_on {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_ends_on ;;
  description: "The Harvest Project typically ends on the last day of October, or Halloween."
}
dimension_group: harvest_project_updated_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_updated_at ;;
  description: "The latest version of Harvest Project was updated on June 10, 2020."
}
dimension_group: harvest_project_starts_on {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_project_starts_on ;;
  description: "The Harvest Project typically starts in late summer and continues until the end of fall or early winter. However, the exact starting date for the project is determined by the region's growing season and can vary from year to year."
}
}
view: wh_delivery__harvest_tasks_dim {
sql_table_name: wh_delivery__harvest_tasks_dim ;;
set: wh_delivery__harvest_tasks_dim_set {
  fields: [
    harvest_task_name,
    harvest_task_default_hourly_rate,
    harvest_task_is_billable_by_default,
    harvest_task_is_default,
    harvest_task_is_active,
  ]
}
dimension: harvest_task_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_task_pk ;;
  description: "A primary key is a unique identifier that is used to uniquely identify a single row or record in a database table. A harvest task primary key is a field, or multiple fields, that uniquely identifies a particular record in the harvest task table. It is typically used as a reference to identify a specific record and allows for data retrievals and updates to be made in an organized and efficient manner."
}
dimension: harvest_task_name {
  type: string
  sql: ${TABLE}.harvest_task_name ;;
  description: "Harvest Task is the platform used for time tracking and invoicing for freelancers and contractors."
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
dimension: harvest_task_default_hourly_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_task_default_hourly_rate ;;
  description: "The default hourly rate for a Harvest task depends on the payment plan that is chosen. However, most Harvest plans have an hourly rate starting at $8.00 per hour."
}
dimension: harvest_task_is_billable_by_default {
  type: yesno
  sql: ${TABLE}.harvest_task_is_billable_by_default ;;
  description: "No, by default, harvest tasks are not billable. Billability can be set on a task-by-task basis."
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
dimension: harvest_task_is_default {
  type: yesno
  sql: ${TABLE}.harvest_task_is_default ;;
  description: "Harvest task is default is a task scheduler used by Harvest which allows you to schedule tasks that are repeated regularly on a daily, weekly, or monthly basis. Tasks can be setup to be executed at a certain time each day or week, or to only run once, such as a weekly balance sheet update. Harvest task is default allows you to automate many of the repetition tasks you would have to manually complete, such as updating data or reports."
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
dimension: harvest_task_is_active {
  type: yesno
  sql: ${TABLE}.harvest_task_is_active ;;
  description: "Harvest task is active is when an individual is in charge of maintaining and harvesting a particular crop. This includes activities such as planting, fertilizing, pruning, irrigating, weeding and harvesting. Harvest task is an essential part of any agricultural management plan and is necessary for guaranteeing good yields."
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
dimension_group: harvest_task_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_task_created_at_ts ;;
  description: "A Harvest Task is a time tracking and project management tool that enables employers to keep track of their team’s progress on specific tasks. It allows managers to assign, track and review tasks in an organized way. Tasks and projects can also be tracked in real-time with the help of Harvest."
}
dimension_group: harvest_task_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_task_updated_at_ts ;;
  description: "Harvest Task Updated at TS typically refers to tasks that have been updated in Harvest, a project management and time-tracking software. It means that a previously created task has been modified in some way, either by adding more information or making changes to the due date."
}
}
view: wh_delivery__harvest_time_sheets_fact {
sql_table_name: wh_delivery__harvest_time_sheets_fact ;;
set: wh_delivery__harvest_time_sheets_fact_set {
  fields: [
    harvest_external_reference_jira_issue_key,
    harvest_timesheet_notes,
    harvest_timesheet_locked_reason,
    harvest_timesheet_billable_rate,
    harvest_timesheet_cost_rate,
    harvest_timesheet_hours,
    harvest_timesheet_hours_budgeted,
    harvest_external_reference_permalink,
    harvest_external_reference_platform,
    harvest_timesheet_is_billable,
    harvest_timesheet_is_closed,
    harvest_timesheet_is_running,
    harvest_timesheet_is_billed,
    harvest_timesheet_is_locked,
    harvest_timesheet_started_at,
  ]
}
dimension: harvest_timesheet_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.harvest_timesheet_pk ;;
  description: "Harvest Timesheet PK is a web application designed to help small businesses and freelancers track their time and expenses. It allows users to easily log their time with a simple and intuitive web interface, and also compare their timesheets to track performance and profitability. Harvest Timesheet PK is designed to be easy to use and efficient with features such as timers, reports, financial forecasts, and more."
}
dimension: harvest_external_reference_jira_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_external_reference_jira_fk ;;
  description: "Harvest External Reference JIRA Foreign Key is an attribute associated with a JIRA entity that stores the user's Harvest ID for identity mapping and historical reporting. This foreign key is used to link the user's Harvest account with its corresponding JIRA account, allowing for traceability and accurate reporting."
}
dimension: harvest_task_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_task_fk ;;
  description: "A foreign key in a harvest task is a field or columns in a relational database table that links two tables together. It is used to connect one table to another and establish a relationship between them. For example, a foreign key in a harvest task table may link the harvest task table to a crop table, allowing the harvest task table to access information from the crop table."
}
dimension: harvest_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.harvest_project_fk ;;
  description: "A foreign key in a Harvest project is a column in the project's database table which holds the primary key value of another table. This allows related records to be linked together in a many-to-one relationship."
}
dimension: harvest_external_reference_jira_issue_key {
  type: string
  sql: ${TABLE}.harvest_external_reference_jira_issue_key ;;
  description: "Harvest External Reference Jira Issue Key is a unique identifier which ties a Harvest Timer record to a corresponding Jira Issue. The External Reference is displayed near the top of the Timer details panel."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_timesheet_natural_key ;;
  description: "A harvest timesheet natural key is a unique identifier for a timesheet, usually a combination of the employee's name and the date of the timesheet."
}
dimension: harvest_employee_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_natural_key ;;
  description: "A harvest employee natural key is an identifying number that is assigned to each employee in the company and remains the same throughout their time there, even if their job title or department changes. The natural key may be a combination of the employee's first and last name, a social security number, or a unique ID number provided by the company."
}
dimension: harvest_task_assignment_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_task_assignment_natural_key ;;
  description: "A harvest task assignment natural key is a unique identifier used to identify a particular task assignment in a harvest system. It is typically a combination of the task and worker IDs that uniquely identify the assignment, and allow users to track and monitor the progress of the assignment."
}
dimension: harvest_employee_assignment_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_employee_assignment_natural_key ;;
  description: "A harvest employee assignment natural key is a unique identifier for employee assignments, such as a combination of harvest identifier and employee identifier. This natural key is typically used to join multiple tables and queries in a database to ensure accurate and reliable data for reporting and analysis."
}
dimension: harvest_invoice_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_invoice_natural_key ;;
  description: "A harvest invoice natural key is a unique identifier associated with a particular harvest invoice. It typically consists of a combination of the supplier’s name, the invoice number, and the invoice date. This unique combination of information can be used to quickly and easily match a particular harvest invoice to its corresponding records in other systems."
}
dimension: harvest_client_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_client_natural_key ;;
  description: "The harvest client natural key is the unique identifier used by Harvest to identify each client. It typically starts with a \"c\" followed by some numbers, such as c452985."
}
dimension: harvest_timesheet_notes {
  type: string
  sql: ${TABLE}.harvest_timesheet_notes ;;
  description: "Harvest Timesheet Notes is a feature within the Harvest time tracking app that allows users to jot down notes while they are completing their timesheets. Users can add notes to keep track of how they spent their time and to document tasks that are relevant to the clients and projects they are working on. Not only does the feature provide a convenient way to keep track of the time a user has worked, it also creates a record for a project manager or client to look back on for information regarding the project."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_locked_reason {
  type: string
  sql: ${TABLE}.harvest_timesheet_locked_reason ;;
  description: "Harvest Timesheet Locked Reason is typically when an administrator or manager has locked a timesheet in order to prevent any changes being made to the timesheet. This may be done to prevent an employee from adjusting their timesheet, or to ensure timesheet accuracy."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_billable_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_timesheet_billable_rate ;;
  description: "The \"billable rate\" is the amount of money per hour that an employee will be expected to charge clients for the services provided. This rate is often negotiated between the employee, employer and client and may vary depending on the particular job and individual."
}
dimension: harvest_timesheet_cost_rate {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_timesheet_cost_rate ;;
  description: "The cost rate associated with Harvest Timesheet is dependent on the plan you choose. The free plan allows you to track up to two projects and two users, while the paid plans start at $12/month for up to five users and 10 projects."
}
dimension: harvest_timesheet_hours {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_timesheet_hours ;;
  description: "Harvest Timesheet hours refer to the number of hours a worker has spent working on a particular project or assignment as logged in the Harvest Timesheets application. Harvest Timesheets allows workers to track and manage the time they spend working on various assignments and tasks. This can help employers stay on top of how many hours their employees are working and ensure that they are being appropriately compensated for the time they put in."
}
dimension: harvest_timesheet_hours_budgeted {
  hidden: yes 
  type: number
  sql: ${TABLE}.harvest_timesheet_hours_budgeted ;;
  description: "Harvest timesheet hours budgeted is the number of hours that have been budgeted for a specific project. This budget will be used to ensure that the project is completed in a timely manner and within a specific scope."
}
dimension: harvest_external_reference_permalink {
  type: string
  sql: ${TABLE}.harvest_external_reference_permalink ;;
  description: "A Harvest external reference permalink is a permanent hyperlink to a resource outside of Harvest that can be used as a reference or bookmark. It is typically used to link to documents and webpages that are relevant to a project, task, or issue in Harvest."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_external_reference_platform {
  type: string
  sql: ${TABLE}.harvest_external_reference_platform ;;
  description: "The Harvest External Reference Platform (EPRP) is an online platform from Harvest, a provider of IT services and consulting, that helps organizations increase the productivity of enterprise applications and database management systems by providing data synchronization and management tools. These tools help organizations keep their systems up-to-date, allowing them to access large amounts of data quickly and efficiently. By connecting desktop systems to web services—including enterprise applications, web-based content providers, and database servers—the platform helps organizations efficiently manage large amounts of data and maintain system integrity. Additionally, the Harvest EPRP provides tools for efficient auditing and reporting, making it easy to track data changes and detect errors or malicious activities."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_is_billable {
  type: yesno
  sql: ${TABLE}.harvest_timesheet_is_billable ;;
  description: "Harvest Timesheet is not a billable item. It is a software used to track and manage your time and project data; it does not generate invoices or charge for its services."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_is_closed {
  type: yesno
  sql: ${TABLE}.harvest_timesheet_is_closed ;;
  description: "Harvest Timesheet is closed indicates that timesheet tracking has been turned off in a Harvest account. This means that employees no longer need to record the time they spend on tasks or projects in the system. In other words, their time will not be tracked or tracked against a project for billing or for reporting."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_is_running {
  type: yesno
  sql: ${TABLE}.harvest_timesheet_is_running ;;
  description: "Harvest Timesheet is an internet-based time tracking and project management service. It is designed to help small businesses, teams and freelancers to track who is working on what, when and how much they are spending. With Harvest, you can easily track the hours your team spends on each project and then bill your clients accordingly. It also gives you the ability to track billable and non-billable time, and you can even set budgets for each project and receive alerts when those budgets are exceeded."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_is_billed {
  type: yesno
  sql: ${TABLE}.harvest_timesheet_is_billed ;;
  description: "Harvest Timesheet is billed based on the number of users on the account. The pricing per user varies depending on the type of plan you select. The monthly or annual plans offer discounts for the longer commitment."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension: harvest_timesheet_is_locked {
  type: yesno
  sql: ${TABLE}.harvest_timesheet_is_locked ;;
  description: "Harvest timesheet is locked is a feature that prevents timesheets from being altered once an employee has submitted them to their supervisor. This helps maintain the integrity of time tracking data and ensures accurate time tracking and reporting."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension_group: harvest_timesheet_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_timesheet_created_at_ts ;;
  description: "Harvest Timesheet is a web-based timesheet and invoicing system designed to help businesses and freelancers track their time, send invoices, and measure productivity. It was created by Harvest, a product of Freshbooks, in 2008."
}
dimension_group: harvest_timesheet_timer_started_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_timesheet_timer_started_at_ts ;;
  description: "Harvest Timesheet Timer started at TS is an online time and project tracking application that allows users to track the time they spend working on projects, tasks and services. With Harvest, users can easily monitor the hours they spend on each project, quickly track and submit timesheets, and get detailed reports on all their time and project activities."
}
dimension: harvest_timesheet_started_at {
  type: string
  sql: ${TABLE}.harvest_timesheet_started_at ;;
  description: "Harvest Timesheets first launched in 2012."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
dimension_group: harvest_timesheet_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_timesheet_updated_at_ts ;;
  description: "Harvest Timesheet is time tracking software designed to help track hours worked on projects and clients for businesses. It allows users to log their time, keep track of projects, assign tasks and collaborate with their team. The TS feature updates Harvest with timesheets that have been submitted, approved, distributed, exported and merged. It includes a visual activity chart which shows users their progress over the week."
}
dimension_group: harvest_timesheet_spent_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.harvest_timesheet_spent_at_ts ;;
  description: "Harvest Timesheet is a web-based time tracking system which allows users to easily track, log, and submit time worked. Features include a timer, an intuitive web-based timesheet, project management, reporting, and invoicing. It is designed to enable businesses of any size to track employee time and manage projects effectively."
}
}
view: wh_delivery__jira_daily_issue_field_history_fact {
sql_table_name: wh_delivery__jira_daily_issue_field_history_fact ;;
set: wh_delivery__jira_daily_issue_field_history_fact_set {
  fields: [jira_daily_issue_field_history_status, jira_daily_issue_field_history_sprint]
}
dimension: jira_daily_issue_field_history_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_daily_issue_field_history_pk ;;
  description: "Jira Daily Issue Field History PK is a special field in Jira that keeps track of the changes that were made to an issue over time. It stores a new record whenever an issue is updated, and the data fields include: issue number, data and time of the change, name of user who made the change, and issue field that was changed. The records are stored in a unique format, or \"PK,\" which is a protected key that keeps the records safe from unnecessary changes."
}
dimension: jira_issue_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_fk ;;
  description: "Jira Issue Foreign Key is a unique identifier for an issue in Jira, which can be used to reference it from other applications and databases. This key is also known as an issue number, and it's often used to reference the issue in conversations, emails, and other forms of communication."
}
dimension: jira_daily_issue_field_history_status {
  type: string
  sql: ${TABLE}.jira_daily_issue_field_history_status ;;
  description: "Jira's Daily Issue Field History Status is a feature on the Jira platform that allows users to view the history of the changes that have been made to an issue's custom fields. This information is displayed in a timeline and includes the user who made the change, the date and time of the change, and the changes that were made. Additionally, a comment may also be attached to each change to explain the rationale behind it. This feature provides valuable insight into the progress of an issue over time and can be a useful tool for project managers, developers, and other stakeholders."
  drill_fields: [wh_delivery__jira_daily_issue_field_history_fact_set*]
}
dimension: jira_daily_issue_field_history_sprint {
  type: string
  sql: ${TABLE}.jira_daily_issue_field_history_sprint ;;
  description: "JIRA Daily Issue Field History Sprint is an Atlassian-powered feature that tracks the history of field changes for one or more selected issues over a period of time. It helps you to analyse the impact of different field changes on issues, estimate or review the progress of your team and identify major bottlenecks. It can also be used to get a better understanding of how work is progressing in a sprint or project."
  drill_fields: [wh_delivery__jira_daily_issue_field_history_fact_set*]
}
dimension_group: jira_daily_issue_field_history_date_day {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_daily_issue_field_history_date_day ;;
  description: "The JIRA Daily Issue Field History Date Day is a field on the JIRA tracker that stores the date when an activity occurred on an issue. It is typically automatically set to the date of the activity, and can be searchable. This field can be used to track the history of an issue, including when tasks and conversations happened."
}
}
view: wh_delivery__jira_epics_dim {
sql_table_name: wh_delivery__jira_epics_dim ;;
set: wh_delivery__jira_epics_dim_set {
  fields: [jira_epic_name, jira_epic_summary, jira_epic_is_done, jira_epic_key]
}
dimension: jira_epic_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_epic_pk ;;
  description: "An Epic is a large user story or collection of smaller user stories that is larger than a typical user story but smaller than a project. It is a way to group user stories into a single unit. The epic has a primary key that is assigned to it, which is used to identify and track the epic throughout its lifecycle."
}
dimension: jira_epic_name {
  type: string
  sql: ${TABLE}.jira_epic_name ;;
  description: "In Jira, an Epic is a large body of work that is broken down into a number of smaller stories, or sometimes called \"Issues\" in Jira. It is often a narrative or large user story that captures the intent of the work to be carried out. Epic names, however, rely mainly on the discretion of the user."
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
dimension: jira_epic_summary {
  type: string
  sql: ${TABLE}.jira_epic_summary ;;
  description: "A Jira Epic Summary is a summary associated with each Epic in the project. It allows users to quickly review the scope and purpose of the Epic and its linked issues. The Epic Summary is found on the Epic's details page, and includes the Epic Name, Summary, Status, Priority, and team associated with the Epic."
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
dimension: jira_epic_is_done {
  type: yesno
  sql: ${TABLE}.jira_epic_is_done ;;
  description: "A Jira epic is done when all of the tasks and stories within the epic have been completed and all of the acceptance criteria have been met. The project team can then review the completed epic and sign off on it."
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
dimension: jira_epic_key {
  type: string
  sql: ${TABLE}.jira_epic_key ;;
  description: "An Epic key is a unique identifier used in Jira to represent an Epic. It has a format of ‘EPIC-key#’, where key# is usually given by the user or else automatically generated."
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
}
view: wh_delivery__jira_fields_dim {
sql_table_name: wh_delivery__jira_fields_dim ;;
set: wh_delivery__jira_fields_dim_set {
  fields: [jira_field_name, jira_field_is_array, jira_field_is_custom]
}
dimension: jira_field_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_field_pk ;;
  description: "Jira Field PK (primary key) is an automatically generated, unique identifier used when creating a Jira issue. It is used to uniquely identify each Jira issue and is typically made up of a combination of numbers and letters."
}
dimension: jira_field_name {
  type: string
  sql: ${TABLE}.jira_field_name ;;
  description: "The Jira field name is a way of labeling the various custom fields that can be created and utilized in Jira, such as Priority, Assignee, Reporter, and more."
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
dimension: jira_field_is_array {
  type: yesno
  sql: ${TABLE}.jira_field_is_array ;;
  description: "A Jira field is an array of information stored on an issue within a Jira project. It can contain information about a certain part of the project such as project details, systems, tasks, subtasks, custom fields, and more. Each array contains key-value pairs that are stored on an issue depending on the type of data it stores."
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
dimension: jira_field_is_custom {
  type: yesno
  sql: ${TABLE}.jira_field_is_custom ;;
  description: "Jira Field is Custom refers to the ability to make custom fields in Jira software. This feature gives admins control over the types of data they track in their project, allowing them to create additional fields of information that meet their project needs. Custom fields can be used to store a wide range of data and help make your Jira workflow even more efficient."
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
}
view: wh_delivery__jira_issues_board_bridge {
sql_table_name: wh_delivery__jira_issues_board_bridge ;;
set: wh_delivery__jira_fields_dim_set {
  fields: [jira_field_name, jira_field_is_array, jira_field_is_custom]
}
dimension: jira_issue_board_bridge_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_issue_board_bridge_pk ;;
  description: "Jira Issue Board Bridge PK is a generic tool that provides integration between Jira Issue Board and any third-party system, allowing teams to share data and create a seamless collaboration workflow. It allows users to update Jira tickets from issue boards, and update issue boards from Jira tickets. It also enables sharing of custom fields between the two systems. Jira Issue Board Bridge can be used for synchronizing changes between Jira plans and external systems, such as project management tools, customer service applications, and many others."
}
dimension: jira_issue_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_fk ;;
  description: "Jira Issue Foreign Key is a unique identifier for an issue in Jira, which can be used to reference it from other applications and databases. This key is also known as an issue number, and it's often used to reference the issue in conversations, emails, and other forms of communication."
}
dimension: jira_board_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_board_fk ;;
  description: "A JIRA board foreign key is a column in a database table that establishes a relationship between two tables. It is used to ensure that the values in the foreign key field are only those allowed in the primary table. It also ensures that any changes made to the primary table are reflected in the related foreign table."
}
}
view: wh_delivery__jira_issues_fact {
sql_table_name: wh_delivery__jira_issues_fact ;;
set: wh_delivery__jira_issues_fact_set {
  fields: [
    jira_issue_summary,
    jira_issue_description,
    jira_issue_project,
    jira_issue_assignee,
    jira_issue_reporter,
    jira_issue_priority,
    jira_issue_creator,
    jira_issue_issue_type,
    jira_issue_key,
    jira_issue_status_description,
    jira_issue_status_name,
    jira_issue_status_stage,
    jira_issue_is_done,
    jira_issue_type,
    jira_issue_parent_issue_type,
    jira_issue_parent_issue_name,
    jira_issue_is_parent_epic,
    jira_issue_resolution_type,
    jira_issue_work_ratio,
    jira_issue_status,
    jira_issue_conversation,
    jira_issue_current_status,
    jira_issue_current_status_category,
    jira_issue_current_priority,
    jira_issue_sprint,
    jira_issue_current_sprint_name,
    jira_issue_is_active_sprint,
    jira_issue_fixes_versions,
    jira_issue_count_sprint_changes,
    jira_issue_time_spent_seconds,
    jira_issue_count_comments,
    jira_issue_open_duration_seconds,
    jira_issue_any_assignment_duration_seconds,
    jira_issue_last_assignment_duration_seconds,
    jira_issue_story_point_estimate,
    jira_issue_original_estimate,
    jira_issue_remaining_estimate,
  ]
}
dimension: jira_issue_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_issue_pk ;;
  description: "In Jira, the primary key of an issue is the Issue Number, which is a unique, numbered identifier for each issue in the system. It is used to differentiate between different issues and can be used to reference an issue when discussing it or searching for it in the system."
}
dimension: jira_issue_parent_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_parent_fk ;;
  description: "Jira Issue ParentForeignKey (also known as Story Parent Issue Key) is a field that is populated when setting up complex parent-child relationships between issues in Jira. This field tracks the issue key (a unique identifier for each issue) of the parent issue for any child issue. It is used to keep track of the relation between multiple issues that may be used as part of a larger workflow, and to help ensure that issues are properly organized in the system."
}
dimension: jira_user_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_user_fk ;;
  description: "A Jira user foreign key is a unique identifier that contains information related to a specific user who is accessing a Jira instance. It is used to link a user's data across different Jira instances or datastores. The value of the foreign key is typically an alphanumeric string and can be used to access user-specific data relative to their permissions."
}
dimension: jira_creator_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_creator_fk ;;
  description: "A foreign key is a field in a database table that is used to link two different tables. In JIRA, a foreign key is used to identify the creator of an issue, such as an Epic or a Story. It is typically used to link the creator of one issue to other related issues."
}
dimension: jira_reporter_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_reporter_fk ;;
  description: "A Jira reporter foreign key is a reference key linking external user records with user records within Jira. This allows a foreign system to connect user records with Jira to ensure that any data submitted to Jira is tied to the correct user account."
}
dimension: jira_resolution_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_resolution_fk ;;
  description: "Jira Resolutionforeign Key is an option within the Jira project management software that links a given issue to its resolution. It is a unique identifier that is used to reference the resolution of a specific issue, and allows for tracking and determining the success or failure of the resolution."
}
dimension: jira_current_sprint_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_current_sprint_fk ;;
  description: "A foreign key in Jira is a custom field of type \"Select List (Cascading)\" that allows you to link a parent issue to one or more child issues. The current sprint option in Jira uses the foreign key field for linking issues and displaying the issues belonging to a particular sprint."
}
dimension: jira_external_reference_jira_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_external_reference_jira_fk ;;
  description: "JIRA external reference JIRA foreign key is a feature that allows users to quickly and easily identify the relationship between records across their JIRA instances. The feature creates a numbered identifier for a given record and associates it with references on other JIRA instances. This feature allows organizations to maintain data integrity and keep a single source of truth across JIRA."
}
dimension: jira_issue_natural_key {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_natural_key ;;
  description: "A JIRA issue natural key is a unique identifier assigned to each issue created in JIRA. It is a concatenation of the project key and the issue number. It takes the format <PROJECT_KEY>-<ISSUE_NUMBER>. For example, ‘ABC-123’ might be the JIRA issue natural key for an issue in a project with the key ‘ABC’."
}
dimension: jira_issue_summary {
  type: string
  sql: ${TABLE}.jira_issue_summary ;;
  description: "JIRA issue summary is a brief description of the issue that will help other people understand the issue more quickly. It should include the key problem statement and its context."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_description {
  type: string
  sql: ${TABLE}.jira_issue_description ;;
  description: "Jira issue description is a text field associated with an issue that provides a detailed description of the issue, including any supporting information needed to help explain, reproduce, and resolve the issue. This field should provide as much information as possible and should include screenshots, logs, and other supporting evidence where available."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_project {
  type: string
  sql: ${TABLE}.jira_issue_project ;;
  description: "Jira Issue Project is a feature within Jira that provides end users with an organized way to manage their projects and tasks. Jira Issue Project allows users to create projects, which contain different issues and tasks related to that project. It also frees users from managing individual tasks separately, as all relevant information (assigned users, deadlines, etc.) can be managed at the project level. Each project can also be customized with multiple options, such as project status tracking, categorization, and workflow."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_assignee {
  type: string
  sql: ${TABLE}.jira_issue_assignee ;;
  description: "Jira issue assignee is a person who has been assigned to handle and solve the issue. This could be a person who is responsible for managing the issue from start to finish or someone who is in charge of delegating the issue to the appropriate personnel."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_reporter {
  type: string
  sql: ${TABLE}.jira_issue_reporter ;;
  description: "Jira Issue Reporter is a GitHub app that automates the reporting of software issues from Jira to GitHub. It integrates with Jira to synchronize issues and connects with GitHub via its webhooks, enabling users to track and receive notifications when changes are made to an issue, use comments to discuss the issue and attachments are available in both systems. The app offers an automated synchronization between Jira and GitHub and allows users to select what issues should be synchronized."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_priority {
  type: string
  sql: ${TABLE}.jira_issue_priority ;;
  description: "In JIRA, an issue priority is a label that describes the importance or urgency of an issue. It helps users quickly assess how fundamental an issue is to a project's overall success. Common priorities include Critical, High, Medium, and Low."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_creator {
  type: string
  sql: ${TABLE}.jira_issue_creator ;;
  description: "Jira Issue Creator is an extension for Google Chrome that allows you to quickly create JIRA issues from any web page. It lets you save time by not having to log into JIRA and manually create a ticket. Issue Creator gives users the ability to quickly create new JIRA tickets easily by selecting the project and issue type and filling out the necessary fields."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_issue_type {
  type: string
  sql: ${TABLE}.jira_issue_issue_type ;;
  description: "Jira Issue Type is a way to categorize and organize issues in Jira. It is used to differentiate between different types of work, such as:

• Bug / Defect
• Story
• Task
• Improvement
• Epic
• Sub-task
• Change Request
• Risk"
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_key {
  type: string
  sql: ${TABLE}.jira_issue_key ;;
  description: "A Jira issue key is a unique identifier used to identify a specific issue or task in a Jira system. They typically consist of a project abbreviation followed by a hyphen and a numerical value. For example, ACC-123 is an example of a Jira issue key."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_status_description {
  type: string
  sql: ${TABLE}.jira_issue_status_description ;;
  description: "Jira issue status is a description of the issue's condition in the workflow. It is a description of the issue's current state and provides information about what action needs to taken next. Examples of issue statuses include “Open”, “In Progress”, “Resolved”, “Closed”, “Reopened”, and “On Hold”. Each status label explains the status of the issue and provides the appropriate next action."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_status_name {
  type: string
  sql: ${TABLE}.jira_issue_status_name ;;
  description: "Jira issue status names include:
Open,  In Progress, Reopened, Resolved, Closed, On Hold, Incomplete, and Duplicate."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_status_stage {
  type: string
  sql: ${TABLE}.jira_issue_status_stage ;;
  description: "The JIRA issue status stage is typically composed of seven stages: Open, In Progress, Reopened, Resolved, Closed, Incomplete, and Rejected. The status of the issue changes as it progresses through the steps of the issue lifecycle."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_is_done {
  type: yesno
  sql: ${TABLE}.jira_issue_is_done ;;
  description: "A Jira issue is considered done when it has been tested and closed as resolved. This will typically include the completion of tasks, acceptance of the feature or bug fix, or other activities that mark the end of the issue."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_type {
  type: string
  sql: ${TABLE}.jira_issue_type ;;
  description: "Jira issue types are the different types of issues you can log in Jira. Common issue types include tasks, bugs, stories, epics, and any custom issue type you might have created in your instance. Each issue type is designed to help organize and categorize your work."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_parent_issue_type {
  type: string
  sql: ${TABLE}.jira_issue_parent_issue_type ;;
  description: "In Jira, a parent issue type is a type of issue that can be assigned multiple subtasks to complete parts of the larger job. Sub-tasks are created to break down a complex task into more manageable chunks."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_parent_issue_name {
  type: string
  sql: ${TABLE}.jira_issue_parent_issue_name ;;
  description: "Jira does not have the concept of a \"parent issue\". However, Jira does have the concept of a \"sub-task\" which can connect an issue to another issue."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_is_parent_epic {
  type: yesno
  sql: ${TABLE}.jira_issue_is_parent_epic ;;
  description: "In JIRA, an Epic is a large body of work that can be broken down into smaller user stories and tasks. An Epic is a container for issues, used to organize them in a way that best reflects your workflow. An Issue is a unit of work within an Epic. It could be a feature, bug, or chore, and can be complicated or small. A Parent Epic is the highest-level Epic within a hierarchy of Epics and their related Issues."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_resolution_type {
  type: string
  sql: ${TABLE}.jira_issue_resolution_type ;;
  description: "Jira issue resolution types are the different ways an issue is marked as resolved. The most common resolution types are: Fixed, Duplicate, Incomplete, Won't Fix, Cannot Reproduce, Rejected, and Done."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_work_ratio {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_work_ratio ;;
  description: "Jira issue work ratio refers to the ratio of time taken to accomplish tasks relative to the amount of time estimated for those tasks. It is calculated as work done divided by estimated work, or (Time taken for issue/Time Estimated for issue)."
}
dimension: jira_issue_status {
  type: string
  sql: ${TABLE}.jira_issue_status ;;
  description: "Jira issue status is the current state of an issue. These statuses are generally used to indicate the progress of an issue or task throughout a workflow. Common Jira issue statuses include Open, In Progress, Resolved, and Closed."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_conversation {
  type: string
  sql: ${TABLE}.jira_issue_conversation ;;
  description: "Jira issue conversation is a feature of Jira that allows you to comment on a Jira issue and have conversations with other users about it. This can help to better explain an issue or problem, collaborate on finding a solution, and track progress or changes."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_current_status {
  type: string
  sql: ${TABLE}.jira_issue_current_status ;;
  description: "The current status of a Jira issue will depend on the workflow (process) defined for the issue and the current step or transition in that workflow. Typically, each step in the workflow will have an associated status such as \"To Do\", \"In Progress\", or \"Done\"."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_current_status_category {
  type: string
  sql: ${TABLE}.jira_issue_current_status_category ;;
  description: "Jira issue status categories include:
• Open: The issue is new and is waiting for assignment or additional information before it can be worked on. 
• In Progress: The issue has been assigned and is actively being worked on. 
• Resolved: The issue has been resolved and the problem has been fixed. 
• Closed: The issue is closed, but can be reopened. 
• Reopened: The issue has been reopened and is ready to be worked on again."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_current_priority {
  type: string
  sql: ${TABLE}.jira_issue_current_priority ;;
  description: "The current priority of a Jira issue is based on its individual settings, which will vary from one case to the next. Generally speaking, the priority of an issue is determined by the urgency of its resolution, as determined by the project team who are managing the issue."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_sprint {
  type: string
  sql: ${TABLE}.jira_issue_sprint ;;
  description: "JIRA Issue Sprint is a feature of JIRA Software that allows teams to quickly organize, prioritize, and work on issues. The issue sprint is a way to keep track of who’s working on what, collaborate on tasks and discuss progress in real time. Teams can create sprints from any JIRA filter, assign work to team members, set deadlines, and monitor progress all in one place. With sprints, teams can stay on track for completing important tasks and Epic stories."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_current_sprint_name {
  type: string
  sql: ${TABLE}.jira_issue_current_sprint_name ;;
  description: "The name of the current sprint will vary depending on the Jira instance you're using. For example, if you're using an Agile project in Jira, you can view the current sprint name by navigating to the \"Agile\" > \"Active sprints\" tab."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_is_active_sprint {
  type: yesno
  sql: ${TABLE}.jira_issue_is_active_sprint ;;
  description: "Jira Issue is active sprint is when an issue is placed in an active sprint. This normally means that the issue has been taken on by a development team and is actively in the process of being addressed. Issues placed into an active sprint typically have a timeline associated with them and goals that must be reached before the issue can be considered complete and ready to be released."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_fixes_versions {
  type: string
  sql: ${TABLE}.jira_issue_fixes_versions ;;
  description: "Jira issue fixes versions are special releases or builds of the software that are intended solely to address bug fixes or other small enhancements. They are released in between major versions and are designed to provide bug fixes and minor updates without altering existing functionality in the existing major version."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
dimension: jira_issue_count_sprint_changes {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_count_sprint_changes ;;
  description: "Jira does not keep track of issue counts across sprints changes. It is up to the user to manually track this information."
}
dimension: jira_issue_time_spent_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_time_spent_seconds ;;
  description: "Jira Issue Time Spent Seconds is the total time spent in seconds on an issue in Jira. This field is used to track how much time is spent on specific tasks and records how long it takes to complete those tasks."
}
dimension: jira_issue_count_comments {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_count_comments ;;
  description: "Jira issue count comments are comments that are part of a Jira issue. They are used to communicate, track progress, and provide further context to an issue. Comments are attached to individual Jira issues, and the comment count is used to provide an indication of how active an issue is."
}
dimension: jira_issue_open_duration_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_open_duration_seconds ;;
  description: "There is no specific duration associated with an open Jira issue. The duration will depend on the amount of time it takes to resolve the issue and the priority level assigned to it."
}
dimension: jira_issue_any_assignment_duration_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_any_assignment_duration_seconds ;;
  description: "Jira issue is a time-tracking tool used to log and report on how much time is spent on an assignment or project. This tool is used to record the time spent on individual tasks and is used to monitor project progress as well as generate invoices and/or reports. The duration of a task or assignment can be tracked in minutes, hours or days, depending on the level of granularity needed."
}
dimension: jira_issue_last_assignment_duration_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_last_assignment_duration_seconds ;;
  description: "Jira does not have a concept of assignment duration seconds. Jira tasks are categorized and tracked according to their status (In Progress, Resolved, etc.), not the length of time they have been assigned."
}
dimension: jira_issue_story_point_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_story_point_estimate ;;
  description: "Jira Issue Story Point Estimate is an estimation method for a project within Jira Software. It is a system for assigning values to tasks, based on the complexity, risk and size of the task. It is designed to provide an objective measure of a task's relative size and complexity, enabling teams to more accurately estimate and predict the time a task will take to complete."
}
dimension: jira_issue_original_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_original_estimate ;;
  description: "Jira Issue Original Estimate is the amount of time that is initially estimated to complete a Jira issue. It is set by the assignee after carefully assessing the task. This estimate can be adjusted later if needed."
}
dimension: jira_issue_remaining_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_remaining_estimate ;;
  description: "Jira Issue Remaining Estimate is a setting that allows users to specify how much time is left before an issue is considered completed. It is typically tracked in hours or days, and can be adjusted by individual users as the issue progresses."
}
dimension_group: jira_issue_sprint_started_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_sprint_started_at ;;
  description: "Jira Issue Sprints are typically started at the beginning of a project or milestone. Depending on the size of the project, this could be at the beginning of a sprint, at the beginning of a project, or at a midpoint milestone."
}
dimension_group: jira_issue_sprint_ended_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_sprint_ended_at ;;
  description: "The Sprint will officially end at the same day and time as defined in the Sprint goal. This end date is set at the beginning of the Sprint, and is detailed on the sprint's 'Plan' page in Jira."
}
dimension_group: jira_issue_sprint_completed_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_sprint_completed_at ;;
  description: "A Jira issue sprint is completed when the team has completed all of the tasks and goals that were assigned during the sprint. The sprint is typically marked as complete when all tasks have been resolved, tested and approved. The sprint is then closed and the next sprint is started."
}
dimension_group: jira_issue_first_assigned_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_first_assigned_at ;;
  description: "In Jira, an issue is first assigned to the project administrator, or to the issue creator if they are a project administrator. The project administrator then reviews the issue, sets any necessary labels or components, and assigns it to the best person to take it on."
}
dimension_group: jira_issue_last_assigned_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_last_assigned_at ;;
  description: "Jira issues are assigned to users who are responsible for working on the project. The last person assigned to the issue can be seen in the Assignee field on the Jira issue page."
}
dimension_group: jira_issue_first_resolved_at {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_first_resolved_at ;;
  description: "Jira issues can be resolved in a variety of ways, including through an automated process or by a team member manually. The exact moment when the issue is first resolved at can vary depending on the nature of the issue and how it is resolved."
}
dimension_group: jira_issue_status_category_changed_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_status_category_changed_at_ts ;;
  description: "Jira Issue Status Category changed at TS is a type of workflow transition. This is when a change is made to an issue's Status Category value, usually in response to additional information being made available or a certain criteria being met. This transition could mark an issue as 'done', 'in progress' or 'resolved'."
}
dimension_group: jira_issue_resolved_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_resolved_at_ts ;;
  description: "Jira Issue Resolved at TS is when a technical support specialist resolves an issue reported in Jira (an issue tracking software platform) for a customer or employee. This resolution could involve investigating the cause of the issue and then either fixing, changing, or providing a workaround for the issue."
}
dimension_group: jira_issue_last_viewed_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_last_viewed_at_ts ;;
  description: "Jira does not store information on \"last viewed\" times for issue records. The only way to obtain this kind of information is to look at the audit logs for the specific issue."
}
dimension_group: jira_issue_due_date_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_due_date_at_ts ;;
  description: "The Jira issue due date is determined by the assignee of that issue. The assignee can specify a due date, or the project administrator can set a default due date for all Jira issues."
}
dimension_group: jira_issue_created_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_created_at_ts ;;
  description: "Jira Issue Created at TS is a term used in Jira, which stands for Issue Created Time Stamp. This is the date and time a ticket is created in the Issue Tracking System. This is the very first entry in the Issue Tracking System and helps Jira users keep track of ticket changes over time."
}
dimension_group: jira_issue_updated_at_ts {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_updated_at_ts ;;
  description: "JIRA Issue Updated At Ts is an automated field in JIRA that updates the issue with the exact timestamp when it was last updated. This field is typically displayed together with other issue information, like status, resolution, or assignee. It can be used to accurately track the progress of a given project or track issues resolved within a certain time frame."
}
}
view: wh_delivery__jira_issues_field_history_fact {
sql_table_name: wh_delivery__jira_issues_field_history_fact ;;
set: wh_delivery__jira_issues_field_history_fact_set {
  fields: [jira_issue_field_history_is_active, jira_issue_field_history_story_point_estimate, jira_issue_field_history_status_description, jira_issue_field_history_status_name]
}
dimension: jira_issues_field_history_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_issues_field_history_pk ;;
  description: "The issues field history primary key is a unique identifier that is assigned to each record in the field history table. It is used to uniquely identify each record and also serves as a reference point when linking related records."
}
dimension: jira_field_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_field_fk ;;
  description: "A Jira Field Foreign Key is a type of field in Jira that can be used to link different issues. It provides a way to keep track of related tasks, previously opened bugs and even future tasks by connecting them all with a foreign key. It also helps to quickly find related issues and bring updates from related issues in the main view."
}
dimension: jira_issue_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_fk ;;
  description: "Jira Issue Foreign Key is a unique identifier for an issue in Jira, which can be used to reference it from other applications and databases. This key is also known as an issue number, and it's often used to reference the issue in conversations, emails, and other forms of communication."
}
dimension: jira_issue_field_history_is_active {
  type: yesno
  sql: ${TABLE}.jira_issue_field_history_is_active ;;
  description: "Yes, the Jira Issue Field History is active. The Issue Field History provides information about changes made to the specific field in an issue. It shows when, who and what value the field had at that point in time."
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
dimension: jira_issue_field_history_story_point_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_field_history_story_point_estimate ;;
  description: "Jira issue field history story point estimate is a field that stores the estimated story points of a given issue at different points throughout its lifetime. It allows teams to view and understand why and how the estimates of an issue have changed over time."
}
dimension: jira_issue_field_history_status_description {
  type: string
  sql: ${TABLE}.jira_issue_field_history_status_description ;;
  description: "Jira Issue Field History is a tool within Jira that allows administrators the ability to audit changes to certain fields on an issue. It captures when a field is changed, who made the change, from which value to which value, and optional associated comments."
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
dimension: jira_issue_field_history_status_name {
  type: string
  sql: ${TABLE}.jira_issue_field_history_status_name ;;
  description: "The Jira issue field history status name is \"Status\". This is the field that holds the current and historic values of the Status of the Jira issue, such as Open, In Progress, Reopened, Closed, etc."
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
dimension_group: jira_issue_field_history_timestamp {
  timeframes: [time,hour_of_day,raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: timestamp
  sql: ${TABLE}.jira_issue_field_history_timestamp ;;
  description: "A Jira Issue Field History Timestamp is a timestamp that records the last time the value of a field was changed in a JIRA issue. It is used to track the latest changes made to any field value within the JIRA issue."
}
}
view: wh_delivery__jira_issues_sprint_bridge {
sql_table_name: wh_delivery__jira_issues_sprint_bridge ;;
set: wh_delivery__jira_issues_field_history_fact_set {
  fields: [jira_issue_field_history_is_active, jira_issue_field_history_story_point_estimate, jira_issue_field_history_status_description, jira_issue_field_history_status_name]
}
dimension: jira_issue_sprint_bridge_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_issue_sprint_bridge_pk ;;
  description: "Jira Issue Sprint Bridge PK is an add-on for Jira Cloud and Jira Server. It provides project managers with a way to connect Jira issues to sprints, allowing teams to better coordinate their sprints and manage their back logs more efficiently. The add-on helps to bridge the gap between sprint planning and task execution, providing PMs and developers with an insight into which issues are associated with which sprint and what the progress of each issue is."
}
dimension: jira_issue_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_issue_fk ;;
  description: "Jira Issue Foreign Key is a unique identifier for an issue in Jira, which can be used to reference it from other applications and databases. This key is also known as an issue number, and it's often used to reference the issue in conversations, emails, and other forms of communication."
}
dimension: jira_sprint_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_sprint_fk ;;
  description: "Jira Sprint Foreign Key is a unique identifier for a Jira Sprint. It is an alphanumeric string of characters created by Jira when a sprint is created. Foreign Key can be used to keep track of different sprints and is also used to link sprints to related data in an external system."
}
}
view: wh_delivery__jira_issues_xa {
sql_table_name: wh_delivery__jira_issues_xa ;;
set: wh_delivery__jira_issues_xa_set {
  fields: [jira_issue_development_stage, jira_issue_duration, jira_issue_age_in_days, jira_issue_summary_story_point_estimate]
}
dimension: jira_issue_summary_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_issue_summary_pk ;;
  description: "Jira Issue Summary Primary Key is a unique identifier that identifies each issue within a project in Jira. It is composed of a project abbreviation, issue type abbreviation, and an issue number, all separated by a hyphen (for example, EX-123). The Key helps to easily identify issues while tracking a project."
}
dimension: jira_issue_development_stage {
  type: string
  sql: ${TABLE}.jira_issue_development_stage ;;
  description: "Jira issue development stage is an internal workflow that tracks the progress of any development project within an organization. It lays out the process of tasks, deliverables, review periods and milestones required to complete a project. The typical stages in a Jira issue development process include planning, development, testing, release, and closure. Additionally, an organization might add other custom stages to their process to better track progress and keep stakeholders informed."
  drill_fields: [wh_delivery__jira_issues_xa_set*]
}
dimension: jira_issue_duration {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_duration ;;
  description: "Jira Issue Duration is the timeframe between creating a Jira issue and resolving it. The duration varies depending on the type of issue and the complexity of the problem."
}
dimension: jira_issue_age_in_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_age_in_days ;;
  description: "Jira issue age in days is calculated by subtracting the issue creation date from the current date."
}
dimension: jira_issue_summary_story_point_estimate {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_issue_summary_story_point_estimate ;;
  description: "JIRA issue summary story point estimates are used to provide an estimate of how long it will take a team to resolve a specific issue in the system. It is a way for teams to better estimate their work, break it down into smaller tasks, and assign point estimates for each task. Depending on the system's settings, Story Points may be measured using a Fibonacci sequence, such as 1, 2, 3, 5, 8, 13, 21, 34, etc., or in a more linear fashion such as hours or days."
}
}
view: wh_delivery__jira_projects_fact {
sql_table_name: wh_delivery__jira_projects_fact ;;
set: wh_delivery__jira_projects_fact_set {
  fields: [
    jira_project_name,
    jira_project_description,
    jira_project_key,
    jira_project_project_type_key,
    jira_project_epics,
    jira_project_components,
    jira_project_count_closed_issues,
    jira_project_count_open_issues,
    jira_project_count_open_assigned_issues,
    jira_project_avg_close_time_days,
    jira_project_avg_assigned_close_time_days,
    jira_project_avg_age_currently_open_days,
    jira_project_avg_age_currently_open_assigned_days,
    jira_project_median_close_time_days,
    jira_project_median_age_currently_open_days,
    jira_project_median_assigned_close_time_days,
    jira_project_median_age_currently_open_assigned_days,
    jira_project_avg_close_time_seconds,
    jira_project_avg_assigned_close_time_seconds,
    jira_project_avg_age_currently_open_seconds,
    jira_project_avg_age_currently_open_assigned_seconds,
    jira_project_median_close_time_seconds,
    jira_project_median_age_currently_open_seconds,
    jira_project_median_assigned_close_time_seconds,
    jira_project_median_age_currently_open_assigned_seconds,
  ]
}
dimension: jira_project_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_project_pk ;;
  description: "JIRA Project PK is a unique identifier that is assigned to a project in JIRA. It is used to uniquely identify the project in the system. It is a part of the URL when navigating to a project in JIRA."
}
dimension: jira_user_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_user_fk ;;
  description: "A Jira user foreign key is a unique identifier that contains information related to a specific user who is accessing a Jira instance. It is used to link a user's data across different Jira instances or datastores. The value of the foreign key is typically an alphanumeric string and can be used to access user-specific data relative to their permissions."
}
dimension: jira_project_name {
  type: string
  sql: ${TABLE}.jira_project_name ;;
  description: "A Jira project name is the name used to identify a specific project that is being managed through Jira. The project name typically reflects the project's purpose and or what is being worked on."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_description {
  type: string
  sql: ${TABLE}.jira_project_description ;;
  description: "Jira is a project management and collaboration tool that helps teams manage and prioritize their work. It allows teams to create projects, assign tasks, track progress, and collaborate on and prioritize issues. Jira is widely used by organizations in a variety of industries, ranging from software development to IT operations, marketing, and more."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_key {
  type: string
  sql: ${TABLE}.jira_project_key ;;
  description: "A Jira project key is a unique identifier for your Jira project. It is formed from the two or three letters that appear at the beginning of the issue key for all issues created within a single Jira project. For example, if you created an issue in a project called \"Project X\", its issue key might begin with \"PX-12345\". In this case, \"PX\" would be the project key."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_project_type_key {
  type: string
  sql: ${TABLE}.jira_project_project_type_key ;;
  description: "The Jira Project Type Key is a unique identifier associated with a specific project type. It can be used to make queries to extract project-type-specific attributes and to quickly identify project types in a variety of contexts."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_epics {
  type: string
  sql: ${TABLE}.jira_project_epics ;;
  description: "Jira Project Epics are features, stories or tasks that belong to a single project and can span multiple teams, departments, or business units. Epics can also be used to help break down a project into a set of manageable tasks. This allows project managers to better plan and execute a project, by visualizing and tracking the progress of their tasks."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_components {
  type: string
  sql: ${TABLE}.jira_project_components ;;
  description: "Jira Project Components are the various parts that make up a Jira Project. Common components include Issue Types, Issue Statuses, Schemes, Reports, Dashboards, JQL Filters, and an Issue Collector. Components are customizable and can be used to allow teams to track the progress of a project and help manage workflow."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
dimension: jira_project_count_closed_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_closed_issues ;;
  description: "The exact number of closed issues for a given Jira project depends on the specific project and all of the issues that have been previously submitted and closed. However, you can view the number of closed issues in a Jira project at any time by navigating to the project's Summary page. On the left side of the page, you will see an Overview tab with a Closure Count subsection. This should show the current number of closed issues in the project."
}
dimension: jira_project_count_open_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_open_issues ;;
  description: "It is not possible to give an exact number, as this will depend on the individual Jira projects and the types of open issues associated with them. The best way to determine the number of open issues for a Jira project is to access the project from the Jira dashboard and use the issue search function to view all current open issues."
}
dimension: jira_project_count_open_assigned_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_count_open_assigned_issues ;;
  description: "Jira doesn't provide a single metric that displays the count of open assigned issues. Depending on what you are trying to achieve, you can use different Jira queries or tools to display the number of open assigned issues."
}
dimension: jira_project_avg_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_close_time_days ;;
  description: "The average Jira project close time depends on the complexity of the project, the resources available, and other factors. Generally, it can take anywhere from one to several weeks or even longer depending on the type of project."
}
dimension: jira_project_avg_assigned_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_assigned_close_time_days ;;
  description: "Jira does not have an exact answer to this question since the amount of time it takes to close a project can vary drastically based on the complexity of the assigned tasks, the number of people assigned to the project, and the number of contingencies. Generally speaking, complex projects may take weeks or months to complete, while simpler projects may take just a few days."
}
dimension: jira_project_avg_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_days ;;
  description: "Unfortunately, this is not a statistic that can be easily answered as there are many different factors that contribute to the average age of open projects in Jira. Factors such as complexity, priority level, resources, and size of the project can all affect the number of days that a project remains open."
}
dimension: jira_project_avg_age_currently_open_assigned_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_days ;;
  description: "Unfortunately, there is no definitive answer to this question, as it will depend largely on the organization and the specific Jira project in question. However, it is likely to vary greatly between different organizations and Jira projects, so it is best to ask your specific organization or Jira project administrator for more details on their particular project's average age of open assigned tasks."
}
dimension: jira_project_median_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_close_time_days ;;
  description: "The median close time for Jira projects is not a single set number as it fluctuates based on the project and its requirements. However, a general rule of thumb is that most Jira projects should be able to close within 4-8 days."
}
dimension: jira_project_median_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_days ;;
  description: "Jira does not calculate or report the median age for open projects. Instead, Jira allows administrators to manually set a desired project age in the project configuration settings. Alternatively, administrators can use Jira's report builder feature to view and analyze projects and other Jira objects, including the age of open projects."
}
dimension: jira_project_median_assigned_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_assigned_close_time_days ;;
  description: "There is no definitive answer to this question, as the median assigned close time for a Jira project can vary significantly depending on factors such as the size and complexity of the project, the product or services involved, and other variables."
}
dimension: jira_project_median_age_currently_open_assigned_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_days ;;
  description: "There is no one single answer to this question, as the median age of Jira projects can vary depending on the scope of the project, the workflow, and the number of people assigned to the project. However, the average age for Jira projects currently open is about 34 days."
}
dimension: jira_project_avg_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_close_time_seconds ;;
  description: "Jira does not have a specific time metric associated with project close time, as it depends on the complexity of the project and the individual workflow setup."
}
dimension: jira_project_avg_assigned_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_assigned_close_time_seconds ;;
  description: "Jira does not provide an average assigned-close time in seconds. However, it does track the average close time for all issues set to a specific status. Jira users can view this average close time by navigating to the Projects link in the sidebar menu and selecting the Reports tab."
}
dimension: jira_project_avg_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_seconds ;;
  description: "There is no definitive answer to this question as the average age of open JIRA projects will depend on a variety of factors. This includes the complexity of the project, the amount of resources available, and the types of tasks associated with the project."
}
dimension: jira_project_avg_age_currently_open_assigned_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_seconds ;;
  description: "Unfortunately, there is no single answer to this question, as the age of a Jira project depends on many factors. Depending on the size of the project, the complexity of the tasks and workflows, as well as the number of people involved and how quickly tasks are completed, the average open assigned time of a Jira project can vary greatly."
}
dimension: jira_project_median_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_close_time_seconds ;;
  description: "There is no single answer to this question, as it varies depending on numerous factors including the specific project, requirements, and goals. Furthermore, Jira does not calculate a median close time as it is not a metric that it collects. A best practice is to use Jira's filter and reporting functions to analyze the individual issue close times and then create your own median metric."
}
dimension: jira_project_median_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_seconds ;;
  description: "The median age of Jira projects currently open cannot be determined as this information is not tracked or stored by Jira. However, you may be able to approximate it by looking through your open projects and measuring the time that has elapsed since they were opened."
}
dimension: jira_project_median_assigned_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_assigned_close_time_seconds ;;
  description: "Jira project median assigned close time cannot be specified in seconds, as the close time varies depending on the complexity and size of each project."
}
dimension: jira_project_median_age_currently_open_assigned_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_seconds ;;
  description: "Unfortunately, there is no definitive answer to this question as the median age of Jira projects open and assigned can vary greatly depending on the individual project and its associated tasks and durations."
}
}
view: wh_delivery__jira_sprints_dim {
sql_table_name: wh_delivery__jira_sprints_dim ;;
set: wh_delivery__jira_sprints_dim_set {
  fields: [jira_sprint_name, jira_sprint_goal, jira_sprint_state]
}
dimension: jira_sprint_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_sprint_pk ;;
  description: "Jira Sprint PK is a new feature of Jira, which allows users to plan and track their sprints (short-term development cycles) more easily and efficiently. The feature provides users with a central hub for planning, tracking, and reporting on their sprints. It also allows users to monitor the progress of their sprints, view detailed reports, and visualize the data collected."
}
dimension: jira_project_fk {
  hidden: yes 
  type: string
  sql: ${TABLE}.jira_project_fk ;;
  description: "A Jira project foreign key is an unique identifier associated with a particular Jira project, which allows the project to be linked to other records in the Jira system."
}
dimension: jira_sprint_name {
  type: string
  sql: ${TABLE}.jira_sprint_name ;;
  description: "In Jira, sprints are referred to as 'sprints'."
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
}
dimension: jira_sprint_goal {
  type: string
  sql: ${TABLE}.jira_sprint_goal ;;
  description: "Jira Sprint Goals are objectives set by teams at the start of each sprint in order to provide focus and measure progress throughout the sprint. Sprint Goals are typically set collaboratively by the team in order to create alignment and understanding of the work being done over the sprint by all stakeholders. They can also provide a reference point to assess whether the sprint was successful after it is complete."
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
}
dimension: jira_sprint_state {
  type: string
  sql: ${TABLE}.jira_sprint_state ;;
  description: "In Jira, a sprint is a period of time for completing a set of tasks. At the start of the sprint, tasks are chosen from the backlog list and their progress is tracked throughout the sprint. The sprint state indicates where a sprint is in its lifecycle, such as \"Active\", \"Completed\", or \"Cancelled\"."
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
}
dimension_group: jira_start_at_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_start_at_date ;;
  description: "Jira start date refers to the date when a project, task, or issue was first created in Jira. This is usually the date when the item was first entered into the system and can often be different than the date when the item was actually started."
}
dimension_group: jira_complete_at_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_complete_at_date ;;
  description: "Jira Complete at Date is an Automation capability in Jira software that helps teams track and manage the progress of a project by enforcing due dates for items to be completed. It allows users to set global and individual due dates across multiple projects and teams, ensuring that deadlines are kept and projects move forward."
}
dimension_group: jira_end_at_date {
  timeframes: [raw,date,day_of_month,day_of_week,day_of_week_index,day_of_year,week, week_of_year, month, month_name, month_num, quarter, quarter_of_year, year]
  type: time
  datatype: date
  sql: ${TABLE}.jira_end_at_date ;;
  description: "Jira end date is the completion date for a project, issue, or task. It is usually determined when the Jira project is created or when an issue or task is defined. It is important to have an end date that is realistic, achievable and allows for some flexibility."
}
}
view: wh_delivery__jira_users_dim {
sql_table_name: wh_delivery__jira_users_dim ;;
set: wh_delivery__jira_users_dim_set {
  fields: [
    jira_user_name,
    jira_user_email,
    jira_user_locale,
    jira_user_time_zone,
    jira_user_projects,
    jira_user_count_closed_issues,
    jira_user_count_open_issues,
    jira_user_avg_close_time_days,
    jira_user_avg_age_currently_open_days,
    jira_user_median_close_time_days,
    jira_user_median_age_currently_open_days,
    jira_user_avg_close_time_seconds,
    jira_user_avg_age_currently_open_seconds,
    jira_user_median_close_time_seconds,
    jira_user_median_age_currently_open_seconds,
  ]
}
dimension: jira_user_pk {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.jira_user_pk ;;
  description: "Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters."
}
dimension: jira_user_name {
  type: string
  sql: ${TABLE}.jira_user_name ;;
  description: "A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_email {
  type: string
  sql: ${TABLE}.jira_user_email ;;
  description: "A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_locale {
  type: string
  sql: ${TABLE}.jira_user_locale ;;
  description: "Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_time_zone {
  type: string
  sql: ${TABLE}.jira_user_time_zone ;;
  description: "By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_projects {
  type: string
  sql: ${TABLE}.jira_user_projects ;;
  description: "Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
dimension: jira_user_count_closed_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_count_closed_issues ;;
  description: "It is not possible to determine the number of closed issues for a Jira user as this is specific to each individual user. The best way to find this information would be for the relevant user to log into their Jira account and check the Issues section, which will include the information on the number of open and closed issues."
}
dimension: jira_user_count_open_issues {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_count_open_issues ;;
  description: "Jira does not provide a standard count of open issues per user. Instead, you can create custom filters and dashboards to monitor the number of open issues assigned to each user. This can be done from the Jira search bar."
}
dimension: jira_user_avg_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_avg_close_time_days ;;
  description: "Jira does not have an average close time for users. However, the average time it takes for a Jira project or ticket to be resolved is typically between 1-2 weeks."
}
dimension: jira_user_avg_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_avg_age_currently_open_days ;;
  description: "The average age of a Jira user is not publicly available, however the product itself is designed for use by organizations of all sizes, including those with users of all ages."
}
dimension: jira_user_median_close_time_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_median_close_time_days ;;
  description: "The exact answer to this question depends on the specific Jira system you are using and the type of user. However, in general, a median close time for Jira users is considered to be 2-3 days."
}
dimension: jira_user_median_age_currently_open_days {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_median_age_currently_open_days ;;
  description: "There is no one answer to this question as Jira user median age varies greatly depending on industry, country, etc. Additionally, the median age also varies greatly depending on the open days that a user is active on the platform."
}
dimension: jira_user_avg_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_avg_close_time_seconds ;;
  description: "There is no universal answer to this question, as the average close time for JIRA users will vary from user to user and from project to project. It is best to measure the close time for your own JIRA users in order to get an accurate answer."
}
dimension: jira_user_avg_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_avg_age_currently_open_seconds ;;
  description: "There is no definitive answer to this question as the average age of Jira users can vary greatly depending on the organization, company and industry in which they are employed."
}
dimension: jira_user_median_close_time_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_median_close_time_seconds ;;
  description: "Jira does not have any specific user median close time. The time it takes for a user to close a ticket can vary, depending on the complexity of the issue and the resources available to them."
}
dimension: jira_user_median_age_currently_open_seconds {
  hidden: yes 
  type: number
  sql: ${TABLE}.jira_user_median_age_currently_open_seconds ;;
  description: "JIRA does not provide any information about the median age of its users."
}
}
