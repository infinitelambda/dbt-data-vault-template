
{%- set yaml_metadata -%}
source_model: "psa_salesforce_accounts"
derived_columns:
  RECORD_SOURCE: "!SALESFORCE__ACCOUNTS"
  LOAD_DATETIME: "DATECREATED"
  EFFECTIVE_FROM: "MODIFIEDDATE"
hashed_columns:
  ACCOUNT_PK: "ACCOUNTID"
  ACCOUNT_HASHDIFF:
    is_hashdiff: true
    columns:
      - "COMPANY_NAME"
      - "STATE"
      - "CITY"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}