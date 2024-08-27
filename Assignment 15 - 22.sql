#ASSIGNMENT 15 ,Create new column in student table for standard.
show TABLES

desc STUD

alter table stud 
ADD column STANDARD VARCHAR(2);

desc stud 


#ASSIGNMENT 16 , Create new columns perct_of_marks in mark table.

create table MARKS(
SUBJECT_name varchar (200),
Total_marks int
);


alter table marks
add column perct_marks int after column Total_marks;

desc marks 


#Assignment 17 , Create new column donor address in donor table.

show tables

alter table donor_list 
add column donor_adress varchar(200);

describe donor_list 


#Assignment 18 ,  Rename standard column from student table to student_std     
show tables

describe student

alter table student 
add column standard varchar(10);


describe student


alter table student 
RENAME column standard TO student_std;




#Assignment 19 , Rename perct_of_marks from marks table to percent_marks.

show tables

alter table marks 
add column perct_of_marks int;


alter table marks 
	rename column perct_of_marks to perct_marks;

desc marks 

#Assignment 20 , Rename donor address column from donor table to permanent_address.

show tables

desc donor_list

alter table donor_list 
	rename column donor_adress to permanant_address;


#Assignment 21 , Drop permanent_address column
alter table donor_list 
	drop column permanant_address;

desc donor_list ;

#Assignment 22 , Drop donor table

drop table donor_list;

show tables;

#ASSIGNMENT 23 , Display emp_id, first name for employees on the report

create table employees(
emp_id int (20),
first_name varchar(200),
last_name varchar (200));


desc employees 

insert into employees(emp_id, first_name, last_name)
values
(1, "ganesh", "surle"),
(2, "kiran", "biradar"),
(3, "Nishad", "Deshpande"),
(4, "Nikhil", "kumbhar");

select emp_id, first_name from employees;



#Assignment 24 , Generate a report that shows all products all columns
show tables

select * from products p 



#Assignment 25 , Generate a report that shows product_id, description, category for all products belonging to any two categories

select distinct  product_id, description, product_category
from products
where product_category = "suppliments";


#Assignment 26 , Generate report showing tran_id, member_id, store_id and tran_dt from tran_hdr table.
show tables

desc tran_hdr ;

alter table tran_hdr 
add column tran_dt varchar (20);

insert into tran_hdr(TRAN_ID, MEMBER_ID, STORE_ID, tran_dt)
values
(101, 1011, 10111, "10-2-24"),
(102, 1022, 10222, "5-9-24"),
(103, 1033, 10333, "8-9-24");

select TRAN_ID , MEMBER_ID , STORE_ID , tran_dt from tran_hdr;


#Assignment 27 , Insert 3 products to product table with description field as empty

show tables

select * from products  


insert into products(product_id, description , product_category  )
values
(125, null, "painkiller"),
(895, null, "moov"),
(785, null, "anabolics");


#Assignment 28 , Generate a report that shows product_id, description for all products.

select product_id, description from products;

#Assignment 29 , Generate report showing all details of employees table.

show tables

select * from employees 


#Assignment 30 , Generate report showing all details of salaries table.

create table salaries(
emplyee_name  varchar(200),
employee_sirname varchar(200),
employee_id int(20),
employee_salary int(100));

select * from salaries;


insert into salaries (emplyee_name, employee_sirname, employee_id, employee_salary)
values
("Ganesh", "surle", 101, 50000),
("kiran", "biradar", 105, 60000),
("nishad", "deshpande", 109, 34000),
("vivek", "rokade", 110, 7000);

#Assignment 31 , Generate report showing all details of departments table.

create table department(
department_id int(20),
department_name varchar(200),
departent_role varchar(200)
);

insert into department (department_id, department_name, departent_role)
values
(1, "computer", "computer engineering"),
(2, "mechanical", "mechanical engineering"),
(3, "civil", "civil engineering"),
(4, "electrical", "electrical engineering");

select * from department 

#ASSIGNMENT 32 , Generate report showing all details of dept_emp table
select * from employees 

desc employees 

#ASSIGNMENT NO 33 , Generate report showing all details of titles table.

create table TITLES(
MOVIE_NAME VARCHAR(200),
MOVIE_ID INT(20),
MOVIE_GENER VARCHAR(200));

desc TITLES

