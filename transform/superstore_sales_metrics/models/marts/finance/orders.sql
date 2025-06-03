with

orders as (select * from {{ ref('int_order_line_pivot_to_orders') }}),

final as (
    select
        id
        , order_date
        , ship_date
        , customer_id
        , customer_name
        , customer_category
        , country
        , city
        , state
        , region
        , amount_total
    from orders
)

select * from final