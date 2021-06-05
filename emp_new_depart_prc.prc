create or replace procedure emp_new_depart_prc (
    p_employee_id in number, p_employee_name in varchar2, p_job_title in varchar2, p_department_name in varchar2) is
emp_count number := 0;
new_department_id number := 0;
e_employee exception;
e_department exception;
BEGIN
    begin
        select count(*) 
        into emp_count
        from employee
        where employee_id = p_employee_id 
        and employee_name = p_employee_name;
    exception
        when others then 
            raise e_employee;
    end;

    begin
        select dept.department_id 
        into new_department_id
        from department dept 
        where department_name = p_department_name;
    exception
        when others then 
            raise e_department;
    end;
    
    update 
        employee emp
    set emp.department_id = new_department_id, job_title = p_job_title
    where employee_id = p_employee_id 
    and employee_name = p_employee_name;
    
    commit;
    
    DBMS_OUTPUT.PUT_LINE(p_employee_name||' has changed '||p_department_name||' Department');
    
exception 
    when e_employee then
        DBMS_OUTPUT.PUT_LINE('Employee doesn''t exists. Please enter Employee Id and Employee Name');
    when e_department then
        DBMS_OUTPUT.PUT_LINE('Please enter the correct Department Name');

END emp_new_depart_prc;