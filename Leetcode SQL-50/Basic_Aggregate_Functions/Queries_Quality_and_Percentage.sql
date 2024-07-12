elect distinct query_name , round(avg(rating/position) over(partition by query_name) ,2) as quality,
round(avg(case when rating<3 then 1 else 0 end) over(partition by query_name)*100,2) as poor_query_percentage from queries
where query_name is not null
