USE employees;

-- 3.2.1
SELECT d.dept_name as 'Отдел', AVG(s.salary) as 'Средняя зарплата'
    FROM salaries s
        JOIN employees e ON s.emp_no = e.emp_no
        JOIN dept_emp ON dept_emp.emp_no = e.emp_no
        JOIN departments d ON dept_emp.dept_no = d.dept_no
        JOIN titles ON e.emp_no = titles.emp_no
    WHERE 
    s.to_date = '9999-01-01' and
    `dept_emp`.`to_date` = '9999-01-01' and
    `titles`.`to_date` = '9999-01-01'
    GROUP BY d.dept_name
    ORDER BY AVG(s.salary) DESC
    LIMIT 100
    ;

-- 3.2.2
SELECT max(salary) AS 'Максимальная зарплата' FROM salaries;

-- 3.2.3
DELETE FROM employees 
    WHERE employees.emp_no = 
        (select s.emp_no from salaries s group by s.salary, s.emp_no order by s.salary desc limit 1 )
    ;

-- 3.2.4
SELECT d.dept_name as 'Отдел', COUNT(*) as 'Количество сотрудников'
    FROM salaries s
        JOIN employees e ON s.emp_no = e.emp_no
        JOIN dept_emp ON dept_emp.emp_no = e.emp_no
        JOIN departments d ON dept_emp.dept_no = d.dept_no
        JOIN titles ON e.emp_no = titles.emp_no
    WHERE 
    s.to_date = '9999-01-01' and
    dept_emp.to_date = '9999-01-01' and
    titles.to_date = '9999-01-01'
    GROUP BY d.dept_name
    ;

-- 3.2.5
SELECT d.dept_name as 'Отдел', COUNT(*) as 'Количество сотрудников', SUM(s.salary) AS 'Сумма зарплат'
    FROM salaries s
        JOIN employees e ON s.emp_no = e.emp_no
        JOIN dept_emp ON dept_emp.emp_no = e.emp_no
        JOIN departments d ON dept_emp.dept_no = d.dept_no
        JOIN titles ON e.emp_no = titles.emp_no
    WHERE 
        s.to_date = '9999-01-01' and
        `dept_emp`.`to_date` = '9999-01-01' and
        `titles`.`to_date` = '9999-01-01'
    GROUP BY d.dept_name
    ORDER BY SUM(s.salary) DESC
    ;