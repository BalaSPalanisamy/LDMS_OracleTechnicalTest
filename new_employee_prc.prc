create or replace procedure new_employee_prc (
    p_employee_name in varchar2, p_job_title in varchar2, p_manager in varchar2, p_date_hired in date, p_salary in number, p_department_name in varchar2) is 
s_employee_id number := 0;
p_manager_id number := 0;
p_department_id number := 0;
emp_count number := 0;
e_emp_count exception;
BEGIN
    begin
        select s_emp_id.nextval
        into s_employee_id
        from dual;
    end;

    begin
        select employee_id
        into p_manager_id
        from employee
        where employee_name = p_manager;
    exception
        when no_data_found then
            p_manager_id := null;
    end;
    
    begin
        select department_id
        into p_department_id
        from department
        where department_name = p_department_name;
    exception
        when no_data_found then
            p_department_id := 4;
    end;
    
    begin
        select count(*) 
        into emp_count 
        from employee emp 
        where emp.employee_name = p_employee_name
        and emp.job_title = p_job_title
        and emp.date_hired = to_date(p_date_hired, 'dd/mm/yy')
        and emp.salary = p_salary;
    end;
    
    
    if (emp_count >= 1) then
        raise e_emp_count;
    else
        insert into employee (
            employee_id,
            employee_name, 
            job_title, 
            manager_id, 
            date_hired, 
            salary, 
            department_id
        )
        values 
        (
            s_employee_id, 
            p_employee_name, 
            p_job_title, 
            p_manager_id, 
            to_date(p_date_hired, 'dd/mm/yy'), 
            p_salary, 
            p_department_id
        );
        
        commit;
        
        DBMS_OUTPUT.PUT_LINE(p_employee_name||' New Employee Created');
    end if;
    
exception 
    when e_emp_count then
        DBMS_OUTPUT.PUT_LINE('Employee Already Exists, Please check the Employee Details');
END new_employee_prc;