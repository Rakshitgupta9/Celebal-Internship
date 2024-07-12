select visited_on,
sum(sum(amount)) over (rows between 6 preceding and current row) as amount,
round(avg(sum(amount)) OVER (rows between 6 preceding and current row),2) AS average_amount
from Customer
group by visited_on
order by visited_on 
limit 999999 offset 6;



--Rakshit Gupta
