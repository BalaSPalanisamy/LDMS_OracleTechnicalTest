create or replace function emp_salary_fnc (
    p_employee_id in number, p_employee_name in varchar2) return number is 
l_salary number := 0;
e_employee exception;
BEGIN
    begin
        select salary
        into l_salary
        from employee
        where employee_id = p_employee_id 
        and employee_name = p_employee_name;
    exception
        when others then 
            DBMS_OUTPUT.PUT_LINE('Employee doesn''t exists. Please enter Employee Id and Employee Name');
            return l_salary;
    end;

    return l_salary;
END emp_salary_fnc;
