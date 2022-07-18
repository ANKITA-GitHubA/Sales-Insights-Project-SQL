/* 
									SALES INSIGHTS PROJECT
AIM - To analyse the sales data to understand the areas in which the business is lagging
and take necessary steps to improve.

The data analysis has been done on three grounds -
1. Yearwise
2. Regionwise
3. Sectorwise
*/

							
 
 
                                    /* TRACKING THE REVENUE BY YEAR*/
 

/*Calculating the revenue in 2020*/

Select SUM(sales.transactions.sales_amount), sales.date.* 
from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year  ="2020" and sales.transactions.sales_amount >= "0"
;
/* Therefore, total revenue in 2020 = 142,235,559*/



/*Calculating the revenue in 2019*/
Select SUM(sales.transactions.sales_amount), sales.date.* 
from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year  ="2019" and sales.transactions.sales_amount >= "0";
/* Therefore, total revenue in 2019 = 336,452,114*/

/*Calculating the revenue in 2018*/
Select SUM(sales.transactions.sales_amount), sales.date.* 
from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year  ="2018" and sales.transactions.sales_amount >= "0" ;
/* Therefore, total revenue in 2018 = 414,308,943*/

/*Calculating the revenue in 2017*/
Select SUM(sales.transactions.sales_amount), sales.date.* 
from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year  ="2017" and sales.transactions.sales_amount >= "0";
/* Therefore, total revenue in 2017 = 93,568,402*/

/*Therefore, we observe that the revenue increased from 2017 to 2018, and then kept declining till 2020*/


                                 /* Tracking the revenue by REGION*/

Select SUM(sales.transactions.sales_amount), sales.markets.zone
 from sales.transactions inner join sales.markets on sales.transactions.market_code = sales.markets.markets_code
 where sales.markets.zone = "Central" and sales.transactions.sales_amount >= "0";
 
 /* Similarly, calculating revenue for other regions,i.e., Central and South
 Total Revenue in NORTH = 6,76,959,240
 Total Revenue in Central = 2,63,861,014
 Total Revenue in South = 45,744,764
 */
 
 /* TRACKING REVENUE BY SECTORS*/

  select sum(sales.transactions.sales_amount), sales.customers.customer_type 
from sales.transactions inner join sales.customers on sales.transactions.customer_code = sales.customers.customer_code
where sales.customers.customer_type = "Brick & Mortar" and sales.transactions.sales_amount >= "0";

select sum(sales.transactions.sales_amount), sales.customers.customer_type 
from sales.transactions inner join sales.customers on sales.transactions.customer_code = sales.customers.customer_code
where sales.customers.customer_type = "E-Commerce" and sales.transactions.sales_amount >= "0";

/*Total Revenue from Brick & Mortar = 7,46,197,495
Total Revenue from E-Commerce = 2,40,367,523 */

/*
OTHER GENERAL INSIGHTS
Identifying top 5 products with lowest sales in different Markets*/
select * from sales.transactions
 where sales.transactions.sales_amount  >= "0" AND sales.transactions.market_code = "Mark001"
 order by sales.transactions.sales_amount ASC 
 limit 5;
 /*Similarly we will do the calculation for other markets*/
 
 /*Identifying the sales of products in the year 2020.*/
Select sales.transactions.sales_qty,  sales.transactions.product_code, sales.date.* 
from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year  ="2020" and sales.transactions.sales_qty > "0"
ORDER BY sales.transactions.sales_qty DESC
LIMIT 10;

/*end*/