with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ source('sales_db','customers_raw') }}

)

, final as (
    select 
        CustomerName as customer_name
        , Phone as phone_number
        , cast(BirthYear as int) as birth_year
        , case
            hasClubMembership
            when "Yes" then 1
            when "No" then 0
            else null
        end as has_club_membership
        , StoresVisited as stores_visited
    from source
)

select *
from final