select 
    queue1.person_name
from 
    queue queue1 join queue queue2
on 
    queue1.turn >= queue2.turn
group by 
    queue1.turn
having 
    sum(queue2.weight) <= 1000
order by 
    sum(queue2.weight) desc
limit 1;




--Rakshit Gupta
