with customers as (
    select *
    from {{ ref('silver_customers')}}
)

select  
    *
    , 'testing_col' as test_col
from customers
limit 10