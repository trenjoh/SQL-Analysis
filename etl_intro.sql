create database etl;
use etl;
#Exract 
create table raw_sales_data(
sales_id int primary key,
product_name varchar (100),
quantity_sold int,
sale_date date,
price_per_unit decimal(10, 2),
region varchar (50)
);
insert into raw_sales_data(sales_id, product_name, quantity_sold, sale_date, price_per_unit, region)
values
	(1, 'Laptop', 10, '2025-01-01', 800.00, 'North'),
    (2, 'Phone', 20, '2025-01-01', 500.00, 'South'),
    (3, 'Tablet', 15, '2025-01-02', 300.00, 'East'),
    (4, 'Monitor', 8, '2025-01-03', 150.00, 'West');
select * from raw_sales_data;

#Transform
# creating a table for storing the aggregated sales.
create table transformed_sales(
sale_date date,
total_revenue decimal(10, 2),
total_units_sold int,
region varchar(50)
);
insert into transformed_sales(sale_date, total_revenue, total_units_sold, region)
select
sale_date,
sum(quantity_sold * price_per_unit) as total_revenue,
sum(quantity_sold) as total_units_sold,
region
from raw_sales_data
group by sale_date, region;

select * from transformed_sales;


#LOAD
create table sales_report(
sale_date date,
total_revenue decimal(10, 2),
total_items_sold int,
region varchar(50)
);

insert into sales_report
select
sale_date,
total_revenue,
total_units_sold,
region
from  transformed_sales;

-- SHOW VARIABLES LIKE 'secure_file_priv'; C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\

-- uploading to the data warehouses
select * from sales_report
INTO OUTFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\sales_report.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';
