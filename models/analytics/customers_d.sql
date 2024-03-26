with customers as (
    select *
    from {{ ref('silver_customers')}}
)

select 
    top 10 
    *
    , 'testing_col' as test_col
from customers