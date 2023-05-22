{%- set yaml_metadata -%}
parent_hashkey: 'OPPORTUNITY_PK'
src_hashdiff: 'OPPORTUNITY_HASHDIFF'
src_payload:
    - "AMOUNT"
    - "PROJECT_NAME"
    - "OPPORTUNITY_NAME"
    - "STAGE"
    - "CLOSE_DATE"
source_model: 'dv4dbt__stg_salesforce_opportunities'
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