create or replace package employee_update_pkg as
    procedure emp_new_depart_prc (p_employee_id in number, p_employee_name in varchar2, p_job_title in varchar2, p_department_name in varchar2);
    procedure new_salary_payment_prc (p_employee_id in number, p_employee_name in varchar2, p_salary_percentage in number);
end employee_update_pkg;