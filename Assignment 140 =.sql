############################################################################################################################
##################################################### WINDOW FUNCTION ######################################################


#Assignment 140 ,Generate report showing product _id,description,month,monthly_sale,previous_month_sale.

SELECT *,
       LAG(monthly_sale) OVER(PARTITION BY PRODUCT_ID ORDER BY PRODUCT_ID) as PREVIOUS_MONTH_SALE
FROM
    (SELECT p.product_id, p.description, MONTH(td.tran_dt) as month, SUM(td.amt) as monthly_sale 
     FROM tran_dtl td 
     JOIN product p ON td.product_id = p.product_id 
     GROUP BY p.product_id, month) as sub;
    
    
    #Assignment 141 , Generate report showing product _id,description,month,monthly_sale,sale_upto_this_month.

  select sub.*,
  rank()  over(partition by sub.product_id order by sub.month) as sale_up_to_this_month
  from 
 (select td.product_id, p.description, month(td.tran_dt) as month , sum(td.amt) as  total_sale
 from tran_dtl td 
 join product p on td.product_id = p.product_id 
 group by td.product_id , month) as sub
 
 
 
 #Assignment 142 , Generate report showing store_id,month,no_transactions,rank_month.
 #(highest transactions-Rank 1)
 
 select sub.*,
 rank() over (partition by sub.store_id order by sub.no_of_transactions desc) as rank_month
 from
(select th.store_id, month(th.tran_dt) as month, count(th.tran_id) no_of_transactions
from tran_hdr th 
group by th.store_id, month) as sub
 

#Assignment 143 , Generate report showing store_id,month,total_monthly_sale,rank_month.(highest sale – Rank  1)


select sub.*,
rank() over(partition by sub.store_id order by sub.total_monthly_sale desc) as rank_month
from
(select th.store_id, month(th.tran_dt) as month , sum(td.amt) as total_monthly_sale
from tran_hdr th 
join tran_dtl td on th.tran_id =td.tran_id 
group by th.store_id , month) as sub


#Assignment 144 , Generate report showing product rank for member_id 1010 (member_id,product_id,total_sale,rank_product)


select sub.*, 
rank() over(order by sub.total_sale desc) as rank_product

from
(select th.member_id , td.product_id, sum(td.amt) as total_sale
from tran_hdr th 
join tran_dtl td on th.tran_id = td.tran_id 
group by th.member_id , td.product_id ) as sub


#Assignment 145 , Generate report showing member_id,month,total_sale,last_3 month_total sale.

select sub2.member_id, sub2.month, sub2.total_sale, sum(sub2.total_sale)over(partition by sub2.member_id) as month_total_sale
from
(select sub.*, 
rank() over(partition by sub.member_id order by  sub.month desc) as rnk
from 
(select th.member_id, month(th.tran_dt) as month , sum(td.amt) as total_sale
from tran_hdr th 
join tran_dtl td on th.tran_id =td.tran_id 
group by th.member_id , month) as sub)as sub2


    
#Assignment 146 , Generate report showing store_id,month,total_sale,prev_3 month_avg sale.

select sub.*,
avg(sub.total_sale) over(partition by sub.store_id order by SUB.STORE_ID, SUB.month
rows between 3 preceding and 1 preceding) as avg_sale_of_prev_3_month
from
(select th.store_id, month(th.tran_dt) as month, sum(td.amt) as total_sale 
from tran_hdr th 
join tran_dtl td  on td.tran_id = th.tran_id
group by th.store_id , month) as sub




#Assignment 147 , Generate report showing top 3 products purchased per store according to quantity sold.
#(store_id,product_id,description,total_qty,product_rank)

select sub2.*
from 
(select sub.*,
rank() over(partition by sub.store_id  order by sub.total_qty desc) as product_rank
from 
(select th.store_id , p.product_id, p.description, sum(td.qty) as total_qty
from tran_hdr th
join tran_dtl td on th.tran_id = td.tran_id 
join product p on td.product_id  = p.product_id 
group by th.store_id , p.product_id) as sub)as sub2
where sub2.product_rank < 4;



#Assignment 148, Generate report showing rank for category according to total_amt of sale per store per month. 
#(store_id,month,category,total_sale,category_rank)


select sub.*,
rank() over (partition by sub.store_id order by sub.total_sale desc) as category_rank
from
(select th.store_id, p.category, sum(td.amt) as total_sale
from tran_hdr th
join tran_dtl td on th.tran_id = td.tran_id 
join product p on td.product_id  = p.product_id 
group by th.store_id , p.category ) as sub 


#Assignment 149 , Generate report showing max. and min purchased product_ids for each member.
#(member_id,max_purchase_prod_id,min_purchase_prod_id)

select sub2.member_id,
max(case when sub2.product_id = sub2.min then sub2.product_id end ) as min_purchase_id,
max(case when sub2.product_id = sub2.max then sub2.product_id end ) as max_purchase_id
from 
 (select sub.*,
 min(sub.total_count) over (partition by sub.member_id)as min,
 max(sub.total_count) over (partition by sub.member_id)as max
 from 
(select th.member_id , td.product_id, count(*) as total_count
from  
tran_hdr th 
join tran_dtl td on th.tran_id = td.tran_id 
group by th.member_id, td.product_id) as sub) as sub2
group by sub2.member_id;






