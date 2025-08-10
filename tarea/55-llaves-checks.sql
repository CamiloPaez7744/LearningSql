

-- 1. Crear una llave primaria en city (id)
ALTER TABLE city ADD PRIMARY KEY (id);

-- 2. Crear un check en population, para que no soporte negativos
ALTER TABLE city ADD CHECK (
population >= 0
)

-- 3. Crear una llave primaria compuesta en "countrylanguage"
-- los campos a usar como llave compuesta son countrycode y language
ALTER TABLE countrylanguage ADD PRIMARY KEY (
countrycode, language
)

-- 4. Crear check en percentage, 
-- Para que no permita negativos ni números superiores a 100
ALTER TABLE countrylanguage ADD CHECK (
percentage >= 0 AND percentage <= 100
)

SELECT * FROM country c WHERE code = 'CRI';

ALTER TABLE country ADD PRIMARY KEY (code);


DELETE FROM country WHERE code = 'NLD' AND code2 = 'NA';

ALTER TABLE country ADD CHECK (surfacearea >= 0);

SELECT DISTINCT continent FROM country c ;

ALTER TABLE country ADD CHECK (
	(continent = 'Asia') OR
	(continent = 'South America') OR
	(continent = 'Central America') or
	(continent = 'North America') OR
	(continent = 'Oceania') OR
	(continent = 'Antarctica') OR
	(continent = 'Africa') OR
	(continent = 'Europe')
)

ALTER TABLE country DROP CONSTRAINT "country_continent_check1";

CREATE INDEX "unique_country_name" ON country (
name
);

CREATE INDEX "country_continent" ON country (
continent
);


ALTER TABLE city ADD PRIMARY KEY (id);

SELECT *FROM city;
SELECT * FROM countrylanguage c ;

ALTER TABLE city ADD CHECK (
population >= 0
)

ALTER TABLE countrylanguage ADD PRIMARY KEY (
countrycode, language
)

ALTER TABLE countrylanguage ADD CHECK (
percentage >= 0 AND percentage <= 100
);

SELECT * FROM city WHERE name='Jinzhou';
CREATE UNIQUE INDEX "unique_name_countrycode_district" ON city (
name, countrycode, district
);

CREATE INDEX "index_district" ON city (
district
);