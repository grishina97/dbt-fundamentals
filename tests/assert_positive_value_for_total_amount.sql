select payment_id, sum(amount) as total_amount
from {{ ref('stg_stripe__payments') }}
group by payment_id
having total_amount < 0




