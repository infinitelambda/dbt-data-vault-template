{%- set yaml_metadata -%}
source_model: 'psa_salesforce_leads'
ldts: 'DATECREATED'
rsrc: '!SALESFORCE__LEADS'
hashed_columns: 
    LEAD_PK: "LEADID"
    CONTACT_PK: "LEADID"
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