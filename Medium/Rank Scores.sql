# 178. Rank Scores

# Table: Scores

# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | score       | decimal |
# +-------------+---------+
# id is the primary key for this table.
# Each row of this table contains the score of a game. Score is a floating point value with two decimal places.
 

# Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:

# The scores should be ranked from the highest to the lowest.
# If there is a tie between two scores, both should have the same ranking.
# After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
# Return the result table ordered by score in descending order.

# The query result format is in the following example.



# Write your MySQL query statement below
WITH DisTable AS (
    SELECT DISTINCT Score FROM Scores
),
TempTable AS (
    SELECT 
        S1.score , COUNT(S1.score) AS r
    FROM DisTable S1
    INNER JOIN DisTable S2 ON S1.score <= S2.score
    GROUP BY S1.score
)
SELECT 
    Scores.score , TempTable.r AS 'rank'
FROM Scores
INNER JOIN TempTable ON Scores.score = TempTable.score
ORDER BY TempTable.r 
