######################################################################################################3
######################################### sub query ##############################################

#Assignment 102 , Generate report showing all details of product which had min price.
 #(product_id,description,category,price)

select * from product p 

select product_id ,description ,category ,price 
from product p 
where price in (select min(price) from product);


#Assignment 103 , Generate report showing details of all products from category which had least 
#number of products. (product_id,description,category,price)

select * from product p ;


-- Generate report showing details of all products from category which had least number of products.
--  (product_id,description,category,price)


USE retail;
SELECT product_id ,description ,category ,price 
FROM product 
WHERE category  in (
     SELECT category  FROM product 
     GROUP BY category 
     HAVING COUNT(*) = 
         (SELECT MIN(cat.cnt_product) AS min 
         FROM (SELECT category,COUNT(*) AS cnt_product FROM product p GROUP BY category) cat
        )
       );
	
#################################################
	SELECT category, COUNT(*) AS cnt_product 
FROM product 
GROUP BY category;

delete from product p 
where  product_id = "16";

select * from product p 


#Assignment 104 , Generate report showing tran_hdr table only for those members who had 
#registered in store 1.

select * from tran_hdr th 
where member_id in(select member_id from product p
                   where store_id = "1");
                  
                  
#Assignment 105 , Generate report showing tran_dtl table only for products belonging to 
#‘grocery’category.
 
select * from tran_dtl td 
where product_id in(select product_id from product p
                    where category ="grocery");
                   
                   
#Assignment 106 , Generate report showing tran_dtl table only for those products which had ‘chee’ in their description.
select * from tran_dtl td 
where product_id  in (select product_id from product where description like '%chee%');


select * from tran_dtl td 
select * from product p 


#Assignment 107 , Generate report showing number of transaction for each member in which he/she
#had purchased ‘bread’.(member_id,num_tran)


select member_id , count(tran_id) as num_of_transactions
from tran_hdr
where tran_id  in (select tran_id from tran_dtl td 
                     where product_id in (select product_id
                    from product p where description like '%bread%'))
                    group by member_id ;
#####
select * from tran_hdr th 
select * from product p 
select * from tran_dtl td 




# Assignment 108 , Generate report showing member details for those members who had 
#purchased ‘milk’ and ‘apple’ in single transaction. (member_id,first_name,last_name)

SELECT member_id, first_name, last_name 
FROM `member` m 
WHERE store_id IN (
    SELECT store_id 
    FROM tran_hdr th
    WHERE tran_id IN (
        SELECT tran_id 
        FROM tran_dtl
        WHERE product_id IN (
            SELECT product_id 
            FROM product
            WHERE description LIKE '%milk%' 
            or description LIKE '%apple%'
        )
    )
)
GROUP BY member_id;


#Assignment 109 , Generate report showing tran-hdr table only for those members who had registered in the month of ‘May’ of any year.

select * from tran_hdr th 
where member_id in (select member_id from `member` m where month(reg_date) = 5); 



#Assignment 110 , Generate report showing tran_hdr table only for those transaction in which at 
#least one product starting from ‘L’ is purchased.


select * from tran_hdr th
where tran_id in (select tran_id from tran_dtl td 
                   where product_id in (select product_id from product p
                   where description like 'l%' ) );
                  
                  
#Assignment 111 , Generate report showing no. of transactions per member in which he had not purchased 
#any product from ‘dairy’category.
                 
select count(tran_id),member_id  from tran_hdr th
where tran_id  in (select tran_id from tran_dtl td 
                   where product_id in (select product_id from product
                   where category not like '%dairy%' ))
                  group by member_id;

                 
 ##################################### END ###############################################################                

 
   


 