insert into TITLES(MOVIE_NAME, MOVIE_ID, MOVIE_GENER)
values
("AVATAR", 52, "FICTION"),
("THE FOUNDER", 45, "BIOPIC"),
("FORD VS FERRRI", 88, "SPORTS"),
("EVIL DEAD", 78, "HORROR");


select * from titles 

#Assignment 34 , Generate report showing member_id,first_name and last_name from member  table.
show tables

create table members (
member_id int (20),
first_name varchar(200),
last_name varchar(200));

insert into members (member_id, first_name, last_name)
values
(1, "ganesh", "surle"),
(2, "nishd", "dehpandu"),
(3, "kiran", "biradar");

select member_id, first_name, last_name from members ;


#Assignment 35 , Generate report showing member_id , reg_date and reg_store from member table.

alter table members 
add column reg_date date,
add column reg_store varchar(20);

desc members 

INSERT INTO members (reg_date, reg_store)
VALUES
('2001-08-14', 'satara'),
('2002-06-12', 'pune'),
('2003-09-13', 'bangalore');


select member_id, reg_date, reg_store
from members 


#Assignment 36 , Generate report showing product_id , description,price from product table.

alter table products 
add column product_price int(200);

update products 
set product_price = 
case 
	when product_id = 101 then 10
	when product_id = 102 then 20
	when product_id = 103 then 30
	else 0
end
where product_price is null ;

select product_id, description, product_price 
from products;

#Assignment 37 , Generate report showing tran_id , qty and amt from tran _dtl table.
desc tran_hdr 

alter table tran_hdr
add column qty int(20),
add column amt int(20);

desc tran_hdr 


UPDATE tran_hdr 
SET qty = 
    CASE TRAN_ID 
        WHEN 1 THEN 78
        WHEN 2 THEN 85
        WHEN 3 THEN 41
    END, 
    amt = 
    CASE TRAN_ID 
        WHEN 1 THEN 85
        WHEN 2 THEN 75
        WHEN 3 THEN 12
    END 
WHERE TRAN_ID IN (1, 2, 3);

select tran_id, qty, amt from tran_hdr;

#Assignment 38, Generate a report with all members who stay in district id 19

create  table district(
member_name varchar (200),
district_id int (20));

desc district 

insert into district (member_name, district_id)
values
("ganesh", 19),
("kiran", 45),
("harish", 19),
("nishad", 44),
("nikhil", 19);

select member_name 
from district 
where district_id = 19;


#Assignment 39 ,  Generate a report with all members who member id is less than 1500


alter table district 
add column member_id int (20);

UPDATE district 
SET member_id = 
    CASE member_name
        WHEN 'ganesh' THEN 1
        WHEN 'kiran' THEN 2
        WHEN 'nishd' THEN 3
        WHEN 'nikhil' THEN 4
        WHEN 'harish' THEN 5
    END;




select member_name 
from district 
where member_id < 1500;


#Assignment 40 , Generate a report with all members who member id is greater than 1500
 
insert into district(member_name, member_id, district_id )
values
("jack", 2005, 45),
("raghav", 4885, 55),
("ryan", 7415, 98);

select member_name
from district 
where member_id > 1500;

#Assignment #41 Generate a report with all members who have registered in store no 1


alter table district 
add column STORE VARCHAR (200);



update district
set STORE = 
		case MEMBER_NAME
			when 'GANESH' then 'STORE1'
			when 'NIKHIL' then 'STORE2'
			when 'NISHAD' then 'STORE1'
			when 'KIRAN' then 'STORE2'
		end;
	
	select * from district 
	
	select MEMBER_NAME
	from district 
	where STORE = 'STORE1';

#Assignment 42 , Generate a report with all members who are not regeistered in store 2


show tables

select * from member_data md 

select member_id, f_name, l_name, store_id
from member_data md 
where store_id != 2;


#Assignment 43 , Generate a report with all members who registered in store (1,2)

select member_id, f_name, l_name, store_id 
from member_data md 
where store_id  = 1 or store_id = 2;

#Assignment 44 , Generate a report with all members who's first name start with "Ja"

select * 
from member_data md 
where f_name like "ja%";


#Assignment 45 , Generate a report with all members who's first name does not start with "Ja"
select *
from member_data md 
where f_name not like "ja%";


#Assignment 46, Generate a report with all members who's first name end with "a"
select * 
from member_data md 
where f_name like '%a';



#Assignment 47, Generate report showing product table with one added
# column prod_cat that classifies product with average price of all products.
#(greater & smaller than avg_price )









































