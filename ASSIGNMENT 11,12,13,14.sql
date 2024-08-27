#ALTER TABLE  #altering the existing tables

drop table if exists ASSIGNMENT_11

show TABLES

create table assignmnet_11(
first_name varchar(200),
last_name varchar (200)
);

alter table assignmnet_11 
	rename to assignment_11;


show tables





alter table assignment_11
add column DoB date;



alter table assignment_11
add column AGE int;

#assignment 12
desc assignment_11

alter table assignment_11
drop column Age;

#assignment 13 #deleting the column
show tables


drop table family_dtl 

#assignment 14 #renaming the column

describe book_detail 


alter table book_detail 
change price book_price int;

#





