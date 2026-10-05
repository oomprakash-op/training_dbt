{% snapshot snap_listings %}
 
{{

    config(

        target_schema='training1',

        unique_key='listing_id',

        strategy='timestamp',

        updated_at='updated_at'

    )

}}
 
SELECT

*
 
FROM {{ ref('src_listings') }}
 
{% endsnapshot %}
 