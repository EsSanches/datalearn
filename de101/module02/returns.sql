--создание таблицы returns

DROP TABLE IF EXISTS returns;
CREATE TABLE returns(
  Returned   VARCHAR(7) NOT NULL ,
  Order_ID  VARCHAR(17) NOT null 
);

--добавление значений

copy returns 
from 'C:\Users\admin\Desktop\returns.csv'
delimiter ','
csv 
header

select * 
from dl."returns" 


