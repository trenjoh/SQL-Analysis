create database car_prices;
use car_prices;
create table CarSales(
year INT,
make VARCHAR(50),
model VARCHAR(100),
trim varchar(50),
body varchar(50),
transmission varchar(50),
vin varchar(20) primary KEY,
state char(2),
conditions INT,
odometer INT,
color varchar(50),
interior varchar(50),
seller varchar(100),
mmr int,
sellingprice INT,
saledate datetime
);
select * from CarSales;


-- 1.	Create a New Table for High-Value Cars:
create table High_value_cars as 
select *from CarSales
where sellingprice > 50000;

-- 2.	Summarize Sales by Year:
select
	year,
	sum(sellingprice) as sum_of_carsales,
    avg(sellingprice) as avg_of_sales,
    count(*) as num_of_cars
    
from CarSales
group by year
order by year;

-- 3.	Identify Popular Models:
-- 	Create a table popular_models that lists car models sold more than 10 times (based on VIN count) along with their total and average selling prices.
select * from carsales;

create table popular_models as
select
	model,
    sum(sellingprice) as total_sellingprice,
    count(vin) as times_sold,
    avg(sellingprice) as avg_sellingprice
from CarSales
group by model
having
	count(vin) > 10
order by times_sold desc;

-- 4.	Calculate Profit Margins:
-- Add a new column called profit_margin to the existing table, which calculates the difference between sellingprice and mmr.
select * from carsales;

Alter table carsales
add profit_margins int(50);

update carsales
set profit_margins = sellingprice - mmr;
select * from carsales;

-- 5.	Generate Sales Trends:
-- o	Create a view sales_trends that shows the number of cars sold and their total selling price by month and year (saledate).
create table sales_trend 
select
	saledate,
    sum(sellingprice) as tt_sellingprice
from carsales
group by saledate;

select * from sales_trend;
-- 6.	State-Wise Aggregation:
-- o	Create a table state_sales_summary that summarizes total sales (sellingprice) and average car conditions (condition) for each state.
select * from carsales;

create table state_sales_summary
select
	state,
    sum(sellingprice) as sum_spm,
    avg(conditions) as conditionss
    
from carsales
group by state;

-- 7.	Filter Top Sellers:
-- o	Create a table top_sellers for sellers with total sales (sum of sellingprice) exceeding $200,000. Include seller name and total sales.

create table top_seller
select
	seller,
    sum(sellingprice) as total_sales
from carsales 
group by seller
having total_sales > 200000;


-- 8.	Find Most Frequent Car Colors:
-- o	Create a table color_summary that lists each color, its total count, and the average selling price for cars of that color.
create table color_summary
select
	color,
    count(*) as total_count,
    avg(sellingprice)
from carsales
group by color;

-- 9.	Analyze Mileage Impact on Sales Price:
-- o	Create a view mileage_price_analysis to show the average sellingprice for cars grouped by ranges of odometer values (e.g., 0-10k, 10k-20k, etc.).
select * from carsales;

-- create view mileage_price_analysis as
select
case
	when odometer between 0 and 10000 then '0 and 10000'
    when odometer between 10001 and 20000 then '10000 and 20000'
    when odometer between 20001 and 50000 then '20000 and 50000'
    when odometer between 50001 and 100000 then '50000 and 100000'
    when odometer between 100001 and 200000 then '100000 and 200000'
    when odometer between 200001 and 300000 then '200000 and 300000'
    when odometer between 300001 and 1000000 then '300000 and 1000000'
    else '1m+'
  end as odometer_range,
  avg(sellingprice) as avg_sellingprice

from carsales
group by odometer_range;

-- 10.	Create a Table for Weekend Sales:
-- o	Extract data for sales that occurred on weekends (Saturday and Sunday) into a new table called weekend_sales.
CREATE TABLE weekend_sales AS
SELECT *
FROM CarSales
WHERE saledate IN ('Tue', 'Thur');

select * from carsales;