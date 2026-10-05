
-- Sales Analysis

-- Sales over time
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM main
GROUP BY 1
ORDER BY 1;

-- Profit and sales by category
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM main
GROUP BY category
ORDER BY total_sales DESC;

-- Profit and sales by region
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM main
GROUP BY region
ORDER BY total_sales DESC;

-- Relation between discount and profitability
SELECT
    discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM main
GROUP BY discount
ORDER BY discount;

-- Bad products
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM main
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_sales DESC;



