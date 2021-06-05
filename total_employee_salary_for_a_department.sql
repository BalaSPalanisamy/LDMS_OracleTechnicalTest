select dept.department_name,  sum(emp.salary) salary
from employee emp, department dept
where emp.department_id = dept.department_id
and dept.department_id = :p_department_id
group by dept.department_id, dept.department_name
order by dept.department_id;