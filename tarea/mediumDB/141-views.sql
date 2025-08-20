
CREATE VIEW comments_per_week as
SELECT date_trunc('week', p.created_at) as weeks,
	COUNT(DISTINCT p.post_id) as number_of_post,
	SUM(c.counter) as total_claps
FROM posts p
INNER JOIN claps c ON c.post_id = p.post_id
GROUP BY weeks
ORDER BY weeks DESC;

SELECT * FROM comments_per_week;

CREATE MATERIALIZED VIEW comments_per_week_mv AS
SELECT date_trunc('week', p.created_at) as weeks,
	COUNT(DISTINCT p.post_id) as number_of_post,
	SUM(c.counter) as total_claps
FROM posts p
INNER JOIN claps c ON c.post_id = p.post_id
GROUP BY weeks
ORDER BY weeks DESC;

REFRESH MATERIALIZED VIEW comments_per_week_mv;

ALTER MATERIALIZED VIEW comments_per_week_mv RENAME TO comments_per_week_mv_renamed;
