# 184. Department Highest Salary

# Table: Employee

# +--------------+---------+
# | Column Name  | Type    |
# +--------------+---------+
# | id           | int     |
# | name         | varchar |
# | salary       | int     |
# | departmentId | int     |
# +--------------+---------+
# id is the primary key column for this table.
# departmentId is a foreign key of the ID from the Department table.
# Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

# Table: Department

# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | name        | varchar |
# +-------------+---------+
# id is the primary key column for this table.
# Each row of this table indicates the ID of a department and its name.
 

# Write an SQL query to find employees who have the highest salary in each of the departments.

WITH MaxSalary AS (
    SELECT
        departmentid AS DeptId,
        Max(salary) AS MaxSal
    FROM Employee
    GROUP BY departmentid
),
AnsTable AS (
    SELECT 
        dept.name Department,
        emp.name Employee,
        emp.salary
    FROM Employee emp
    INNER JOIN MaxSalary ON MaxSalary.DeptId = emp.departmentid
        AND emp.salary = MaxSalary.MaxSal
    INNER JOIN Department dept ON Dept.id = MaxSalary.DeptId
)
SELECT * FROM AnsTable;
