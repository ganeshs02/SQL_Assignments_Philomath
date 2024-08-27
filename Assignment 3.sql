
use retail;

drop table if exists store_dtl;

create table store_dtl(
store_id int,
store_city varchar(255),
store_state varchar(255),
contact_number varchar(20)
);

insert into store_dtl (store_id, store_city, store_state, contact_number)
values
(1, 'Satara', 'maharashtra', '02162-234567'),
(2, 'pune', 'maharshtra', '020-23456789'),
(3, 'Aurangabad', 'maharshtra', '0240-2345678');

show tables
