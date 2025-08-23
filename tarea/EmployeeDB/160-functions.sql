
CREATE
OR REPLACE FUNCTION greed_employee (employee_name VARCHAR) RETURNS VARCHAR AS $$

BEGIN
	RETURN 'Hola ' || employee_name;
END;

$$
LANGUAGE plpgsql;


SELECT first_name, greed_employee(first_name) FROM employees;


SELECT * FROM employees;

SELECT * FROM jobs;

SELECT
  e.employee_id,
  e.first_name,
  e.salary,
  j.max_salary,
  j.max_salary - e.salary as possible_rase
FROM
  employees e
  INNER JOIN jobs j ON j.job_id = e.job_id;
  
  
CREATE
OR REPLACE FUNCTION max_raise (empl_id INTEGER) RETURNS NUMERIC(8, 2) AS $$

DECLARE
possible_raise NUMERIC(8,2);

BEGIN

SELECT
  j.max_salary - e.salary INTO possible_raise
FROM
  employees e
  INNER JOIN jobs j ON j.job_id = e.job_id
  WHERE e.employee_id = empl_id;
	RETURN possible_raise;
END;
$$ LANGUAGE plpgsql;

CREATE
OR REPLACE FUNCTION max_raise2 (empl_id INTEGER) RETURNS NUMERIC(8, 2) AS $$

DECLARE
employee_job_id int;
current_salary NUMERIC(8,2);
job_max_salary NUMERIC(8,2);
possible_raise NUMERIC(8,2);

BEGIN

SELECT
  job_id,
  salary INTO employee_job_id,
  current_salary
FROM
  employees
WHERE
  employee_id = empl_id;
  
SELECT
max_salary INTO job_max_salary
FROM
jobs
WHERE
job_id = employee_job_id;

possible_raise = job_max_salary - current_salary;

IF possible_raise < 0 THEN
   RAISE EXCEPTION 'The possible raise is negative';
END IF;

RETURN possible_raise;

END;
$$ LANGUAGE plpgsql;

-- With RowType
CREATE
OR REPLACE FUNCTION max_raise3 (empl_id INTEGER) RETURNS NUMERIC(8, 2) AS $$

DECLARE
selected_employee employees%ROWTYPE;
selected_job jobs%ROWTYPE;
possible_raise NUMERIC(8,2);

BEGIN

SELECT
  * INTO selected_employee
FROM
  employees
WHERE
  employee_id = empl_id;

SELECT
  * INTO selected_job
FROM
  jobs
WHERE
  job_id = selected_employee.job_id;

possible_raise = selected_job.max_salary - selected_employee.salary;

IF possible_raise < 0 THEN
   RAISE EXCEPTION 'Person with ID % and name % has a negative possible raise',empl_id, selected_employee.first_name;
END IF;

RETURN possible_raise;

END;
$$ LANGUAGE plpgsql;


SELECT
  e.employee_id,
  e.first_name,
  max_raise(e.employee_id),
  max_raise3(e.employee_id)
FROM
employees e;