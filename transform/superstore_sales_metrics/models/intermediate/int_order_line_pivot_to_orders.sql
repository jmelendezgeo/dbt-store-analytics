with

order_line as (select * from {{ ref('stg_superstore__order_line') }}),

order_line_pivot as (
    select
        order_id as id
        , order_date
        , ship_date
        , customer_id
        , customer_name
        , customer_category
        , country
        , city
        , state
        , region
        , sum(amount_sales) as amount_total
    from order_line
    group by
        ALL
)

select * from order_line_pivot