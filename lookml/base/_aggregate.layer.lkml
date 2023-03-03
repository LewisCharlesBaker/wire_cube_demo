include: "/lookml/base/_base.layer.lkml"
view: +wh_core__clients_bridge {
measure: count_of_client_pk {
  type: count_distinct
  sql: ${TABLE}.client_pk ;;
  description: ""
  drill_fields: [wh_core__clients_bridge_set*]
}
}
view: +wh_core__people_bridge {
measure: count_of_person_pk {
  type: count_distinct
  sql: ${TABLE}.person_pk ;;
  description: ""
  drill_fields: [wh_core__people_bridge_set*]
}
}
view: +wh_core__sprints_bridge {
measure: count_of_sprint_pk {
  type: count_distinct
  sql: ${TABLE}.sprint_pk ;;
  description: ""
  drill_fields: [wh_core__sprints_bridge_set*]
}
}
view: +wh_delivery__harvest_clients_dim {
measure: count_of_harvest_client_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_client_pk ;;
  description: "Harvest Client PK is an ID belonging to each client in Harvest. It is a unique ID used to identify each individual client, and can be found in the URL when viewing the client profile."
  drill_fields: [wh_delivery__harvest_clients_dim_set*]
}
}
view: +wh_delivery__harvest_employees_dim {
measure: count_of_harvest_employee_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_employee_pk ;;
  description: "A harvest employee primary key is a unique identifier assigned to each individual employee in a harvest system. It is typically a combination of the employee's name and a number, such as 'John_Smith_001', and is used to identify and reference the employee in the system."
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
measure: sum_of_harvest_employee_weekly_capacity {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_weekly_capacity ;;
  description: "The exact weekly capacity for a harvest employee will vary depending on the employee's role, workload, and level of expertise. There is no set amount of hours that a harvest employee should work in a given week."
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
measure: sum_of_harvest_employee_cost_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_cost_rate ;;
  description: "The exact cost of an employee at harvest can vary depending on the company, their needs, and the individual employee's qualifications. In general, the average cost of a Harvest employee is around $18 per hour."
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
measure: sum_of_harvest_employee_default_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_default_hourly_rate ;;
  description: "Harvest does not have a standard default hourly rate for employees. It is up to the employer to set their own rate."
  drill_fields: [wh_delivery__harvest_employees_dim_set*]
}
}
view: +wh_delivery__harvest_expenses_fact {
measure: count_of_harvest_expense_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_expense_pk ;;
  description: "Harvest expense pk is an accounting software designed to help businesses automate their expense tracking, create detailed budgeting reports, and provide detailed financial reporting. It integrates with popular accounting software, such as QuickBooks and Xero, to offer a comprehensive solution for businesses of all sizes."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_category_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_category_natural_key ;;
  description: "The natural key for the harvest expense category is typically the unique identifier or code associated with the category, such as a number, a short description, or a combination of both."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_employee_assignment_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_assignment_natural_key ;;
  description: "A harvest employee assignment natural key is a unique identifier for employee assignments, such as a combination of harvest identifier and employee identifier. This natural key is typically used to join multiple tables and queries in a database to ensure accurate and reliable data for reporting and analysis."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_total_cost {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_total_cost ;;
  description: "There is no one-size-fits-all answer to this question, as the total cost of harvest expenses will vary depending on many factors, such as the size of the harvest, the type of crop being harvested, and any equipment or supplies that may need to be purchased or rented. In general, harvest expenses can range from a few hundred dollars to thousands of dollars."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_receipt_file_size {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_receipt_file_size ;;
  description: "The size of a harvest expense receipt file will depend on the content of the receipt. It can range from a few kilobytes to several megabytes."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
measure: sum_of_harvest_expense_units {
  type: sum_distinct
  sql: ${TABLE}.harvest_expense_units ;;
  description: "Harvest expense units are an accounting measure of value related to collecting, growing and selling agricultural crops. They are used to calculate the cost of resources and are typically tracked per crop or season."
  drill_fields: [wh_delivery__harvest_expenses_fact_set*]
}
}
view: +wh_delivery__harvest_invoice_line_items_fact {
measure: count_of_harvest_invoice_line_item_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_invoice_line_item_pk ;;
  description: "A Harvest Invoice Line Item PK is a primary key that uniquely identifies each item listed on a Harvest invoice. This primary key is used to access information about each line item on the invoice, including the amount, quantity, and any discounts or other modifiers that may have been applied to the line item."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_amount ;;
  description: "A harvest invoice line item amount is the total monetary amount of an individual line item on an invoice. This amount can include subtotals, sales tax, and shipping charges."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_unit_price {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_unit_price ;;
  description: "A harvest invoice line item unit price is the price of an individual item on a harvest invoice. It is calculated by dividing the total price of the invoice line item by the quantity purchased."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_quantity {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_quantity ;;
  description: "A harvest invoice line item quantity is the number of items included in a single line item on an invoice from a business. It might refer to the exact number of units of product that a customer purchased, or to the number of hours of service provided by a business."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_services_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_services_amount_billed ;;
  description: "The amount billed for harvest invoice line item services depends on the particular services included in the invoice. Generally, harvest invoices will include a full breakdown of the services provided along with the amount billed for each service."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_license_referral_fee_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_license_referral_fee_amount_billed ;;
  description: "A harvest invoice line item license referral fee amount billed is the total fee charged for a referral made when the customer purchases a license for a product or service. The amount charged for the referral fee is based on the terms of the agreement between the referring individual or entity and the organization providing the license."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_expenses_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_expenses_amount_billed ;;
  description: "A harvest invoice line item expense amount billed is the total amount that is charged to the customer for the item listed on the invoice. This amount includes any applicable taxes and other fees."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
measure: sum_of_harvest_invoice_line_item_support_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_line_item_support_amount_billed ;;
  description: "Harvest Invoice Line Item Support Amount Billed is a term used to describe the total amount of money billed to the customer on the line item of an invoice. It is the sum of the item or service being billed, along with any additional fees such as taxes, shipping, discounts, etc."
  drill_fields: [wh_delivery__harvest_invoice_line_items_fact_set*]
}
}
view: +wh_delivery__harvest_invoices_fact {
measure: count_of_harvest_invoice_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_invoice_pk ;;
  description: "Harvest Invoice PK (Public Key) is a unique identifier that accompanies each invoice generated within the Harvest platform. This public key allows users to keep track of invoices and securely access the details of them whenever they need to."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_amount ;;
  description: "Harvest Invoice Amount is the total value of the invoice after any deductions, discounts, taxes, and other fees have been applied."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_due_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_due_amount ;;
  description: "The amount due for a harvest invoice depends on the terms of the invoice, such as payment terms and any discounts given. It could range from the full invoice amount to a percentage of the invoice amount. Additionally, taxes, late fees and other charges may be added in, which could influence the final amount due."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_discount_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_discount_amount ;;
  description: "Harvest Invoice Discount Amount is the amount of a discount taken off billed amounts that the customer can take advantage of after invoicing. The discount may be calculated according to a percentage, dollar amount, or a combination of both."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_discount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_discount ;;
  description: "Harvest Invoice Discounting is a form of financial services that enables businesses to obtain quick advances on outstanding invoices. By using Harvest Invoice Discounting, businesses are able to gain access to cash much faster than traditional invoicing systems. As a result, businesses are able to grow and expand without the need to wait for full payment from client invoices. The process works by “discounting” the invoice amount at a predetermined rate and providing businesses with a lump sum."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_tax_amount {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_tax_amount ;;
  description: "Harvest invoice tax amount is the amount of tax owed on an invoice that is being paid through Harvest. This tax amount may vary depending on the country and the tax rate imposed by the local governing authority."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
measure: sum_of_harvest_invoice_tax {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_tax ;;
  description: "Harvest Invoice Tax is a tax which is applied to invoices generated in the Harvest accounting software. It is used to more accurately report income and expenses for businesses, and is based on the business' country of origin and the state or province in which the business is located."
  drill_fields: [wh_delivery__harvest_invoices_fact_set*]
}
}
view: +wh_delivery__harvest_invoices_xa {
measure: count_of_harvest_invoice_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_invoice_pk ;;
  description: "Harvest Invoice PK (Public Key) is a unique identifier that accompanies each invoice generated within the Harvest platform. This public key allows users to keep track of invoices and securely access the details of them whenever they need to."
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
measure: sum_of_harvest_invoice_revenue_amount_billed {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_revenue_amount_billed ;;
  description: "Harvest invoice revenue amount billed is the total amount the customer was invoiced for the harvest. This includes any discounts or promotional amounts due, and may also include any applicable taxes."
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
measure: sum_of_harvest_client_invoice_sequence_nunber {
  type: sum_distinct
  sql: ${TABLE}.harvest_client_invoice_sequence_nunber ;;
  description: "Harvest Client Invoice Sequence Number is a unique numerical identifier assigned to each invoice created in the Harvest invoicing system. The identifier is unique and helps identify each invoice, ensuring accuracy when managing multiple invoices."
  drill_fields: [wh_delivery__harvest_invoices_xa_set*]
}
}
view: +wh_delivery__harvest_projects_fact {
measure: count_of_harvest_project_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_project_pk ;;
  description: "Harvest Project PK is an NGO based in Pakistan that works to build a better future for vulnerable communities. The organization focuses on empowerment, especially for women, through education, health, and sustainable development. Their initiatives have had an impact on nearly 1 million people in 300+ villages. Their main mission is to unlock Pakistan’s potential to end poverty by 2030 and to ensure that all people, regardless of gender, socio-economic status, access to resources, and skill level, can thrive, participate, and contribute to the development of their communities."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_hourly_rate ;;
  description: "The hourly rate for the Harvest project varies depending on the type of work being done and a number of factors, including the location of the project and the skills of the worker. If you are interested in working on a Harvest project, you should contact the project manager to find out their exact rate."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_cost_budget {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_cost_budget ;;
  description: "The cost of a harvest project will depend on the complexity of the project and other factors, such as the number of people involved, the materials and equipment needed, and the duration of the project. Thus, there is no standard budget for a harvest project. Instead, each project should be evaluated individually in order to determine what a reasonable budget should be."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_fee {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_fee ;;
  description: "Harvest project fees are the fees that a farmer pays for the services of a harvester hired to collect their crop at harvest time. The fee can include the cost of labor, supplies, and equipment used to harvest the crop. There may also be additional fees for personnel, vehicles, and storage containers required for certain crops."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_budget {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_budget ;;
  description: "The budget of a harvest project will depend on the scope of the project, the services and equipment needed, the length of the project and any other applicable factors. It is best to work with a qualified project manager to determine the exact cost for a specific project."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
measure: sum_of_harvest_project_over_budget_notification_percentage {
  type: sum_distinct
  sql: ${TABLE}.harvest_project_over_budget_notification_percentage ;;
  description: "There is no standard percentage for Harvest Project over budget notifications. Each project manager must determine the percentage that they believe is appropriate for their specific project."
  drill_fields: [wh_delivery__harvest_projects_fact_set*]
}
}
view: +wh_delivery__harvest_tasks_dim {
measure: count_of_harvest_task_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_task_pk ;;
  description: "A primary key is a unique identifier that is used to uniquely identify a single row or record in a database table. A harvest task primary key is a field, or multiple fields, that uniquely identifies a particular record in the harvest task table. It is typically used as a reference to identify a specific record and allows for data retrievals and updates to be made in an organized and efficient manner."
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
measure: sum_of_harvest_task_default_hourly_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_task_default_hourly_rate ;;
  description: "The default hourly rate for a Harvest task depends on the payment plan that is chosen. However, most Harvest plans have an hourly rate starting at $8.00 per hour."
  drill_fields: [wh_delivery__harvest_tasks_dim_set*]
}
}
view: +wh_delivery__harvest_time_sheets_fact {
measure: count_of_harvest_timesheet_pk {
  type: count_distinct
  sql: ${TABLE}.harvest_timesheet_pk ;;
  description: "Harvest Timesheet PK is a web application designed to help small businesses and freelancers track their time and expenses. It allows users to easily log their time with a simple and intuitive web interface, and also compare their timesheets to track performance and profitability. Harvest Timesheet PK is designed to be easy to use and efficient with features such as timers, reports, financial forecasts, and more."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_timesheet_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_timesheet_natural_key ;;
  description: "A harvest timesheet natural key is a unique identifier for a timesheet, usually a combination of the employee's name and the date of the timesheet."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_employee_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_natural_key ;;
  description: "A harvest employee natural key is an identifying number that is assigned to each employee in the company and remains the same throughout their time there, even if their job title or department changes. The natural key may be a combination of the employee's first and last name, a social security number, or a unique ID number provided by the company."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_task_assignment_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_task_assignment_natural_key ;;
  description: "A harvest task assignment natural key is a unique identifier used to identify a particular task assignment in a harvest system. It is typically a combination of the task and worker IDs that uniquely identify the assignment, and allow users to track and monitor the progress of the assignment."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_employee_assignment_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_employee_assignment_natural_key ;;
  description: "A harvest employee assignment natural key is a unique identifier for employee assignments, such as a combination of harvest identifier and employee identifier. This natural key is typically used to join multiple tables and queries in a database to ensure accurate and reliable data for reporting and analysis."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_invoice_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_invoice_natural_key ;;
  description: "A harvest invoice natural key is a unique identifier associated with a particular harvest invoice. It typically consists of a combination of the supplier’s name, the invoice number, and the invoice date. This unique combination of information can be used to quickly and easily match a particular harvest invoice to its corresponding records in other systems."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_client_natural_key {
  type: sum_distinct
  sql: ${TABLE}.harvest_client_natural_key ;;
  description: "The harvest client natural key is the unique identifier used by Harvest to identify each client. It typically starts with a \"c\" followed by some numbers, such as c452985."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_timesheet_billable_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_timesheet_billable_rate ;;
  description: "The \"billable rate\" is the amount of money per hour that an employee will be expected to charge clients for the services provided. This rate is often negotiated between the employee, employer and client and may vary depending on the particular job and individual."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_timesheet_cost_rate {
  type: sum_distinct
  sql: ${TABLE}.harvest_timesheet_cost_rate ;;
  description: "The cost rate associated with Harvest Timesheet is dependent on the plan you choose. The free plan allows you to track up to two projects and two users, while the paid plans start at $12/month for up to five users and 10 projects."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_timesheet_hours {
  type: sum_distinct
  sql: ${TABLE}.harvest_timesheet_hours ;;
  description: "Harvest Timesheet hours refer to the number of hours a worker has spent working on a particular project or assignment as logged in the Harvest Timesheets application. Harvest Timesheets allows workers to track and manage the time they spend working on various assignments and tasks. This can help employers stay on top of how many hours their employees are working and ensure that they are being appropriately compensated for the time they put in."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
measure: sum_of_harvest_timesheet_hours_budgeted {
  type: sum_distinct
  sql: ${TABLE}.harvest_timesheet_hours_budgeted ;;
  description: "Harvest timesheet hours budgeted is the number of hours that have been budgeted for a specific project. This budget will be used to ensure that the project is completed in a timely manner and within a specific scope."
  drill_fields: [wh_delivery__harvest_time_sheets_fact_set*]
}
}
view: +wh_delivery__jira_daily_issue_field_history_fact {
measure: count_of_jira_daily_issue_field_history_pk {
  type: count_distinct
  sql: ${TABLE}.jira_daily_issue_field_history_pk ;;
  description: "Jira Daily Issue Field History PK is a special field in Jira that keeps track of the changes that were made to an issue over time. It stores a new record whenever an issue is updated, and the data fields include: issue number, data and time of the change, name of user who made the change, and issue field that was changed. The records are stored in a unique format, or \"PK,\" which is a protected key that keeps the records safe from unnecessary changes."
  drill_fields: [wh_delivery__jira_daily_issue_field_history_fact_set*]
}
}
view: +wh_delivery__jira_epics_dim {
measure: count_of_jira_epic_pk {
  type: count_distinct
  sql: ${TABLE}.jira_epic_pk ;;
  description: "An Epic is a large user story or collection of smaller user stories that is larger than a typical user story but smaller than a project. It is a way to group user stories into a single unit. The epic has a primary key that is assigned to it, which is used to identify and track the epic throughout its lifecycle."
  drill_fields: [wh_delivery__jira_epics_dim_set*]
}
}
view: +wh_delivery__jira_fields_dim {
measure: count_of_jira_field_pk {
  type: count_distinct
  sql: ${TABLE}.jira_field_pk ;;
  description: "Jira Field PK (primary key) is an automatically generated, unique identifier used when creating a Jira issue. It is used to uniquely identify each Jira issue and is typically made up of a combination of numbers and letters."
  drill_fields: [wh_delivery__jira_fields_dim_set*]
}
}
view: +wh_delivery__jira_issues_board_bridge {
measure: count_of_jira_issue_board_bridge_pk {
  type: count_distinct
  sql: ${TABLE}.jira_issue_board_bridge_pk ;;
  description: "Jira Issue Board Bridge PK is a generic tool that provides integration between Jira Issue Board and any third-party system, allowing teams to share data and create a seamless collaboration workflow. It allows users to update Jira tickets from issue boards, and update issue boards from Jira tickets. It also enables sharing of custom fields between the two systems. Jira Issue Board Bridge can be used for synchronizing changes between Jira plans and external systems, such as project management tools, customer service applications, and many others."
  drill_fields: [wh_delivery__jira_issues_board_bridge_set*]
}
}
view: +wh_delivery__jira_issues_fact {
measure: count_of_jira_issue_pk {
  type: count_distinct
  sql: ${TABLE}.jira_issue_pk ;;
  description: "In Jira, the primary key of an issue is the Issue Number, which is a unique, numbered identifier for each issue in the system. It is used to differentiate between different issues and can be used to reference an issue when discussing it or searching for it in the system."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_natural_key {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_natural_key ;;
  description: "A JIRA issue natural key is a unique identifier assigned to each issue created in JIRA. It is a concatenation of the project key and the issue number. It takes the format <PROJECT_KEY>-<ISSUE_NUMBER>. For example, ‘ABC-123’ might be the JIRA issue natural key for an issue in a project with the key ‘ABC’."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_work_ratio {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_work_ratio ;;
  description: "Jira issue work ratio refers to the ratio of time taken to accomplish tasks relative to the amount of time estimated for those tasks. It is calculated as work done divided by estimated work, or (Time taken for issue/Time Estimated for issue)."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_count_sprint_changes {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_count_sprint_changes ;;
  description: "Jira does not keep track of issue counts across sprints changes. It is up to the user to manually track this information."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_time_spent_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_time_spent_seconds ;;
  description: "Jira Issue Time Spent Seconds is the total time spent in seconds on an issue in Jira. This field is used to track how much time is spent on specific tasks and records how long it takes to complete those tasks."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_count_comments {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_count_comments ;;
  description: "Jira issue count comments are comments that are part of a Jira issue. They are used to communicate, track progress, and provide further context to an issue. Comments are attached to individual Jira issues, and the comment count is used to provide an indication of how active an issue is."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_open_duration_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_open_duration_seconds ;;
  description: "There is no specific duration associated with an open Jira issue. The duration will depend on the amount of time it takes to resolve the issue and the priority level assigned to it."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_any_assignment_duration_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_any_assignment_duration_seconds ;;
  description: "Jira issue is a time-tracking tool used to log and report on how much time is spent on an assignment or project. This tool is used to record the time spent on individual tasks and is used to monitor project progress as well as generate invoices and/or reports. The duration of a task or assignment can be tracked in minutes, hours or days, depending on the level of granularity needed."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_last_assignment_duration_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_last_assignment_duration_seconds ;;
  description: "Jira does not have a concept of assignment duration seconds. Jira tasks are categorized and tracked according to their status (In Progress, Resolved, etc.), not the length of time they have been assigned."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_story_point_estimate {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_story_point_estimate ;;
  description: "Jira Issue Story Point Estimate is an estimation method for a project within Jira Software. It is a system for assigning values to tasks, based on the complexity, risk and size of the task. It is designed to provide an objective measure of a task's relative size and complexity, enabling teams to more accurately estimate and predict the time a task will take to complete."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_original_estimate {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_original_estimate ;;
  description: "Jira Issue Original Estimate is the amount of time that is initially estimated to complete a Jira issue. It is set by the assignee after carefully assessing the task. This estimate can be adjusted later if needed."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
measure: sum_of_jira_issue_remaining_estimate {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_remaining_estimate ;;
  description: "Jira Issue Remaining Estimate is a setting that allows users to specify how much time is left before an issue is considered completed. It is typically tracked in hours or days, and can be adjusted by individual users as the issue progresses."
  drill_fields: [wh_delivery__jira_issues_fact_set*]
}
}
view: +wh_delivery__jira_issues_field_history_fact {
measure: count_of_jira_issues_field_history_pk {
  type: count_distinct
  sql: ${TABLE}.jira_issues_field_history_pk ;;
  description: "The issues field history primary key is a unique identifier that is assigned to each record in the field history table. It is used to uniquely identify each record and also serves as a reference point when linking related records."
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
measure: sum_of_jira_issue_field_history_story_point_estimate {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_field_history_story_point_estimate ;;
  description: "Jira issue field history story point estimate is a field that stores the estimated story points of a given issue at different points throughout its lifetime. It allows teams to view and understand why and how the estimates of an issue have changed over time."
  drill_fields: [wh_delivery__jira_issues_field_history_fact_set*]
}
}
view: +wh_delivery__jira_issues_sprint_bridge {
measure: count_of_jira_issue_sprint_bridge_pk {
  type: count_distinct
  sql: ${TABLE}.jira_issue_sprint_bridge_pk ;;
  description: "Jira Issue Sprint Bridge PK is an add-on for Jira Cloud and Jira Server. It provides project managers with a way to connect Jira issues to sprints, allowing teams to better coordinate their sprints and manage their back logs more efficiently. The add-on helps to bridge the gap between sprint planning and task execution, providing PMs and developers with an insight into which issues are associated with which sprint and what the progress of each issue is."
  drill_fields: [wh_delivery__jira_issues_sprint_bridge_set*]
}
}
view: +wh_delivery__jira_issues_xa {
measure: count_of_jira_issue_summary_pk {
  type: count_distinct
  sql: ${TABLE}.jira_issue_summary_pk ;;
  description: "Jira Issue Summary Primary Key is a unique identifier that identifies each issue within a project in Jira. It is composed of a project abbreviation, issue type abbreviation, and an issue number, all separated by a hyphen (for example, EX-123). The Key helps to easily identify issues while tracking a project."
  drill_fields: [wh_delivery__jira_issues_xa_set*]
}
measure: sum_of_jira_issue_duration {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_duration ;;
  description: "Jira Issue Duration is the timeframe between creating a Jira issue and resolving it. The duration varies depending on the type of issue and the complexity of the problem."
  drill_fields: [wh_delivery__jira_issues_xa_set*]
}
measure: sum_of_jira_issue_age_in_days {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_age_in_days ;;
  description: "Jira issue age in days is calculated by subtracting the issue creation date from the current date."
  drill_fields: [wh_delivery__jira_issues_xa_set*]
}
measure: sum_of_jira_issue_summary_story_point_estimate {
  type: sum_distinct
  sql: ${TABLE}.jira_issue_summary_story_point_estimate ;;
  description: "JIRA issue summary story point estimates are used to provide an estimate of how long it will take a team to resolve a specific issue in the system. It is a way for teams to better estimate their work, break it down into smaller tasks, and assign point estimates for each task. Depending on the system's settings, Story Points may be measured using a Fibonacci sequence, such as 1, 2, 3, 5, 8, 13, 21, 34, etc., or in a more linear fashion such as hours or days."
  drill_fields: [wh_delivery__jira_issues_xa_set*]
}
}
view: +wh_delivery__jira_projects_fact {
measure: count_of_jira_project_pk {
  type: count_distinct
  sql: ${TABLE}.jira_project_pk ;;
  description: "JIRA Project PK is a unique identifier that is assigned to a project in JIRA. It is used to uniquely identify the project in the system. It is a part of the URL when navigating to a project in JIRA."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_count_closed_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_closed_issues ;;
  description: "The exact number of closed issues for a given Jira project depends on the specific project and all of the issues that have been previously submitted and closed. However, you can view the number of closed issues in a Jira project at any time by navigating to the project's Summary page. On the left side of the page, you will see an Overview tab with a Closure Count subsection. This should show the current number of closed issues in the project."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_count_open_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_open_issues ;;
  description: "It is not possible to give an exact number, as this will depend on the individual Jira projects and the types of open issues associated with them. The best way to determine the number of open issues for a Jira project is to access the project from the Jira dashboard and use the issue search function to view all current open issues."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_count_open_assigned_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_project_count_open_assigned_issues ;;
  description: "Jira doesn't provide a single metric that displays the count of open assigned issues. Depending on what you are trying to achieve, you can use different Jira queries or tools to display the number of open assigned issues."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_close_time_days ;;
  description: "The average Jira project close time depends on the complexity of the project, the resources available, and other factors. Generally, it can take anywhere from one to several weeks or even longer depending on the type of project."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_assigned_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_assigned_close_time_days ;;
  description: "Jira does not have an exact answer to this question since the amount of time it takes to close a project can vary drastically based on the complexity of the assigned tasks, the number of people assigned to the project, and the number of contingencies. Generally speaking, complex projects may take weeks or months to complete, while simpler projects may take just a few days."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_days ;;
  description: "Unfortunately, this is not a statistic that can be easily answered as there are many different factors that contribute to the average age of open projects in Jira. Factors such as complexity, priority level, resources, and size of the project can all affect the number of days that a project remains open."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_assigned_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_days ;;
  description: "Unfortunately, there is no definitive answer to this question, as it will depend largely on the organization and the specific Jira project in question. However, it is likely to vary greatly between different organizations and Jira projects, so it is best to ask your specific organization or Jira project administrator for more details on their particular project's average age of open assigned tasks."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_close_time_days ;;
  description: "The median close time for Jira projects is not a single set number as it fluctuates based on the project and its requirements. However, a general rule of thumb is that most Jira projects should be able to close within 4-8 days."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_days ;;
  description: "Jira does not calculate or report the median age for open projects. Instead, Jira allows administrators to manually set a desired project age in the project configuration settings. Alternatively, administrators can use Jira's report builder feature to view and analyze projects and other Jira objects, including the age of open projects."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_assigned_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_assigned_close_time_days ;;
  description: "There is no definitive answer to this question, as the median assigned close time for a Jira project can vary significantly depending on factors such as the size and complexity of the project, the product or services involved, and other variables."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_assigned_days {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_days ;;
  description: "There is no one single answer to this question, as the median age of Jira projects can vary depending on the scope of the project, the workflow, and the number of people assigned to the project. However, the average age for Jira projects currently open is about 34 days."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_close_time_seconds ;;
  description: "Jira does not have a specific time metric associated with project close time, as it depends on the complexity of the project and the individual workflow setup."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_assigned_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_assigned_close_time_seconds ;;
  description: "Jira does not provide an average assigned-close time in seconds. However, it does track the average close time for all issues set to a specific status. Jira users can view this average close time by navigating to the Projects link in the sidebar menu and selecting the Reports tab."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_seconds ;;
  description: "There is no definitive answer to this question as the average age of open JIRA projects will depend on a variety of factors. This includes the complexity of the project, the amount of resources available, and the types of tasks associated with the project."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_avg_age_currently_open_assigned_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_avg_age_currently_open_assigned_seconds ;;
  description: "Unfortunately, there is no single answer to this question, as the age of a Jira project depends on many factors. Depending on the size of the project, the complexity of the tasks and workflows, as well as the number of people involved and how quickly tasks are completed, the average open assigned time of a Jira project can vary greatly."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_close_time_seconds ;;
  description: "There is no single answer to this question, as it varies depending on numerous factors including the specific project, requirements, and goals. Furthermore, Jira does not calculate a median close time as it is not a metric that it collects. A best practice is to use Jira's filter and reporting functions to analyze the individual issue close times and then create your own median metric."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_seconds ;;
  description: "The median age of Jira projects currently open cannot be determined as this information is not tracked or stored by Jira. However, you may be able to approximate it by looking through your open projects and measuring the time that has elapsed since they were opened."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_assigned_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_assigned_close_time_seconds ;;
  description: "Jira project median assigned close time cannot be specified in seconds, as the close time varies depending on the complexity and size of each project."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
measure: sum_of_jira_project_median_age_currently_open_assigned_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_project_median_age_currently_open_assigned_seconds ;;
  description: "Unfortunately, there is no definitive answer to this question as the median age of Jira projects open and assigned can vary greatly depending on the individual project and its associated tasks and durations."
  drill_fields: [wh_delivery__jira_projects_fact_set*]
}
}
view: +wh_delivery__jira_sprints_dim {
measure: count_of_jira_sprint_pk {
  type: count_distinct
  sql: ${TABLE}.jira_sprint_pk ;;
  description: "Jira Sprint PK is a new feature of Jira, which allows users to plan and track their sprints (short-term development cycles) more easily and efficiently. The feature provides users with a central hub for planning, tracking, and reporting on their sprints. It also allows users to monitor the progress of their sprints, view detailed reports, and visualize the data collected."
  drill_fields: [wh_delivery__jira_sprints_dim_set*]
}
}
view: +wh_delivery__jira_users_dim {
measure: count_of_jira_user_pk {
  type: count_distinct
  sql: ${TABLE}.jira_user_pk ;;
  description: "Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_count_closed_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_user_count_closed_issues ;;
  description: "It is not possible to determine the number of closed issues for a Jira user as this is specific to each individual user. The best way to find this information would be for the relevant user to log into their Jira account and check the Issues section, which will include the information on the number of open and closed issues."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_count_open_issues {
  type: sum_distinct
  sql: ${TABLE}.jira_user_count_open_issues ;;
  description: "Jira does not provide a standard count of open issues per user. Instead, you can create custom filters and dashboards to monitor the number of open issues assigned to each user. This can be done from the Jira search bar."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_avg_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_user_avg_close_time_days ;;
  description: "Jira does not have an average close time for users. However, the average time it takes for a Jira project or ticket to be resolved is typically between 1-2 weeks."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_avg_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_user_avg_age_currently_open_days ;;
  description: "The average age of a Jira user is not publicly available, however the product itself is designed for use by organizations of all sizes, including those with users of all ages."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_median_close_time_days {
  type: sum_distinct
  sql: ${TABLE}.jira_user_median_close_time_days ;;
  description: "The exact answer to this question depends on the specific Jira system you are using and the type of user. However, in general, a median close time for Jira users is considered to be 2-3 days."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_median_age_currently_open_days {
  type: sum_distinct
  sql: ${TABLE}.jira_user_median_age_currently_open_days ;;
  description: "There is no one answer to this question as Jira user median age varies greatly depending on industry, country, etc. Additionally, the median age also varies greatly depending on the open days that a user is active on the platform."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_avg_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_user_avg_close_time_seconds ;;
  description: "There is no universal answer to this question, as the average close time for JIRA users will vary from user to user and from project to project. It is best to measure the close time for your own JIRA users in order to get an accurate answer."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_avg_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_user_avg_age_currently_open_seconds ;;
  description: "There is no definitive answer to this question as the average age of Jira users can vary greatly depending on the organization, company and industry in which they are employed."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_median_close_time_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_user_median_close_time_seconds ;;
  description: "Jira does not have any specific user median close time. The time it takes for a user to close a ticket can vary, depending on the complexity of the issue and the resources available to them."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
measure: sum_of_jira_user_median_age_currently_open_seconds {
  type: sum_distinct
  sql: ${TABLE}.jira_user_median_age_currently_open_seconds ;;
  description: "JIRA does not provide any information about the median age of its users."
  drill_fields: [wh_delivery__jira_users_dim_set*]
}
}
