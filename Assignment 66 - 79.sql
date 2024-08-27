##########################################################
################Aggregations using functions###############


#Assignment 66 ,Generate report showing total number of employees.

select count(*) as number_of_employees 
from employees;


#Assignment 67 , Generate report showing total number of transactions at store 2.
use retail

select 
count(store_id = 2) as number_of_transactions
from tran_hdr;

select * from tran_hdr
#Assignment 68 , Generate report showing average price for baked goods category.

select * from product


select avg(price) as baked_goods from product
where category = "baked goods";



#Assignment 69 , Generate report showing number of employees born in year 1960.
use new

show tables

select COUNT(BIRTH_YEAR) as EMPLOYEES_IN_1960
from employees
where birth_year = "1960";

##############
alter table employees 
add column birth_year int;


update employees 
set birth_year = ("2001")
where birth_year is null;


update employees 
set birth_year = ("1960")
where emp_id in(2,7,3,8);


update employees 
set birth_year=("2002")
where emp_id in(5);

select * from employees

#########

#Assignment 70 ,Generate report showing min price for beverages category.

select * from product 

select count(category) as beverages_prices
from product
where category  = ("beverages");


#Assignment 71 , Generate report showing max price for frozen category.

select * from product


 select max(price) as max_price_for_forzencategory
 from product
 where category ="frozen";


#Assignment 72 , Generate report showing total amount of sales for transaction 
#date 2019-08-12.

select * from tran_hdr

select sum(amt) as transactions_on_aug
from tran_hdr
where tran_dt ="1-8-23";
 
#######
update tran_hdr 
set qty = ("5") , amt = ("5000")

where TRAN_ID in (101, 102, 103, 104);


update tran_hdr 
set qty = ("7") , amt = ("5700")

where TRAN_ID in (106, 107, 108, 109);

update tran_hdr 
set qty = ("10") , amt = ("55700")

where TRAN_ID in (105);


select * from tran_hdr

#Assignment 73 , Generate report showing average price of all products.

select avg(price) as avg_price_of_product
from product


#Assignment 74 , Generate report showing total number of members.
select * from member_data md 

select count(member_id) as total_number_of_members
from member_data md 


#Assignment 75 , Generate report showing total number of employees.
select * from employees e 


select count(*) as total_number_of_employees
from employees e 



# 76 , Generate report showing total salary withdrawn by all employees.
select * from employees e

select sum(salary) as total_salary_withdrawn
from employees



# 77 , Generate report showing average salary of employees.

select * from employees

select avg(salary) as average_salary
from employees


# 78 , Generate report showing maximum salary withdrawn.

select * from employees 

select max(salary) as max_salary_withdrawn
from employees

###########
update employees
set salary = "100000"
where emp_id = "1";
#########

alter table employees 
add column salary int;

update employees 
set salary = ("15000")
where emp_id in (1,2,5);

update employees 
set salary = ("25000")
where emp_id in (3,4,6,7,8);



#Assignment 79 , Generate report showing minimum salary withdrawn.

select * from employees

select min(salary) as min_salary_withdrawn
from employees e 










