 #######Table with Drived column#######################

#Assignment 57 , Generate a report that shows all columns from member table and one additional 
#hard coded column: value - "online" , column name - "channel" 


select * , 'online' as channel from member;

#Assignmet 58 , Generate a report thet shows all colums from tran_dtl table plus
# one additional column: "cal_price" - calculated as amt/qty 

desc tran_dtl
select * , amt/qty as cal_price from tran_dtl;


# Assignment 62 , "Generate a report that shows all columns from product table 
#with one additional column - price_cat. Where price_cat is derived 
#1. low_price - less than 3 dollar
#2. mid_price - between 3 dollar to 5 dollar 
#3. high_price - greater than 5 dollar"
desc product 

select *, 
case 
	when price < 3 then 'low_price'
	when price between 3 and 5 then 'mid_price'
	when price > 5 then 'high_price'
end as price_cat
from product;

/*Assignment 63 , "Select all details from employee table with one additional 
column - ""age_cat""
1. young - age less than or equal to 30
2. medium - age between 30 to 50
3. old - age above 50"*/

use new;



desc employees 

alter table employees
add column age int;

update employees 
set age = case 
	when emp_id= 1 then 22
	when emp_id= 2 then 23
	when emp_id= 3 then 24
	when emp_id= 4 then 25
	else age 
end;

update employees
set age = null
where emp_id is null;

delete from employees 
where age is null;

select *,
case 
	when age <= 30 then 'young'
	when  age between 30 and 50 then 'medium'
	when  age > 50 then 'old'
end as age_cat
from employees;




insert into employees values
(5 ,'nitish', 'rana', 36),
(6, 'mahendrasingh', 'dhoni', 51),
(7, 'sachin', 'Tendulkar', 55),
(8, 'ishan' , 'kishan', 26);

select * from employees

#Assignment 64, Generate a report thet shows all colums from tran_dtl table plus one 
#additional column: "cal_price" - calculated as amt/qty 



#Assignment 64, "Generate a report that shows all columns from tran_dtl table with one
#additional column month_ts - derived as month(tran_dt). Same report should show 12 
#additional columns as one column per month and amt in the tran_dtl table show appear
#in the month column it belongs and remaining 11 columns should have zero as value for 
#that row"

select *,
month(tran_dt) as tran_ts,
case when month(tran_dt)=1 then amt else 0 end as january,
case when month(tran_dt)=2 then amt else 0 end as february,
case when month(tran_dt)=3 then amt else 0 end as march,
case when month(tran_dt)=4 then amt else 0 end as apri,
case when month(tran_dt)=5 then amt else 0 end as may,
case when month(tran_dt)=6 then amt else 0 end as june,
case when month(tran_dt)=7 then amt else 0 end as july,
case when month(tran_dt)=8 then amt else 0 end as august,
case when month(tran_dt)=9 then amt else 0 end as september,
case when month(tran_dt)=10 then amt else 0 end as octomber,
case when month(tran_dt)=11 then amt else 0  end as november,
case when month(tran_dt)=12 then amt else 0 end as december
from tran_dtl ;


###########################################################################

select * from tran_hdr;

insert into tran_hdr(TRAN_ID,MEMBER_ID,STORE_ID,tran_dt)
values
(101,4857,77478,"4-5-23"),
(102,7845,96854,"1-8-23"),
(103,8956,36985,"5-6-25"),
(104,7845,78456,"8-12-24"),
(105,8569,85214,"9-7-25"),
(106,8569,78451,"7-7-27"),
(107,7845,96325,"8-8-28"),
(108,7532,96325,"9-9-29"),
(109,7169,96325,"10-10-23"),
(110,8523,98562,"9-9-28");



select * from tran_dtl 

######################################################################



#Assignment 65, "Generate a report that shows all columns from tran_dtl table with one
#additional column quarter_ts - derived as quarter(tran_dt). Same report should show 12 
#additional columns as one column per quarter and amt in the tran_dtl table show appear
#in the month column it belongs and remaining 11 columns should have zero as value for 
#that row"


select *,
month(tran_dt) as tran_ts,
case when month(tran_dt) between 1 and 3 then "q1" else 0 end as quarter1,
case when month(tran_dt) between 4 and 6 then "q2" else 0 end as quarter2,
case when month(tran_dt) between 7 and 9 then "q3" else 0 end as quarter3,
case when month(tran_dt) between 10 and 12 then "q4" else 0 end as quarter4
from tran_dtl ;


#oR 

select *,
quarter(tran_dt) as quarter_ts
from tran_dtl;


#######
