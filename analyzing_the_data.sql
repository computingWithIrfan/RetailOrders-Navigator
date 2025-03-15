-- Total numbers of orders
SELECT COUNT(r.order_id) AS total_orders FROM dbo.retail_orders r;

-- Total Sales
SELECT SUM(r.sale_price) AS total_sales FROM dbo.retail_orders r;

-- Total Profit
SELECT SUM(r.profit) AS total_profit FROM dbo.retail_orders r;

-- Average discount on orders
SELECT AVG(r.discount) AS average_discount FROM dbo.retail_orders r;

-- Top 5 best selling products
SELECT TOP 5 r.product_id,SUM(r.quantity) as total_solds
  FROM dbo.retail_orders r 
  GROUP BY r.product_id
  ORDER BY total_solds DESC;

-- Top 5 best profitable products
SELECT TOP 5 r.product_id,SUM(r.profit) as profit_generated
  FROM dbo.retail_orders r 
  GROUP BY r.product_id
  ORDER BY profit_generated DESC;

-- Sales and No of Ordes in each region
SELECT r.region,SUM(r.sale_price) AS sales,COUNT(r.order_id) AS total_orders
  FROM dbo.retail_orders r
  GROUP BY r.region;

-- Total sales By category and subcategory
SELECT r.category,r.sub_category,SUM(r.sale_price) AS total_sales
  FROM dbo.retail_orders r
  GROUP BY r.category,r.sub_category
  ORDER BY total_sales DESC;

-- No of orders by each shiping mode
SELECT r.ship_mode,COUNT(r.order_id) AS no_of_orders
  FROM dbo.retail_orders r
  GROUP BY r.ship_mode;

-- Top 10 cities with highest sales and no of orders from it
SELECT TOP 10 r.city ,SUM(R.sale_price) AS total_sales,COUNT(r.order_date) AS total_order
  FROM dbo.retail_orders r
  GROUP BY r.city
  ORDER BY total_sales DESC;

-- which customer segment (e.g., Corporate, Consumer, Home Office) generates the most revenue.
SELECT r.segment,SUM(r.sale_price) AS revenue
FROM dbo.retail_orders r
GROUP BY r.segment
ORDER BY revenue DESC;

-- Comparison between Actual sales and sales without discount
SELECT SUM(r.sale_price) AS actual_sales, SUM(r.sale_price + r.discount) AS sales_without_discount,
	ROUND((100 -(SUM(r.sale_price)/SUM(r.sale_price + r.discount))*100),3) AS discount_total_revenue
FROM dbo.retail_orders r;
