SELECT
  now(),
  CURRENT_DATE,
  CURRENT_TIME,
  date_part('years', now()) as year,
  date_part('month', now()) as month,
  date_part('days', now()) as day,
  date_part('hours', now()) as hour,
  date_part('minutes', now()) as minute,
  date_part('seconds', now()) as second;
  
  
SELECT * FROM employees
WHERE hire_date > '1998-02-05'
ORDER BY hire_date ASC;

SELECT 
MAX(hire_date) as last_employee,
MIN(hire_date) as first_employee
FROM employees;

SELECT * FROM employees
WHERE hire_date BETWEEN '1998-01-01' AND '1999-01-01'
ORDER BY hire_date ASC;