create table employee(
emp_id int primary key,
first_name varchar(40),
last_name varchar(40),
birth_day date,
sex varchar(1),
salary int,
super_id int,
branch_id int
);

create table branch(
branch_id int primary key,
branch_name varchar(40),
mgr_id int,
mgr_start_date date,
foreign key(mgr_id) references employee(emp_id) on delete set null
);

-- To alter or modify the table
alter table employee
add foreign key(branch_id) 
references branch (branch_id) 
on delete set null;

alter table employee
add foreign key(super_id) references employee(emp_id) on delete set null;

create table client(
client_id int primary key,
client_name varchar(40),
branch_id int,
foreign key(branch_id) references branch(branch_id) on delete set null
);

create table works_with(
emp_id int,
client_id int,
total_sales int,
primary key(emp_id, client_id),
foreign key(emp_id) references employee(emp_id) on delete cascade, 
foreign key(client_id) references client(client_id) on delete cascade
);

insert into employee values (100, 'David', 'Wallace', '1967-11-17', 'M', 250000, null, null);

insert into branch values (1, 'Corporate', '100', '2006-02-09');

update employee
set branch_id = 1
where emp_id = 100;

insert into employee values (101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);














