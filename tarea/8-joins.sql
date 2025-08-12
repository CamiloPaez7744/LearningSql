-- INNER JOIN
SELECT c.name as country, ct."name" as continent FROM country c 
INNER JOIN continent ct ON c.continent = ct.code
ORDER BY c.name;

-- FULL OUTER JOIN
SELECT c.name as country, ct."name" as continent FROM country c 
FULL OUTER JOIN continent ct ON c.continent = ct.code
ORDER BY c.name;

-- RIGHT JOIN
SELECT c.name as country, ct."name" as continent FROM country c 
RIGHT JOIN continent ct ON c.continent = ct.code
WHERE c.name is NULL
ORDER BY c.name;

-- COUNT COUNTRY BY CONTINENT
SELECT count(c.continent) as numero_paises, ct."name" as continent
FROM  country c 
INNER JOIN continent ct on ct.code = c.continent
GROUP BY continent, ct."name"
ORDER BY numero_paises ASC;