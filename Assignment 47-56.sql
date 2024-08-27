#Assignment 47, Generate report showing product table with one added
# column prod_cat that classifies product with average price of all products.
#(greater & smaller than avg_price )


select *,
	case 
		when price>(select avg(price) from product) then 'above avgprice'
		else 'below avgprice'
	end as prod_cat
from product;






#Assignment 48 , Generate report showing classification of member based on number of
# products(in quantity) purchased by him (member_id,total_qty_prod,classification)

use retail;

describe tran_dtl ;
describe tran_hdr_bd ;

select tran_hdr.member_id  as member_id , tran_dtl.qty  as TOTAL_QTY_PROD,
case 
	when tran_dtl.qty >= 5  then "MAXIMUM PURCHASED LIMIT REACHED"
	when tran_dtl.qty >=4 then "4/5 PURCHASED"
	when tran_dtl.qty >=3 then "3/5 PURCHASED"
	else "MINIMUM QTY PURCHASED"
end as CLASSIFICATION
from tran_hdr
join tran_dtl on tran_hdr.tran_id = tran_dtl.tran_id ;



describe tran_hdr



#assignment 49 , Generate report showing tran_dtl table with one additional column quarter showing 
#quarter of tran_dt.

desc tran_dtl ;

select * from tran_dtl td 

select *,
case
	when month(tran_dt) between 1 and 3 then 'first quarter'
	when month(tran_dt) between 4 and 6 then 'second quarter'
	when month(tran_dt) between 7 and 9 then 'third quarter'
	else 'fourth quarter'
end as quarter
from tran_dtl;


#Assignment 50 , Generate report showing number of transaction per quarter (qtr_name,num_tran)

select 
	case 
		when month(tran_dt) between 1 and 3 then 'q1'
		when month(tran_dt) between 4 and 6 then 'q2'
		when month(tran_dt) between 7 and 9 then 'q3'
		when month(tran_dt) between 10 and 12 then 'q4'
	end as qtr_name,
	count(*) as num_tran
from 
	tran_dtl
group by
	case
		when month(tran_dt) between 1 and 3 then 'q1'
		when month(tran_dt) between 4 and 6 then 'q2'
		when month(tran_dt) between 7 and 9 then 'q3'
		when month(tran_dt) between 10 and 12 then 'q4'
	 end;

	
#Assignment 51 , Generate report showing number of transaction per store per quarter 
#(store_id,store_city,qtr,num_tran)
	
select store_id,
	case
		when month(tran_dt) between 1 and 3 then 'q1'
		when month(tran_dt) between 4 and 6 then 'q2'
		when month(tran_dt) between 7 and 9 then 'q3'
		when month(tran_dt) between 9 and 12 then 'q4'
	end as qtr,
	count(*)as num_tran
	from tran_hdr
	group by store_id ,qtr;


#Assignment 52 , Generate report showing number of transaction per member per quarter 
#(member_id,qtr,num_tran)

select member_id,
	case 
		when month(tran_dt) between 1 and 3 then 'q1'
		when month(tran_dt) between 4 and 6 then 'q2'
		when month(tran_dt) between 7 and 9 then 'q3'
		when month(tran_dt) between 10 and 13 then 'q4'
	end as qtr,
	
	count(*) as num_tran
	from tran_hdr
	group by member_id, qtr;


#Assignment 53 ,Generate report showing number of transaction per member per store per quarter.
# (member_id,store_id,qtr,num_tran)

select member_id,
       store_id,
	case
		when month(tran_dt) between 1 and 3 then 'q1'
		when month(tran_dt) between 4 and 6 then 'q2'
		when month(tran_dt) between 7 and 9 then 'q3'
		when month(tran_dt) between 10 and 12 then 'q4'
	end as qtr,
	
	count(*) as num_tran
	from tran_hdr
	group by member_id, store_id, qtr;

#Assignment 54, Generate report showing total_sale for each product with product classification 
#according to total_sale. (product_id,description,total_sale,classification).

select td.product_id ,
	   p.description ,
count(*) as total_sale,
	case 
		when count(*) <= 250 then 'low'
		when count(*) <= 270 then 'medium'
		when count(*) > 270 then 'high'
	end as classification
	
	from tran_dtl td
	join product p on td.product_id = p.product_id  
	group by td.product_id , p.description ;
	
#Assignment 55 , Generate report showing total sale for each product each qtr 
#(product_id,description,qtr,total_sale)

select p.description ,
       td.product_id ,
       
       case 
       	when month(td.tran_dt) between 1 and 3 then 'q1'
       	when month(td.tran_dt) between 4 and 6 then 'q2'
       	when month(td.tran_dt) between 7 and 9 then 'q3'
       	when month(td.tran_dt) between 10 and 12 then 'q4'
       	end as qtr,
       	count(*) as total_sale
       	from tran_dtl td 
       	join product p on td.product_id = p.product_id
       	group by td.product_id ,qtr;
       
       
 #assignment 56 , Generate report showing total sale for each category each qtr 
 #(category,qtr,total_sale)
       
select 
	P.category,
	case
		when month(td.tran_dt) between 1 and 3 then 'q1'
		when month(td.tran_dt) between 4 and 6 then 'q2'
		when month(td.tran_dt) between 7 and 9 then 'q3'
		when month(td.tran_dt) between 10 and 12 then 'q4'
		end as qtr,
		
		count(*) as total_sale
		from tran_dtl td 
		join product p  on td.product_id = p.product_id 
		group by p.category ,qtr;
	

       
       
       
       
       
       





	


		
		

	












