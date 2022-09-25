# 608. Tree Node

# Table: Tree

# +-------------+------+
# | Column Name | Type |
# +-------------+------+
# | id          | int  |
# | p_id        | int  |
# +-------------+------+
# id is the primary key column for this table.
# Each row of this table contains information about the id of a node and the id of its parent node in a tree.
# The given structure is always a valid tree.
 

# Each node in the tree can be one of three types:

# "Leaf": if the node is a leaf node.
# "Root": if the node is the root of the tree.
# "Inner": If the node is neither a leaf node nor a root node.
# Write an SQL query to report the type of each node in the tree.

# Return the result table ordered by id in ascending order.

WITH IsInnerNode AS(
    SELECT 
        Par.id,
        Count(Child.p_id) NoOfChildren
    FROM Tree Par
    LEFT JOIN Tree Child ON Par.id = child.p_id
    GROUP BY Par.id
),
AnsTable AS (
    SELECT 
        T.id,
        CASE
            WHEN T.p_id IS NULL THEN 'Root'
            WHEN T.p_id IS NOT NULL AND I.NoOfChildren > 0 THEN 'Inner'
            ELSE 'Leaf'
        END AS type
    FROM Tree T
    INNER JOIN IsInnerNode I ON T.id = I.id
)
SELECT * FROM AnsTable;
