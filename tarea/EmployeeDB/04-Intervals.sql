SELECT 
MAX(hire_date),
MAX(hire_date) + INTERVAL '1 days' AS one_day,
MAX(hire_date) + INTERVAL '1 month' AS one_month,

FROM employees;


SELECT
hire_date,
hire_date +
MAKE_INTERVAL(date_part('year', now())::INTEGER - EXTRACT(YEAR FROM hire_date)::INTEGER)

FROM employees
ORDER BY hire_date DESC;

UPDATE employees
SET hire_date = hire_date + MAKE_INTERVAL(years => date_part('year', now())::INTEGER - EXTRACT(YEAR FROM hire_date)::INTEGER);


SELECT 
first_name,
last_name,
hire_date,
CASE
WHEN hire_date >= (CURRENT_DATE - INTERVAL '5 years') THEN 'Junior'
WHEN hire_date >= (CURRENT_DATE - INTERVAL '10 years') AND hire_date < (CURRENT_DATE - INTERVAL '5 years') THEN 'Intermedio'
WHEN hire_date >= (CURRENT_DATE - INTERVAL '15 years') AND hire_date < (CURRENT_DATE - INTERVAL '10 years') THEN 'Senior'
WHEN hire_date < (CURRENT_DATE - INTERVAL '15 years') THEN 'Master'
END AS hire_level
FROM employees;
