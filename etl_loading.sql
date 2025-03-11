create database etl_load;
use etl_load;

create table sales_data(
	sales_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity_sold INT,
    sale_date DATE,
    price_per_unit DECIMAL(10,2),
    region VARCHAR(50)
);
INSERT INTO etl_load.sales_data (sales_id, product_name, quantity_sold, sale_date, price_per_unit, region)
SELECT sales_id, product_name, quantity_sold, sale_date, price_per_unit, region
FROM etl.raw_sales_data;

select * from sales_data

