--создание таблицы

DROP TABLE IF EXISTS people;
CREATE TABLE people(
   Person VARCHAR(17) NOT NULL PRIMARY KEY,
   Region VARCHAR(7) NOT NULL
);

--добавление значений 

copy people 
from 'C:\Users\admin\Desktop\people.csv'
delimiter ','
csv 
header




