select emp.employee_id, emp.employee_name, emp.job_title, 
(select mgr.employee_name from employee mgr where mgr.employee_id = emp.manager_id) manager_name,
emp.date_hired, emp.salary, dept.department_name 
from employee emp, department dept
where emp.department_id = dept.department_id
and dept.department_id = :p_department_id;