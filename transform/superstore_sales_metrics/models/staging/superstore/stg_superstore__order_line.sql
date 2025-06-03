with

source_data as (
select *
{% if target.name == 'dev' %}
from {{ source('internal_sources', 'sales_dataset') }}
{% else %}
from {{ source('main', 'sales_dataset') }}
{% endif %}),

renamed as (
    select
        concat(order_id,'/',product_id) as id
        , order_id as order_id
        , order_date::DATE as order_date
        , strptime(ship_date, '%d/%m/%Y')::DATE as ship_date 
        , customer_id 
        , customer_name 
        , segment as customer_category
        , country
        , city
        , state
        , region
        , product_id      
        , category as product_category
        , sub_category as product_sub_category
        , product_name
        , sales as amount_sales

    from source_data
)

select * from renamed