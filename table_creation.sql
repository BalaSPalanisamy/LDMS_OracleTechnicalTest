create table department (
	department_id number(5),
	department_name varchar2(50),
	location character(50),
	constraint pk_dept primary key (department_id)
);

create table employee (
	employee_id number(10),
	employee_name varchar2(50),
	job_title varchar2(50),
	manager_id number(10),
	date_hired	date,
	salary number,
	department_id number,
	constraint pk_emp primary key(employee_id),
	constraint fk_dept foreign key (department_id) references department (department_id)
);