{%- set source_model = "adv__stg_salesforce_contacts"   -%}
{%- set src_pk = "CONTACT_PK"          -%}
{%- set src_nk = "CONTACTID"          -%}
{%- set src_ldts = "LOAD_DATETIME"      -%}
{%- set src_source = "RECORD_SOURCE"    -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}