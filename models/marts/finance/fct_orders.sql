with
orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),
payments as (
    select * from {{ ref('stg_stripe__payments') }}
),
final as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,                                   
        coalesce(sum(payments.amount), 0) as amount
    from orders
    left join payments
        on orders.order_id = payments.order_id
       and payments.status = 'success'
    group by orders.order_id, orders.customer_id, orders.order_date
)
select * from final