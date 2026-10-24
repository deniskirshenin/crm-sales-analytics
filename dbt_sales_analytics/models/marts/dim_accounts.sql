{{ config (
    materialized='table'
) }}

select
    account,
    sector,
    year_established,
    revenue,
    employees,
    office_location,
    subsidiary_of
from {{ ref('stg_accounts') }}