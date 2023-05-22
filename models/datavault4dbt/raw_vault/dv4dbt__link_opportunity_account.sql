{%- set yaml_metadata -%}
link_hashkey: 'OPPORTUNITY_ACCOUNT_PK'
foreign_hashkeys: 
    - 'OPPORTUNITY_PK'
    - 'ACCOUNT_PK'
source_models: 'dv4dbt__stg_salesforce_opportunities'
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set link_hashkey = metadata_dict['link_hashkey'] -%}
{%- set foreign_hashkeys = metadata_dict['foreign_hashkeys'] -%}
{%- set source_models = metadata_dict['source_models'] -%}


{{ datavault4dbt.link(link_hashkey=link_hashkey,
        foreign_hashkeys=foreign_hashkeys,
        source_models=source_models) }}