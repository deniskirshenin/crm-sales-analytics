with source as (
    select *
    from {{ source('default', 'products') }}
)

select
    product,
    series,
    sales_price
from source