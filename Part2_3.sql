SELECT P.organization_name AS organization_name,
       1.0*SUM(R.score) / COUNT(R.sore) AS average_phq9_per_person
FROM Providers AS P INNER JOIN Phq9 AS R ON P.provider_id = R.provider_id
GROUP BY P.organization_id, P.organization_name
ORDER BY average_phq9_per_person DESC
LIMIT 5;
