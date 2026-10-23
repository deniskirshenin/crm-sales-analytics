with source as (
    select *
    from {{ source('default', 'sales_pipeline') }}
),

renamed as (
    select
        opportunity_id,
        sales_agent,
        product,
        account,
        deal_stage,
        engage_date,
        close_date,
        close_value
    from source
)

select * from renamed

