/* Write your T-SQL query statement below */
with n1 as (
    select buyer_id, count(buyer_id) orders from orders
    where year(order_date)=2019
    group by buyer_id
)
select user_id as buyer_id, join_date, coalesce(orders,0) as orders_in_2019 from users u
left join n1
on u.user_id = n1.buyer_id