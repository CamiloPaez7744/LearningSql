
CREATE
OR REPLACE FUNCTION greed_employee (employee_name VARCHAR) RETURNS VARCHAR AS $$

BEGIN
	RETURN 'Hola ' || employee_name;
END;

$$
LANGUAGE plpgsql;


SELECT first_name, greed_employee(first_name) FROM employees;