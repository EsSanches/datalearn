drop table if exists dl.ship_mode cascade;

CREATE TABLE ship_mode
(
 ship_mode_id int NOT NULL,
 ship_mode    varchar(15) NOT NULL,
 PRIMARY KEY ( ship_mode_id )
);

truncate table dl.ship_mode;


drop table if exists dl.geography cascade;

CREATE TABLE geography
(
 geography_id int NOT NULL,
 country      varchar(15) NOT NULL,
 city         varchar(20) NOT NULL,
 state        varchar(20) NOT NULL,
 region       varchar(10) NOT NULL,
 postal_code  int4range NOT NULL,
 PRIMARY KEY ( geography_id )
 );

truncate table dl.geography;


drop table if exists dl.customer cascade;

CREATE TABLE customer
(
 customer_id   varchar(10) NOT NULL,
 customer_name varchar(25) NOT NULL,
 segment       varchar(15) NOT NULL,
 PRIMARY KEY ( customer_id )
);

truncate table dl.customer;


drop table if exists dl.product cascade;

CREATE TABLE product
(
 product_id   varchar(15) NOT NULL,
 category     varchar(15) NOT NULL,
 subcategory  varchar(11) NOT NULL,
 product_name varchar(127) NOT NULL,
 PRIMARY KEY ( product_id )
);

truncate table dl.product;


drop table if exists dl.sales_fact cascade;

CREATE TABLE sales_fact
(
 row_id       serial NOT NULL,
 order_id     varchar(15) NOT NULL,
 sales        numeric(9,4) NOT NULL,
 quantity     int NOT NULL,
 discount     numeric(4,2) NOT NULL,
 profit       numeric(21,16) NOT NULL,
 geography_id int NOT NULL,
 ship_mode_id int NOT NULL,
 order_date   date NOT NULL,
 ship_date    date NOT NULL,
 customer_id  varchar(10) NOT NULL,
 product_id   varchar(15) NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( row_id ),
 CONSTRAINT FK_2 FOREIGN KEY ( geography_id ) REFERENCES geography ( geography_id ),
 CONSTRAINT FK_4 FOREIGN KEY ( ship_mode_id ) REFERENCES ship_mode ( ship_mode_id ),
 CONSTRAINT FK_5 FOREIGN KEY ( customer_id ) REFERENCES customer ( customer_id ),
 CONSTRAINT FK_5_1 FOREIGN KEY ( order_date, ship_date ) REFERENCES calendar ( order_date, ship_date ),
 CONSTRAINT FK_4_1 FOREIGN KEY ( product_id ) REFERENCES product ( product_id )
);

truncate table dl.sales_fact;