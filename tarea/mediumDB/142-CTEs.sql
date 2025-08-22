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

--Recursive CTEs
--table name
WITH RECURSIVE countdown( val) AS (
-- initialization => first level initial values
	SELECT 10
	UNION ALL
	SELECT val - 1
	FROM countdown
	WHERE val > 1
)
SELECT *
FROM countdown;

WITH RECURSIVE countup(val) AS (
    SELECT 1
    UNION ALL
    SELECT val + 1
    FROM countup
    WHERE val < 10
)
SELECT *
FROM countup;

WITH RECURSIVE factorial(n, fact) AS (
    SELECT 0, 1
    UNION ALL
    SELECT n + 1, fact * (n + 1)
    FROM factorial
    WHERE n < 5
)
SELECT *
FROM factorial;


WITH RECURSIVE week_series AS (
    SELECT date_trunc('week', NOW()) AS week_start
    UNION ALL
    SELECT week_start - INTERVAL '1 week'
    FROM week_series
    WHERE week_start > '2024-01-01'
)
SELECT week_start
FROM week_series;

-- Organizational structure recursive CTE
SELECT * FROM employees WHERE report_to = 1;

WITH RECURSIVE bosses AS (
	SELECT id, name, report_to from employees WHERE id = 7
	UNION
	SELECT e.id, e.name, e.report_to from employees e
	INNER JOIN bosses ON bosses.id = e.report_to
)
SELECT * FROM bosses;