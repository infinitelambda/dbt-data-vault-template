{%- set source_model = "adv__stg_salesforce_leads"        -%}
{%- set src_pk = "LEAD_CONTACT_PK"         -%}
{%- set src_fk = ["LEAD_PK", "CONTACT_PK"] -%}
{%- set src_ldts = "LOAD_DATETIME"           -%}
{%- set src_source = "RECORD_SOURCE"         -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}
