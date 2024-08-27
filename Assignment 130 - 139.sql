################################################################################################################################33
########################################## TRANSPOSE DATA ###################################################################


# ASSIGNMENT 130 , Generate report showing number of transactions per store for each member.
#(member_id,store1_tran,store2_tran,store3_tran)



#2 EXECUTION
select sub.member_id,
MAX(case when sub.store_id = 1 then sub.stores_tran end) as store1_tran,
MAX(case when sub.store_id = 2 then sub.stores_tran end) as store2_tran,
MAX(case when sub.store_id = 3 then sub.stores_tran end) as store3_tran
from
#1 ST EXECUTION
(select th.member_id, th.store_id, count(th.tran_id) as stores_tran
from tran_hdr th
group by member_id, th.store_id)sub
group by sub.member_id;


# Assignment 131 , Generate report showing number of product per category according to product classification.
#(category,high_value,med_value,low_value,total_products)

select 
	p.category,
	sum(case when p.price > 100 then 1 else 0 end) as high_value,
	sum(case when p.price <= 100 and p.price > 50 then 1 else 0 end)as med_value,
	sum(case when p.price <= 50 then 1 else 0 end)as low_value,
	count(*) as total_products
from 
product p 

group by
p.category ;


################### OR ############################


USE retail;
SELECT category,
MAX(price) OVER(PARTITION BY category) AS high_value,
(MAX(price) OVER(PARTITION BY category)+MIN(price) OVER(PARTITION BY category))/2
 AS med_value,
MIN(price) OVER(PARTITION BY category)AS low_value,
COUNT(product_id) OVER(PARTITION BY category) AS total_products
FROM product;




desc product 



##ASSIGNMENT 132 , Generate report showing number of transactions per member for each quarter.
#(member_id,qtr1,qtr2,qtr3,qtr4,total_tran)
use retail,

select sub.member_id,
max(case when sub.qtr='Q1' then sub.total_tran end)as qtr1,
max(case when sub.qtr= 'Q2' then sub.total_tran end) as qtr2,
max(case when sub.qtr= 'Q3' then sub.total_tran end)as qtr3,
max(case when sub.qtr= 'Q4' then sub.total_tran end) as qtr4,
sub2.total_tran
from 
(SELECT 
    member_id,
    CASE 
        WHEN MONTH(tran_dt) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN MONTH(tran_dt) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN MONTH(tran_dt) BETWEEN 7 AND 9 THEN 'Q3'
        WHEN MONTH(tran_dt) BETWEEN 10 AND 12 THEN 'Q4'
    END AS qtr,
    COUNT(tran_id) AS total_tran
FROM 
    tran_hdr
group by member_id, qtr)sub  
left join 
(select member_id, count(tran_id) as total_tran
from tran_hdr th 
group by member_id)sub2 on sub.member_id = sub2.member_id
group by member_id;



# Assignment 133 , Generate report showing number of transactions per store per quarter. 
#(store_id,store_city,qtr1,qtr2,qtr,qtr4,total_tran)


use retail;

select sub.store_id,
max(case when sub.qtr= "Q1" then sub.total_tran end )as qtr1,
max(case when sub.qtr= "Q2" then sub.total_tran end )as qtr2,
max(case when sub.qtr= "Q3" then sub.total_tran end )as qtr3,
max(case when sub.qtr= "Q4" then sub.total_tran end )as qtr4,
sub2.total_tran
from 
(select store_id ,
case 
	when  month(tran_dt) between 1 and 3 then 'Q1'
	when month(tran_dt) between 4 and 6 then 'Q2'
	when month(tran_dt) between 7 and 9 then 'Q3'
	when month(tran_dt) between 10 and 12 then 'Q4'
end as qtr,
count(tran_id) as total_tran
from 
	tran_hdr
group by store_id, qtr) as sub
left join 
 (select store_id, count(tran_id) as total_tran 
 from tran_hdr th 
 group by store_id ) as sub2 on sub.store_id = sub2.store_id
group by store_id;
	
	
	
#Assignment 134 , Generate report showing number of transactions per product per store.
# (product_id,description,st1_tran,st2_tran,st3_tran)


