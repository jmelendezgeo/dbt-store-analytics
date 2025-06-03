with 

order_line as (select * from {{ ref('stg_superstore__order_line') }}),

final as (
    select
        id
        , order_id
        , order_date
        , ship_date 
        , customer_id 
        , customer_name 
        , customer_category
        , country
        , city
        , state
        , region
        , product_id      
        , product_category
        , product_sub_category
        , product_name
        , amount_sales
    from order_line
)

select * from final