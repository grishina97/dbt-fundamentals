select
    o.order_id,
    o.customer_id,
    coalesce(sum(p.amount), 0) as amount        
from {{ ref('stg_jaffle_shop__orders') }} o
left join {{ ref('stg_stripe__payments') }} p
    on o.order_id = p.order_id
   and p.status = 'success'                     
group by o.order_id, o.customer_id