{%- set yaml_metadata -%}
source_model: "adv__stg_salesforce_opportunities"
src_pk: "OPPORTUNITY_PK"
src_hashdiff: 
  source_column: "OPPORTUNITY_HASHDIFF"
  alias: "HASHDIFF"
src_payload:
    - "AMOUNT"
    - "PROJECT_NAME"
    - "OPPORTUNITY_NAME"
    - "STAGE"
    - "CLOSE_DATE"
src_eff: "EFFECTIVE_FROM"
src_ldts: "LOAD_DATETIME"
src_source: "RECORD_SOURCE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                   src_hashdiff=metadata_dict["src_hashdiff"],
                   src_payload=metadata_dict["src_payload"],
                   src_eff=metadata_dict["src_eff"],
                   src_ldts=metadata_dict["src_ldts"],
                   src_source=metadata_dict["src_source"],
                   source_model=metadata_dict["source_model"])   }}