{%- set yaml_metadata -%}
source_model: 'psa_salesforce_contacts'
ldts: 'DATECREATED'
rsrc: '!SALESFORCE__CONTACTS'
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
derived_columns:
    EFFECTIVE_FROM: "MODIFIEDDATE"
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set source_model = metadata_dict['source_model'] -%}
{%- set ldts = metadata_dict['ldts'] -%}
{%- set rsrc = metadata_dict['rsrc'] -%}
{%- set hashed_columns = metadata_dict['hashed_columns'] -%}
{%- set derived_columns = metadata_dict['derived_columns'] -%}

{{ datavault4dbt.stage(source_model=source_model,
                    ldts=ldts,
                    rsrc=rsrc,
                    hashed_columns=hashed_columns,
                    derived_columns=derived_columns,
                    prejoined_columns=none,
                    missing_columns=none,
                    multi_active_config=none) }}