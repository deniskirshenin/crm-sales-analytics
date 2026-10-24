{{ 
    config (
        materialized='table'
    ) 
}}

select
    row_number() over (order by engage_date) as deal_id,
    opportunity_id,
    sales_agent,
    product,
    account,
    deal_stage,
    engage_date,
    close_date,
    close_value,
    case when deal_stage = 'Won' then 1 else 0 end as is_won,
    case when deal_stage = 'Lost' then 1 else 0 end as is_lost,
    case when deal_stage = 'Prospecting' then 1 else 0 end as is_prospecting,
    case when deal_stage = 'Engaging' then 1 else 0 end as is_engaging,
    case when deal_stage in ('Won', 'Lost') then 1 else 0 end as is_closed
from {{ ref('stg_sales_pipeline') }}