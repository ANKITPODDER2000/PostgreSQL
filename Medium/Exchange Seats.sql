# 626. Exchange Seats

# Table: Seat

# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | student     | varchar |
# +-------------+---------+
# id is the primary key column for this table.
# Each row of this table indicates the name and the ID of a student.
# id is a continuous increment.
 

# Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

# Return the result table ordered by id in ascending order.

SELECT 
    s1.id ,
    CASE 
        WHEN  s2.student IS NULL THEN s1.student
        ELSE s2.student
    END
    AS student
FROM Seat s1
LEFT JOIN Seat s2 ON 
    CASE 
        WHEN s1.id % 2 = 0 THEN s1.id-1 = s2.id
        ELSE s1.id+1 = s2.id
    END
ORDER BY s1.id
