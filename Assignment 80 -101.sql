#########################################################################
####################### AGGREGATIONS USING GROUP BY , ORDER BY ###################
##################################################################################

#Assignment 80 , Generate report showing monthly sale for each month.
use retail;

select * from tran_dtl td 


select month(tran_dt),sum(qty) as monthy_sale from tran_dtl
group by month(tran_dt);

#Assignment 81 , Generate report showing total amount of sales for transaction 
#date 2019-08-12.


select * from tran_dtl td 

select date(tran_dt), sum(amt) as total_amount_sale 
from tran_dtl
where date(tran_dt) = "2019-08-12"
group by  date(tran_dt);


#Assignment 82 ,Generate report showing total number of managers for each department.

select count(emp_no) as no_of_managers_for_each_dept, dept_no 
from dept_manager dm 
group by dept_no 



#Assignment 83 , Generate report showing total salary withdrawn from company for 
#each employee.

select * from salaries s 


select sum(salary) as total_salary_for_each_employee, emp_no
from salaries s 
group by emp_no ;



#Assignment 84 ,Generate report showing only those employees from above report 
#who have withdrawn total salary in between 400000 to 500000 and arrange 
#them in descending order by salary withdrawn.


select * from salaries s 


select emp_no as have_salaries_between_4l_to_5l, sum(salary) as total_salary
from salaries s 
group by emp_no
having sum(salary) between 400000 and 500000 ;



#Assignment 85 , Generate report showing total number of transactions per member per month.
use retail;
show tables

select * from tran_hdr th 


select count(tran_id) as total_no_of_transactions, month(tran_dt),member_id 
from tran_hdr 
group by month(tran_dt), member_id 


#Assignment 86 , Generate report showing total number of transaction per month per store
# in ascending order.

select * from tran_hdr th 

select count(tran_id) as total_no_of_tran , month(tran_dt),store_id 
from tran_hdr
group by month(tran_dt), store_id
order by month(tran_dt) asc, store_id asc;


#Assignment 87 , Generate report showing number of members registered per month per store.


select * from  tran_hdr th 

select count(member_id) as no_of_reg_members ,month(tran_dt), store_id 
from tran_hdr th 
group by month(tran_dt), store_id ;

#Assignment 88 ,Generate report showing category wise number of products having price less than 1.

select * from product p 

select  count(product_id) as no_of_product_having_mrp_less_than_1, category 
from product p 
where price <1
group by category ;

#Assignment 89 , Generate report showing total number of transactions per member per store.

select * from tran_hdr th 

select count(tran_id) as total_number_of_transactios, member_id , store_id 
from tran_hdr th 
group by member_id , store_id ;

#Assignment 90 , Generate report showing no. of members registered per store.

select * from tran_hdr th 

select count(member_id) as no_of_members_per_store, store_id 
from tran_hdr th 
group by store_id ;


#Assignment 91 , Generate report showing no. of members registered per store per month.
select * from tran_hdr th 

select count(member_id) as no_of_members_per_store , store_id, month(tran_dt)
from tran_hdr th 
group by store_id , month(tran_dt);


#Assignment 92 , Generate report showing no. of products per category.
select * from product p ;

select count(product_id) as no_of_products_per_category , category 
from product p 
group by category ;


#Assignment 93 , Generate report showing no. of transaction per member.
select * from tran_hdr th 

select count(tran_id) as no_of_transactions_per_member , member_id
from tran_hdr th 
group by member_id ;



#Assignment 94 , Generate report showing no. of transaction per store.

select * from tran_hdr th 

select count(tran_id) as no_of_transactions_per_store , store_id 
from tran_hdr th 
group by store_id ;



#Assignment 95 , Generate report showing no. of transaction per member per store.

select * from tran_hdr th 

select count(tran_id)as no_of_transactions_per_mem , member_id ,store_id 
from tran_hdr th 
group by member_id ,store_id ;


#Assignment 96 , Generate report showing no. of transaction per member per month .

select * from tran_hdr th

select count(tran_id) as no_of_transactions_per_member_per_month, member_id, month(tran_dt)
from tran_hdr th 
group by member_id , month(tran_dt);



#Assignment 97 , Generate report showing no.of transaction per store per month.

select * from tran_hdr th 

select count(tran_id) as no_of_transactons_per_store_per_month , store_id, month(tran_dt)
from tran_hdr th 
group by store_id , month(tran_dt);


#Assignment 98 , Generate report showing no. of transaction per member per store per month.

select * from tran_hdr th 

select count(tran_id) as no_of_transactions_per_mem_per_store_per_month , member_id ,store_id , month(tran_dt)
from tran_hdr th 
group by  member_id ,store_id , month(tran_dt);


#Assignment 99 , Generate report showing no. of transaction per store in descending order.
select * from tran_hdr th 

select count(tran_id) as no_of_transactions_per_store_desc , store_id 
from tran_hdr th 
group by store_id 
order by store_id desc;


#Assignment 100 , Generate report showing total number of transaction in which product 17 was purchased.
select * from tran_dtl td 

select count(tran_id) as total_number_of_transactions_for_product_17 , product_id 
from tran_dtl td 
where product_id = "17";


#Assignment 101 , Generate report showing total number of transaction per month.

select * from tran_dtl td 

select count(tran_id) as total_no_of_transactions_per_month, month(tran_dt)
from tran_dtl td 
group by month(tran_dt);


##########################################  END  ###############################################