SELECT exercise_count AS num_of_activities, COUNT(id) AS user_count
FROM (SELECT u.user_id AS id,
             COUNT(exercise_completion_date) AS exercise_count
      FROM users AS u LEFT JOIN exercises AS e ON u.user_id = e.user_id
      GROUP BY u.user_id) as freq
GROUP BY exercise_count
ORDER BY exercise_count ASC;
