with cte9 as (
    select * from {{ref('src_listings')}}

)

select * from cte9
where created_at >= '{{var("new_date")}}'