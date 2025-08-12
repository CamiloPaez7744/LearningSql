

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

SELECT count(*), cl.languagecode, cl."language" from country c
INNER JOIN countrylanguage cl on cl.countrycode = c.code
where c.continent = 5
and cl.isofficial = true
GROUP BY  cl.languagecode, cl."language"
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)

SELECT c."name" from country c
INNER JOIN countrylanguage cl on cl.countrycode = c.code
where c.continent = 5
and cl.isofficial = true
and cl.languagecode = 135
ORDER BY c."name";


