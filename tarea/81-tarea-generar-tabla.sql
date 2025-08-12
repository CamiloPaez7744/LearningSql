

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

(SELECT COUNT(*) as "Total", ct.name as "Continent" FROM country c
INNER JOIN continent ct on ct.code = c.continent
WHERE ct.name NOT LIKE '%America%'
GROUP BY ct.name)
UNION
(
SELECT COUNT(*) as "Total", 'America' FROM country c
INNER JOIN continent ct on ct.code = c.continent
WHERE ct.name LIKE '%America%'
)ORDER BY "Total" ASC;


-- COUNTRY WITH MOST CITIES
SELECT count(*) as "Cities", c."name" as "Country" from country c
INNER JOIN city ci on ci.countrycode = c.code
GROUP BY c."name"
ORDER BY count(*) desc
LIMIT 1;

-- LANGUAGES BY CONTINENT
SELECT DISTINCT l."name", ct."name" from countrylanguage cl
INNER JOIN "language" l on cl.languagecode = l.code
INNER JOIN country c ON cl.countrycode = c.code
INNER JOIN continent ct ON c.continent = ct.code
WHERE cl.isofficial = TRUE
ORDER BY ct."name";

-- COUNT LANGUAGES BY CONTINENT
SELECT COUNT(*), continent from (
SELECT DISTINCT l."name", ct."name" as continent from countrylanguage cl
INNER JOIN "language" l on cl.languagecode = l.code
INNER JOIN country c ON cl.countrycode = c.code
INNER JOIN continent ct ON c.continent = ct.code
WHERE cl.isofficial = TRUE
) as totales
GROUP BY continent
ORDER BY COUNT(*);