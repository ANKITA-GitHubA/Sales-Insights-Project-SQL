/* 
									SALES INSIGHTS PROJECT
AIM - To analyse the sales data to help the business understand the areas in which they are lacking 
and take necessary steps to improve in those areas.

The data analysis has been done on three grounds -
1. Yearwise
2. Regionwise
3. Sectorwise
*/

							/*Cleaning and Understanding the data*/
/*Identifying top 10 products with lowest sales in different Markets*/
select * from sales.transactions
 where sales.transactions.sales_amount  > "0"
 order by sales.transactions.sales_amount limit 10;
/* VIEWING THE REVENUE FROM DIFFERENT PRODUCTS*/
SELECT * FROM sales.products;
Select sales.products.* ,sales.transactions.product_code, sales.transactions.sales_amount 
from sales.products
 inner join sales.transactions on sales.products.product_code = sales.transactions.product_code
 where sales.transactions.sales_amount >"0";
 
 
                                    /* TRACKING THE REVENUE BY YEAR*/
 
SELECT * FROM sales.date;
/*Identifying the sales of products in the year 2020.*/
Select sales.transactions.sales_qty,  sales.transactions.product_code, sales.date.* 
from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year  ="2020";

/*Calculating the revenue in 2020*/

Select SUM(sales.transactions.sales_amount), sales.date.* 
from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year  ="2020";
/* Therefore, total revenue in 2020 = 142,235,559*/



/*Calculating the revenue in 2019*/
Select SUM(sales.transactions.sales_amount), sales.date.* 
from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year  ="2019";
/* Therefore, total revenue in 2019 = 336,452,114*/

/*Calculating the revenue in 2018*/
Select SUM(sales.transactions.sales_amount), sales.date.* 
from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year  ="2018";
/* Therefore, total revenue in 2018 = 414,308,941*/

/*Calculating the revenue in 2017*/
Select SUM(sales.transactions.sales_amount), sales.date.* 
from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year  ="2017";
/* Therefore, total revenue in 2017 = 95,68,402*/

/*Therefore, we observe that the revenue increased from 2017 to 2018, and then kept declining till 2020*/


                                 /* Tracking the revenue by REGION*/

Select SUM(sales.transactions.sales_amount), sales.markets.zone
 from sales.transactions inner join sales.markets on sales.transactions.market_code = sales.markets.markets_code
 where sales.markets.zone = "Central";
 
 /* Similarly, calculating revenue for other regions,i.e., Central and South
 Total Revenue in NORTH = 6,76,959,240
 Total Revenue in Central = 2,63,861,012
 Total Revenue in South = 45,744,764
 */
 
 /* TRACKING REVENUE BY SECTORS*/

  select sum(sales.transactions.sales_amount), sales.customers.customer_type 
from sales.transactions inner join sales.customers on sales.transactions.customer_code = sales.customers.customer_code
where sales.customers.customer_type = "Brick & Mortar";

select sum(sales.transactions.sales_amount), sales.customers.customer_type 
from sales.transactions inner join sales.customers on sales.transactions.customer_code = sales.customers.customer_code
where sales.customers.customer_type = "E-Commerce";

/*Total Revenue from Brick & Mortar = 7,46,197,493
Total Revenue from E-Commerce = 2,40,367,523 */

