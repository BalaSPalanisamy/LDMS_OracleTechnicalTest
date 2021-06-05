create or replace procedure new_salary_payment_prc (
    p_employee_id in number, p_employee_name in varchar2, p_salary_percentage in number) is
old_salary number := 0;
new_salary number := 0;
salary_diff number := 0;
e_employee exception;

BEGIN
    begin
        select salary 
        into old_salary
        from employee
        where employee_id = p_employee_id 
        and employee_name = p_employee_name;
    exception
        when no_data_found then
            old_salary := 0;
    end;
    
    update employee
    set salary = salary + (salary * p_salary_percentage / 100) 
    where employee_id = p_employee_id 
    and employee_name = p_employee_name;
    
    commit;
     
    begin
        select salary 
        into new_salary
        from employee
        where employee_id = p_employee_id 
        and employee_name = p_employee_name;
    exception
        when no_data_found then
            old_salary := 0;
    end;
    
    salary_diff := abs(new_salary - old_salary);
    DBMS_OUTPUT.PUT_LINE(salary_diff);
    if (salary_diff > 0) then 
        DBMS_OUTPUT.PUT_LINE(p_employee_name||' Salary has been updated');
    end if;
    
exception 
    when e_employee then
        DBMS_OUTPUT.PUT_LINE('Employee doesn''t exists. Please enter Employee Id and Employee Name');
END new_salary_payment_prc;