{% snapshot snap_reviews %}
 
{{

    config(

        target_schema='training1',

        unique_key='listing_id',

        strategy='check',

        check_cols = ['listing_id','reviewer_name','review_text'],

        dbt_valid_to_current = "timestamp('9999-12-31 00:00:00 UTC')",

        hard_deletes = 'invalidate',

        enabled = false

    )

}}
 
SELECT

*
 
FROM {{ ref('src_reviews') }}
 
{% endsnapshot %}
 