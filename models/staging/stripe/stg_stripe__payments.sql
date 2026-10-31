select
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount
from workspace.stripe.payments