with source as (
    select *
    from {{ source('default', 'sales_teams') }}
)

select
    sales_agent,
    manager,
    regional_office
from source