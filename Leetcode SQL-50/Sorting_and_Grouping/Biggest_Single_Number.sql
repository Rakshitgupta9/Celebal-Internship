SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS single_numbers
ORDER BY num DESC
LIMIT 1;




--Rakshit Gupta
