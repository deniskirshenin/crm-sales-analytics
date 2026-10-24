{{ config(materialized='table') }}

select distinct
    sales_agent,
    manager,
    regional_office
from {{ ref('stg_sales_teams') }}