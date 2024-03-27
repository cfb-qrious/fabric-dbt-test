with customers as (
    select *
    from {{ ref('silver_customers')}}
)

select
    {{ dbt_utils.generate_surrogate_key(['customer_name']) }} as customer_id
    , customer_name
    , phone_number
    , birth_year
    , has_club_membership
    , count(stores_visited) as stores_visited_cnt
from customers
group by 1,2,3,4,5