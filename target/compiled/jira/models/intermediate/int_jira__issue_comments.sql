

with comment as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__comment`

    order by issue_id, created_at asc

),

-- user is a reserved keyword in AWS 
jira_user as (

    select *
    from `ra-development`.`lewis_analytics_dev_jira_source`.`stg_jira__user`
),

agg_comments as (

    select 
    comment.issue_id,
    
    string_agg(comment.created_at || '  -  ' || jira_user.user_display_name || ':  ' || comment.body, '\n')

 as conversation,
    count(comment.comment_id) as count_comments

    from
    comment 
    join jira_user on comment.author_user_id = jira_user.user_id

    group by 1
)

select * from agg_comments