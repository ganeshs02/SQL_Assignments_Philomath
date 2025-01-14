
USE sherileela;

ALTER TABLE a_wing
MODIFY COLUMN mobile_number VARCHAR(20);

DESCRIBE a_wing;

INSERT INTO a_wing (FLAT_NO, OWNER_NAME, MOBILE_NUMBER)
VALUES
(101, 'Ganesh Surle','7774075422'),
(102,'KIRAN BIRADAR', '8594671253'),
(103, 'NISHAD DESHPANDE', '7485968547'),
(104, 'NIKHIL SUTAR', '745124251'),
(105, 'MS DHONI', '7418529637'),
(106, 'VIRAT KOHLI', '7896321478'),
(107, 'NITITSH RANA', '8529633698'),
(108, 'RUTURAJ GAIKWAD', '7417417417'),
(109, 'MATHEESHA PATHIRANA', '7845125874'),
(110, 'RACHIN RAVINDRA', '2365236536');

SELECT * FROM a_wing;


delete from a_wing 

delete from a_wing
where FLAT_NO = 101;


update a_wing 
set MOBILE_NUMBER = REPLACE(MOBILE_NUMBER, ',', '');