WITH post_week_2024 AS (
	SELECT date_trunc('week', p.created_at) as weeks,
		COUNT(DISTINCT p.post_id) as number_of_post,
		SUM(c.counter) as total_claps
	FROM posts p
	INNER JOIN claps c ON c.post_id = p.post_id
	GROUP BY weeks
	ORDER BY weeks DESC
)
SELECT *
FROM post_week_2024
WHERE weeks >= '2024-01-01' AND weeks < '2025-01-01';

-- Multiple CTEs
WITH post_week_2024 AS (
	SELECT date_trunc('week', p.created_at) as weeks,
		COUNT(DISTINCT p.post_id) as number_of_post,
		SUM(c.counter) as total_claps
	FROM posts p
	INNER JOIN claps c ON c.post_id = p.post_id
	GROUP BY weeks
	ORDER BY weeks DESC
),
post_month_2024 AS (
	SELECT date_trunc('month', p.created_at) as months,
		COUNT(DISTINCT p.post_id) as number_of_post,
		SUM(c.counter) as total_claps
	FROM posts p
	INNER JOIN claps c ON c.post_id = p.post_id
	GROUP BY months
	ORDER BY months DESC
)
SELECT *
FROM post_week_2024
UNION ALL
SELECT *
FROM post_month_2024;