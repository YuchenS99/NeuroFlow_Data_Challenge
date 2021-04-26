SELECT YEAR(u.create_at) AS year,
       MONTH(u.create_at) AS month,
       1.0* SUM(CASE WHEN YEAR(u.create_at) = YEAR(e.exercise_completion_date)
       AND MONTH(u.create_at) = MONTH(e.exercise_completion_date) THEN 1 ELSE 0 END) /
       COUNT(u.create_at) * 100 AS percentage_of_exercise_per_first_month
FROM users AS u LEFT JOIN exercises AS e ON u.user_id = e.user_id
GROUP BY YEAR(u.create_at), MONTH(u.create_at);
