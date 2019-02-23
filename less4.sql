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

-- 4.2 function find_manager
 

DROP FUNCTION IF EXISTS find_manager;

DELIMITER $$

CREATE FUNCTION find_manager (
	f_n_mng VARCHAR(14), 
    l_n_mng VARCHAR(16)
    )

RETURNS CHAR(100) --  NOT? DETERMINISTIC 
READS SQL DATA 

BEGIN
DECLARE _manager CHAR(100) DEFAULT '';

SET _manager = (
    SELECT concat(e.first_name, ' ', e.last_name, ' ',e.gender, ' ',e.birth_date, ' ',dp.dept_name, ' ',t.title, ' ',s.salary, '$') 
        FROM salaries s
            JOIN employees e ON s.emp_no = e.emp_no
            JOIN dept_emp ON dept_emp.emp_no = e.emp_no
            JOIN departments dp ON dept_emp.dept_no = dp.dept_no
            JOIN titles t ON e.emp_no = t.emp_no
        WHERE 
        e.first_name = f_n_mng and e.last_name = l_n_mng and
        s.to_date = '9999-01-01' and
        dept_emp.to_date = '9999-01-01' and
        t.to_date = '9999-01-01'
        
        GROUP BY e.first_name, e.last_name, e.gender, e.birth_date, dp.dept_name, t.title, s.salary
    );

RETURN _manager;
END $$
DELIMITER ;

-- 4.2 test function
SELECT find_manager ('Chirstian', 'Koblick');

-- 4.3