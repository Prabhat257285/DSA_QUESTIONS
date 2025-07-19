# Write your MySQL query statement below
with n1 as (
    select distinct p_id from tree
    where p_id is not null
)
select id, 
case 
when p_id is null then 'Root'
when id not in (select * from n1) then 'Leaf'
else 'Inner'
end as type
from tree