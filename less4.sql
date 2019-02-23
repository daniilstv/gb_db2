-- 4.1

CREATE VIEW avg_salary AS
    SELECT d.dept_name as 'Отдел', AVG(s.salary) as 'Средняя зарплата'
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
        ORDER BY AVG(s.salary) DESC
        LIMIT 100
    ;
    
SELECT * FROM avg_salary;

-- 4.2