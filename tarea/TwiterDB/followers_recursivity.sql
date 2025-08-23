SELECT u."name" as leader, u2."name" as follower  FROM followers f
INNER JOIN "user" u ON u.id = f.leader_id
INNER JOIN "user" u2 ON f.follower_id = u2.id;

select * from followers where leader_id = 1;

SELECT * from followers
WHERE leader_id in (select follower_id from followers where leader_id = 1);