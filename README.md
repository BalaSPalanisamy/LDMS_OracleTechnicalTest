# LDMS_OracleTechnicalTest
I have used Oracle Live SQL to develop the below scripts.  To execute the scripts click on the “run button” or select the script and press “ctrl + enter”
1. Create the necessary data structures to contain the data specified in the Appendix ensuring that data integrity is enforced
Created data structure "table_creation.sql" for department and employee table with data constraints (primary, foreign key)

2. Populate the Departments and Employees data structures using the data specified in the Appendix
"insert_record.sql" file contains the insert script for department and employee table

3. Create an appropriate executable database object to allow an Employee to be created
pre-requisite: execute the procedure "new_employee_prc.prc" 
E.g.,
To create a new employee record with manager_id, execute the below script.
execute new_employee_prc ('George', 'Engineer', 'Sarah Phelps', to_date('07-04-19', 'dd-mm-yy'), 45000 , 'Engineering');
Re-run the same above script will display that the 'Employee Already Exists. Please check the Employee Details'
E.g.,
To create a new employee record without manager_id, execute the below script.
execute new_employee_prc ('Peter', 'Salesperson', null, to_date('14-06-19', 'dd-mm-yy'), 40000 , 'Sales');
Re-run the same above script will display that the 'Employee Already Exists. Please check the Employee Details'

4. Create an appropriate executable database object to allow the Salary for an Employee to be increased or decreased by a percentage
pre-requisite: execute the package spec and body "employee_update_pkg.pks" and "employee_update_pkg.pkb"
E.g.,
To increase the salary 
execute employee_update_pkg.new_salary_payment_prc(90004, 'Selwyn Field', 10);
E.g.,
To decrease the salary 
execute employee_update_pkg.new_salary_payment_prc(90004, 'Selwyn Field', -5);

5. Create an appropriate executable database object to allow the transfer of an Employee to a different Department
pre-requisite: execute the package spec and body "employee_update_pkg.pks" and "employee_update_pkg.pkb"

E.g.,
to transfer an Employee to new department, execute the below script
execute employee_update_pkg.emp_new_depart_prc(90003, 'Roxy Jones', 'Engineer', 'Engineering');

6. Create an appropriate executable database object to return the Salary for an Employee.
pre-requisite: execute the function emp_salary_fnc.fnc
E.g.,
To return the salary of an Employee, execute the below script
select emp_salary_fnc(90003, 'Roxy Jones') from dual;

7. Write a report to show all Employees for a Department
executing the "all_employees_for_a_department.sql" by passing department_id will return all employees of the department requested

8. Write a report to show the total of Employee Salary for a Department
executing the "total_employee_salary_for_a_department.sql" by passing department_id will return sum of employee salary for a department