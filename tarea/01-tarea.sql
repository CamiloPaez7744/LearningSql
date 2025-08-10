

-- 1. Ver todos los registros


-- 2. Ver el registro cuyo id sea igual a 10


-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)


-- 4. Todos los registros cuyo segundo nombre es Alexander


-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'


-- 6. Borrar el último registro de la tabla


-- 7. Apellidos
SELECT 
	upper(name) AS "upper_case",
	lower(name) AS "lower_case",
	initcap(name) AS "sentence_case",
	'*'||id||'-'||name||'*' AS barcode,
	name
FROM
	users u ;

SELECT split_part(name, ' ', 1) AS "name",
split_part(name, ' ', 2) AS "last_name",
name AS "full_name"
FROM users u;

SELECT substring(name, 0, POSITION(' ' IN name)) AS "first_name",
substring(name, POSITION(' ' IN name)+1) AS "lastName" 
FROM users u;

UPDATE users 
SET first_name = substring(name, 0, POSITION(' ' IN name)),
last_name = substring(name, POSITION(' ' IN name)+1);

SELECT * FROM users u;