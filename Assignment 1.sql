USE new;

create table library(

    book_id INT,
    book_name VARCHAR(255),
    author_name VARCHAR(255),
    number_pages INT,
    price INT
);

insert into library (book_id, book_name, author_name, number_pages, price )
values 
(102, 'Dasbodh', 'Ramdas_Swami', 504, 2000),
(103, 'Agnipankh', 'APJ Abdul kalam', 244, 200),
(104, 'Let Us C', 'Yashwant Kanitkar', 250, 300),
(105, 'Pointers in c', 'Yashwant kanitkar', 340, 300),
(106, 'Unix Shell Scripting', 'Tashvant Kanitkar', 250, 200),
(107,'Python','Guido Van Rossum',360,1000),
(108,'Python Pandas','Guido Van Rossum',410,1230),
(109,'Java','Oracle',324,230),
(110,'Power BI','Microsoft Ltd',510,650),
(111,'Mrutyunjay','Shivaji Sawant',388,600),
(112,'Raja Shivchatrapati','Babasaheb Purandare',455,2000);




select * from library;

show tables

desc `member` 





desc tran_hdr







