# Write your MySQL query statement below
select p.Product_id,Product_name
from Product p
inner join Sales s on p.product_id = s.product_id
group by
p.Product_id , p.Product_name
having
    MIN(s.sale_date) >= '2019-01-01' AND  
    MAX(s.sale_date) <= '2019-03-31';
