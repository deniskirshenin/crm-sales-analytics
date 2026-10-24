{{ config(materialized='table') }}

select distinct
    product,
    series,
    sales_price
from {{ ref('stg_products') }}