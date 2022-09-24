# 180. Consecutive Numbers

# Table: Logs

# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | num         | varchar |
# +-------------+---------+
# id is the primary key for this table.
# id is an autoincrement column.
 

# Write an SQL query to find all numbers that appear at least three times consecutively.

# Return the result table in any order.

# The query result format is in the following example.

WITH temp AS(
    SELECT 
        t1.id
    FROM Logs t1
    INNER JOIN Logs t2
    ON (t1.id+1 = t2.id OR t1.id+2 = t2.id) AND t1.num = t2.num
    GROUP BY t1.id
    HAVING COUNT(t1.id) >= 2
)
SELECT DISTINCT Logs.num AS ConsecutiveNums
FROM Logs
INNER JOIN temp 
ON Logs.id = temp.id
