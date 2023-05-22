{%- set yaml_metadata -%}
parent_hashkey: 'LEAD_PK'
src_hashdiff: 'LEAD_HASHDIFF'
src_payload:
    - "FIRST_NAME"
    - "LAST_NAME"
    - "EMAIL"
    - "COMPANY"
    - "LEAD_STATUS"
source_model: 'dv4dbt__stg_salesforce_leads'
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set parent_hashkey = metadata_dict['parent_hashkey'] -%}
{%- set src_hashdiff = metadata_dict['src_hashdiff'] -%}
{%- set source_model = metadata_dict['source_model'] -%}
{%- set src_payload = metadata_dict['src_payload'] -%}


{{ datavault4dbt.sat_v0(parent_hashkey=parent_hashkey,
                        src_hashdiff=src_hashdiff,
                        source_model=source_model,
                        src_payload=src_payload) }}