with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ source('sales_db','sales_raw') }}

)

, final as (
    select 
        CustomerName as customer_name
        , ItemName as item_name
        , ItemCategory as item_category
        , ItemPrice as item_price
        , Quantity as quantity
        , TotalAmount as total
        , DateOfPurchase as purchase_date
    from source
)

select *
from final