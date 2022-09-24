# 177. Nth Highest Salary

# Table: Employee

# +-------------+------+
# | Column Name | Type |
# +-------------+------+
# | id          | int  |
# | salary      | int  |
# +-------------+------+
# id is the primary key column for this table.
# Each row of this table contains information about the salary of an employee.
 

# Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.

# The query result format is in the following example.



CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      
      WITH CTETable AS (
        SELECT 
            DISTINCT salary
        FROM Employee
      )
      
      SELECT E1.salary FROM CTETable E1
      INNER JOIN CTETable E2 ON E1.salary <= E2.salary
      GROUP BY E1.salary
      HAVING COUNT(E1.salary) = N
      
      
  );
END
