-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX
SELECT first_name, last_name, last_connection AS "ip"
FROM users u 
WHERE last_connection LIKE '221.%';


-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas
SELECT first_name, last_name, followers
FROM users u 
WHERE followers > 4600;

SELECT 
count(*) AS total_registers,
min( followers ) AS min_followers,
max( followers ) AS max_followers,
avg( followers ) AS average_followers,
sum( followers)/ count(*) AS average_manual 
FROM users u;

SELECT first_name, last_name, followers
FROM users u 
WHERE followers = 4
OR followers = 4999;

SELECT count(*), followers
FROM users u 
WHERE followers = 4
OR followers = 4999
GROUP BY followers;