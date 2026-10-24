with source as (
    select *
    from {{ source('default', 'accounts') }}
)

select
    account,
    sector,
    year_established,
    revenue,
    employees,
    office_location,
    subsidiary_of
from source