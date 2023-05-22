
{%- set yaml_metadata -%}
source_model: "psa_salesforce_leads"
derived_columns:
  RECORD_SOURCE: "!SALESFORCE__LEADS"
  LOAD_DATETIME: "DATECREATED"
  EFFECTIVE_FROM: "MODIFIEDDATE"
hashed_columns:
  LEAD_PK: "LEADID"
  CONTACT_PK: "CONTACTID"
  LEAD_CONTACT_PK:
    - "LEADID"
    - "CONTACTID"
  LEAD_HASHDIFF:
    is_hashdiff: true
    columns:
      - "FIRST_NAME"
      - "LAST_NAME"
      - "EMAIL"
      - "COMPANY"
      - "LEAD_STATUS"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}