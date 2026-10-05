{{

    config( 
        materialized = 'table',
        cluster_by =["listing_id","reviewer_name","review_sentiment"],
        tags= ['oom','airbnb','models']
            
            
        
    ) 

}}



with cte_3 as
(
select 
*
from
airbnb_raw_data.raw_reviews
)
 
select
listing_id, 
date as review_date,
reviewer_name,
comments as review_text,
sentiment as review_sentiment
from
cte_3