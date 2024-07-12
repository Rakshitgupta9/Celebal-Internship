select distinct l1.num as ConsecutiveNums from logs l1, logs l2, logs l3
where l1.id=l2.id+1 and l1.num=l2.num
and l1.id=l3.id+2 and l1.num= l3.num



--Rakshit Gupta
