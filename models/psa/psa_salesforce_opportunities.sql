
with source as (

    select * from {{ source('salesforce', 'opportunities') }}

),

renamed as (

    select
    
        BATCHID,
        OPPURTUNITYID as OPPORTUNITYID,
        COMPANEXTID as ACCOUNTID,
        to_decimal(replace(replace(AMOUNT,'$',''),',',''),9,2) as AMOUNT,
        PROJECT_NAME,
        OPPURTUNITY_NAME as OPPORTUNITY_NAME,
        STAGE,
        CLOSE_DATE,
        DATECREATED,
        MODIFIEDDATE

    from source

)

select * from renamed