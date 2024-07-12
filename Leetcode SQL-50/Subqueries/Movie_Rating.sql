WITH 
TheMostActiveUser AS (
    SELECT name
    FROM 
        Users
        NATURAL JOIN MovieRating
    GROUP BY user_id
    ORDER BY COUNT(*) DESC, name
    LIMIT 1
),
TheBestMovieFebruary AS (
    SELECT title
    FROM
        Movies
        NATURAL JOIN MovieRating
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY movie_id
    ORDER BY AVG(rating) DESC, title
    LIMIT 1
)

SELECT name AS results
FROM TheMostActiveUser
UNION ALL
SELECT title
FROM TheBestMovieFebruary



--Rakshit Gupta
