
{%- set yaml_metadata -%}
source_model: "psa_salesforce_opportunities"
derived_columns:
  RECORD_SOURCE: "!SALESFORCE__OPPORTUNITIES"
  LOAD_DATETIME: "DATECREATED"
  EFFECTIVE_FROM: "MODIFIEDDATE"
hashed_columns:
  OPPORTUNITY_PK: "OPPORTUNITYID"
  ACCOUNT_PK: "ACCOUNTID"
  OPPORTUNITY_ACCOUNT_PK:
    - "OPPORTUNITYID"
    - "ACCOUNTID"
  OPPORTUNITY_HASHDIFF:
    is_hashdiff: true
    columns:
      - "AMOUNT"
      - "PROJECT_NAME"
      - "OPPORTUNITY_NAME"
      - "STAGE"
      - "CLOSE_DATE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}