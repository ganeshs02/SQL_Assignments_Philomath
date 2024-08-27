###############################################################################################
########################################  Data Enrichment #####################################

#Assignment 112 , Generate report that shows number of transactions per member per store. 
#(Show member name and store city).


SELECT th.member_id, m.first_name, s.store_city, COUNT(th.tran_id) AS no_of_transactions
FROM tran_hdr th 
JOIN `member` m ON m.member_id = th.member_id 
JOIN store s ON th.store_id = s.store_id
GROUP BY th.member_id, m.first_name, s.store_city;





#Assignment 113 ,Generate a report that shows total product sale by month. show product_description, month and sale

select p.description, count(month(td.tran_dt))as no_of_transactions
from tran_dtl td 
join product p on td.product_id  = p.product_id 
group by p.description ;


#Assignment 114,Generate a report that shows total sale by member, product and month. (show member name, product description, month, total_sale on the report.)

select m.first_name, p.description, month(th.tran_dt) as month, sum(td.amt) as total_sale
from tran_hdr th  
join `member` m  on m.member_id  = th.member_id
join tran_dtl td on td.tran_id = th.tran_id 
join product p on p.product_id =td.product_id 
group by m.member_id , p.description, month(th.tran_dt);





#Assignment 115, Generate a report that shows employee number, first name, title, department name.

select e.emp_no, e.first_name, t.title, d.dept_name
from employees e 
join dept_emp de on de.emp_no = e.emp_no 
join titles t  on e.emp_no = t.emp_no 
join departments d on d.dept_no = de.dept_no ;


#Assignment 116 , Generate report that shows title wise number of employees in each department. 
#(show department number and department name)

select d.dept_no , d.dept_name, t.title, count(e.emp_no) no_of_employees
from departments d 
join dept_emp de  on d.dept_no  = de.dept_no 
join employees e  on de.emp_no = e.emp_no 
join titles t  on de.emp_no = t.emp_no 
group by d.dept_no , d.dept_name, t.title  ;



#Assignment 117 ,Generate report showing tran_ID,Product_id,product_description,tran_amt,tran_dt
use retail;

select td.tran_id, p.product_id, p.description, td.amt, td.tran_dt
from tran_dtl td 
join product p on td.product_id = p.product_id ;



#Assignment 118 , Generate report showing tran_ID,member_id,member_first_name,tran_dt

select th.tran_id, m.member_id, m.first_name, th.tran_dt
from tran_hdr th 
join `member` m on th.member_id = m.member_id 



#Assignment 119 , Generate report showing tran_ID,member_id,reg_store,tran_dt

select th.tran_id , m.member_id, s.store_city  as  reg_store, th.tran_dt
from tran_hdr th  
join `member` m on th.member_id = m.member_id 
join store s on th.store_id = s.store_id 


#Assignment 120 , Generate report showing total number of transactions per member(member_id,member_first_name,num_tran)

select m.member_id, m.first_name, count(th.tran_id) as number_of_transactions
from `member` m 
join tran_hdr th on m.member_id = th.member_id 
group by m.member_id;



#Assignment 121 , Generate report showing total number of transactions per store.(store_id,store_city,num_tran 
#in descending order)


select s.store_id, s.store_city, count(th.tran_id)
from store s 
join tran_hdr th on s.store_id = th.store_id 
group by s.store_id, s.store_city
order by count(th.tran_id) desc ;


#Assignment 122 , Generate report showing total quantity purchased for each product 
#(product_id,product_description,total_qty)

select p.product_id, p.description, count(td.tran_id) as total_qty
from product p 
join tran_dtl td on p.product_id = td.product_id
group by p.product_id 
order by count(td.tran_id) asc;



#Assignment 123 , Generate report showing total amount of purchase for each member (member_id,member_name,total_purchase_amt)

select m.member_id, m.first_name , sum(td.amt) as total_purchased_amt
from `member` m 
join tran_hdr th on th.member_id  = m.member_id 
join tran_dtl td on th.tran_id = td.tran_id 
group by m.member_id ;


select * from `member` m 
select * from tran_hdr th 


#Assignment 124 , Generate report showing total number of transactions per member per store.
#(member_id,store_id,store_name,num_tran)

select m.member_id, s.store_id, s.store_city , count(tran_id) as num_of_transactions
from `member` m 
join store s on m.store_id = s.store_id 
join tran_hdr th  on m.store_id  = th.store_id 
group by m.member_id , s.store_id , s.store_city ;


#Assignment 125 , Generate report showing total quantity purchased for each product each store.
#(product_id,description,store_id,store_city,qty)

select p.product_id, p.description, s.store_id, s.store_city, count(td.tran_id) as total_purchased_quantity
from product p 
join tran_dtl td on p.product_id = td.product_id 
join tran_hdr th on td.tran_id  = th.tran_id 
join store s on th.store_id  =s.store_id 
group by p.product_id , s.store_id, store_city ;


#Assignment 126 , Generate report showing total amount of purchase for each product each store.(category_name,total_amt)

select p.category, s.store_city, sum(td.amt) as total_amount_of_purchase_for_each_product
from product p 
join tran_dtl td on p.product_id = td.product_id
join tran_hdr th on td.tran_id  = th.tran_id 
join store s on th.store_id = s.store_id 
group by p.category , store_city;


#Assignment 127 , Generate report showing total amount of purchase for each category per  month.
#(category_name,month,total_amt)

select p.category, month(td.tran_dt) as month , sum(amt) as total_amount
from tran_dtl td 
join product p on p.product_id = td.product_id 
group by p.category, month(td.tran_dt) ;



#Assignment 128 , Generate report showing total amount of purchase for each member per category per month.
#(member_id,category,month,total_amt)

select m.member_id, p.category, month(td.tran_dt), sum(td.amt) as total_amount
from `member` m 
join tran_hdr th on m.member_id = th.member_id 
join tran_dtl td  on th.tran_id = td.tran_id 
join product p on td.product_id = p.product_id 
group by member_id , p.category , month(td.tran_dt);



# Assignment 129 , Generate report showing total number of transactions for each member which have total amount of \
#purchase >100 . (member_id,member_name,num_tran_100)

select m.member_id, m.first_name, td.tran_id , sum(td.amt) as purchase_above_100
from `member` m 
join tran_hdr th on m.member_id = th.member_id
join tran_dtl td on th.tran_id = td.tran_id
group by m.member_id , m.first_name , td.tran_id
having sum(td.amt) > 100;



#####################################################    End          ################################################












select * from tran_hdr th 
select * from product p 
select * from store s 
select * from `member` m 
select * from tran_dtl td 


###############
use employee

select * from employees e 
select * from departments d 
select * from dept_emp de 
select * from titles t 


USE retail

show tables
select * from `member` m 
select * from tran_hdr th 
select * from tran_dtl td 
select * from product p 
select * from store s

create table Store(
store_id int,
store_city varchar(20))



select distinct store_id from tran_hdr th 
