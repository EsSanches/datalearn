# Задание для модуля 2


## SQL запросы


### Задание

> 1. Создайте 3 таблицы и загрузите данные из [Superstore Excel файл](https://github.com/Data-Learn/data-engineering/blob/master/DE-101%20Modules/Module01/DE%20-%20101%20Lab%201.1/Sample%20-%20Superstore.xls) в вашу базу данных. Сохраните в вашем GitHub скрипт загрузки данных и создания таблиц.

> 2. Напишите запросы, чтобы ответить на вопросы из [Модуля 01](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module01/DE%20-%20101%20Lab%201.1#%D0%B0%D0%BD%D0%B0%D0%BB%D0%B8%D1%82%D0%B8%D0%BA%D0%B0-%D0%B2-excel). Сохраните в вашем GitHub скрипт загрузки данных и создания таблиц.



1. Скрипты для создания таблиц и загрузки данных

[1. orders.sql](https://github.com/EsSanches/datalearn/blob/main/de101/module02/orders.sql)

[2. people.sql](https://github.com/EsSanches/datalearn/blob/main/de101/module02/people.sql)

[3. returns.sql](https://github.com/EsSanches/datalearn/blob/main/de101/module02/returns.sql)


2. Запросы к созданным таблицам для ответа на вопросы из 1-го модуля

[overview_m_1.sql](https://github.com/EsSanches/datalearn/blob/main/de101/module02/overview_m_1.sql)

## Нарисовать модель данных в SQLdbm

### Задание

> 1. Вам необходимо нарисовать модель данных для нашего файлика [Superstore](https://github.com/Data-Learn/data-engineering/blob/master/DE-101%20Modules/Module01/DE%20-%20101%20Lab%201.1/Sample%20-%20Superstore.xls):

> - Концептуальную
> - Логическую
> - Физическую

> 2. Когда вы нарисуете модель данных, вам нужно скопировать DDL и выполнить его в SQL клиенте.

> 3. Вам необходимо сделать `INSERT INTO SQL`, чтобы заполнить **Dimensions** таблицы и **Sales Fact** таблицу. Сначала мы заполняем **Dimensions** таблицы, где в качестве **id** мы генерим последовательность чисел, а зачем **Sales Fact** таблицу, в которую вставляем **id** из **Dimensions** таблиц.

Дляя построения модели использовал [SqlDBM](https://sqldbm.com/), там же создал запросы на создание таблиц [create-new_tables.sql](https://github.com/EsSanches/datalearn/blob/main/de101/module02/create-new_tables.sql)

![Image alt](https://github.com/EsSanches/datalearn/blob/main/de101/module02/diagram.png)

Заполняю созданные таблицы используя ранее загруженную таблицу [orders.sql](https://github.com/EsSanches/datalearn/blob/main/de101/module02/orders.sql)

Во время заполнения возникла проблема с дубликатами в таблице `product_id` заменил дубликаты используя следующий синтаксис 



  

## Нарисовать графики в Google Sheets

## Нарисовать графики в KlipFolio
