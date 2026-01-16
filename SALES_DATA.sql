CREATE TABLE sales_data (
    order_id INT,
    order_date DATE,
    year INT,
    month VARCHAR(20),
    product VARCHAR(50),
    category VARCHAR(50),
    region VARCHAR(50),
    salesperson VARCHAR(50),
    quantity INT,
    revenue NUMERIC(12,2),
    cost NUMERIC(12,2),
    profit NUMERIC(12,2)
);
TRUNCATE TABLE sales_data;
SELECT COUNT(*) FROM sales_data;
--View table structure
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales_data';
--See sample data
SELECT * FROM sales_data LIMIT 10;
--Total Revenue, Cost, Profit
SELECT 
    SUM(revenue) AS total_revenue,
    SUM(cost) AS total_cost,
    SUM(profit) AS total_profit
FROM sales_data;
--Monthly Sales Trend
SELECT month, SUM(revenue) AS total_sales
FROM sales_data
GROUP BY month
ORDER BY total_sales DESC;
--Yearly Sales
SELECT year, SUM(revenue) AS yearly_sales
FROM sales_data
GROUP BY year;
--Top 5 Products by Revenue
SELECT product, SUM(revenue) AS revenue
FROM sales_data
GROUP BY product
ORDER BY revenue DESC
LIMIT 5;
--Region-wise Profit
SELECT region, SUM(profit) AS total_profit
FROM sales_data
GROUP BY region;
--Salesperson Performance
SELECT salesperson,
       SUM(revenue) AS total_revenue,
       SUM(profit) AS total_profit
FROM sales_data
GROUP BY salesperson
ORDER BY total_revenue DESC;
--Profit Margin
SELECT product,
       SUM(profit)*100.0 / SUM(revenue) AS profit_margin
FROM sales_data
GROUP BY product;
--export
SELECT 
    region, 
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY region;
