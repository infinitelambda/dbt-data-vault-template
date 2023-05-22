
{%- set yaml_metadata -%}
source_model: "psa_salesforce_contacts"
derived_columns:
  RECORD_SOURCE: "!SALESFORCE__CONTACTS"
  LOAD_DATETIME: "DATECREATED"
  EFFECTIVE_FROM: "MODIFIEDDATE"
hashed_columns:
  CONTACT_PK: "CONTACTID"
  ACCOUNT_PK: "ACCOUNTID"
  CONTACT_ACCOUNT_PK:
    - "CONTACTID"
    - "ACCOUNTID"
  CONTACT_HASHDIFF:
    is_hashdiff: true
    columns:
      - "FIRST_NAME"
      - "LAST_NAME"
      - "EMAIL"
      - "COUNTRY"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}