WITH

orders as (
    select 
    *
    , lag(order_date) over (partition by customer_id order by order_date) as previous_order_date
    from {{ ref('int_order_line_pivot_to_orders') }}
),

customer_orders as (
    select
        customer_id
        , customer_name
        , customer_category
        , min(order_date) as first_order_date
        , max(order_date) as last_order_date
        , count(distinct id) as total_orders
        , round(sum(amount_total),2) as lifetime_value
        , avg(ship_date - order_date) as avg_ship_time
        , avg(order_date - previous_order_date) as avg_days_between_orders
    from orders
    group by 1,2,3
)

select * from customer_orders