select sub.product_id, sub.description,
MAX(case when sub.store_id = 1 then trans end) as 'st1_trans',
MAX(case when sub.store_id = 2 then trans end) as 'st2_trans',
MAX(case when sub.store_id =3 then trans end) as 'st3_trans'
from 
(select td.product_id, p.description, th.store_id, count(td.tran_id) as trans
from tran_dtl td 
join tran_hdr th on td.tran_id = th.tran_id 
join product p on td.product_id = p.product_id 
group by td.product_id , th.store_id ) as sub
group by sub.product_id;



#Assignment 135 , Generate report showing total quantity for each product per store.
#(product_id,description,st1_qty,st2_qty,st3_qty,total_qty)


select sub.product_id,
MAX(case when sub.store_id = 1 then total_qty end) as "st1_qty",
MAX(case when sub.store_id = 2 then total_qty end) as "st2_qty",
MAX(case when sub.store_id = 3 then total_qty end) as "st3_qty"
from 
(select p.product_id, p.description, th.store_id, count(td.qty) as total_qty
from tran_dtl td 
join tran_hdr th on td.tran_id = th.tran_id 
join product p on td.product_id = p.product_id 
group by p.product_id, th.store_id ) as sub 
group by sub.product_id;



#Assignment 136, Generate report showing total quantity per category per store.(category,st1_qty,st2_qty,st3_qty)



select sub.category,
MAX(case when sub.store_id = 1 then total_qty_per_store end) as "st1_qt",
MAX(case when sub.store_id = 2 then total_qty_per_store end) as "st2_qt",
MAX(case when sub.store_id = 3 then total_qty_per_store end) as "st3_qt"
from
(select p.category, th.store_id,  count(td.qty) as total_qty_per_store
from tran_dtl td 
join tran_hdr th on td.tran_id = th.tran_id 
join product p on td.product_id = p.product_id 
group by  p.category, th.store_id) as sub   
group by sub.category;


#Assigment 137, Generate report showing number of members registered per store per quarter.(store_id,store_city,qtr1_reg,qtr2_reg,qtr3_reg,qtr4_reg)



select sub.store_id,sub.store_city,
MAX(case when sub.qtr = 'Q1' then no_of_members_registered end) as qtr1_reg,
MAX(case when sub.qtr = 'Q2' then no_of_members_registered end) as qtr2_reg,
MAX(case when sub.qtr = 'Q3' then no_of_members_registered end) as qtr3_reg,
MAX(case when sub.qtr = 'Q4' then no_of_members_registered end) as qtr4_reg
from 
(select th.store_id, s.store_city,
case 
	when  month(m.reg_date) between 1 and 3 then 'Q1'
	when month(m.reg_date) between 4 and 6 then 'Q2'
	when month(m.reg_date) between 7 and 9 then 'Q3'
	when month(m.reg_date) between 10 and 12 then 'Q4'
end as qtr,
count(m.member_id ) as no_of_members_registered
from tran_hdr th 
join store s on th.store_id = s.store_id 
join `member` m  on th.member_id  = m.member_id  
group by th.store_id , s.store_city, qtr) as sub
group by sub.store_id, sub.store_city;


#Assignment 138, Generate report showing total_sale for each category per store.
#(category,st1_sale,st2_salest3_sale,total_sale)



select sub.category,
MAX(case when sub.store_id = '1' then total_sale end ) as st1_sale,
MAX(case when sub.store_id = '2' then total_sale end )as st2_sale,
MAX(case when sub.store_id = '3' then total_sale end )as st3_sale,
MAX(total_sale) as total_sale

from 
(select p.category,th.store_id, sum(td.amt) as total_sale
from tran_dtl td 
join tran_hdr th on td.tran_id = th.tran_id 
join product p on td.product_id = p.product_id 
group by p.category ,th.store_id)as sub
group by sub.category,sub.store_id;



 
select * from tran_dtl td 
select * from tran_hdr th 
select * from `member` m 
select * from product p 
select * from store s 
############################################################## END ##################################################



   






select * from tran_dtl td 









select * from `member` m 
select * from tran_dtl td 
select * from tran_hdr th 



