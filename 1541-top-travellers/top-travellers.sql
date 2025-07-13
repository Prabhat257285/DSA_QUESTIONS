SELECT 
    users.name, 
    IFNULL(dista.total_distance, 0) AS travelled_distance  
FROM 
    users 
LEFT JOIN 
    (SELECT user_id, SUM(distance) AS total_distance 
     FROM rides 
     GROUP BY user_id) AS dista 
ON users.id = dista.user_id
ORDER BY 
    2 DESC, 1 ASC;