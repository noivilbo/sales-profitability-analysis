-- ==========================================================
-- Sales & Profitability Analysis
-- Description: Exploratory data analysis queries using PostgreSQL
-- ==========================================================

-- 1. Sales and Profit over time (Monthly Performance)
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM main
GROUP BY 1
ORDER BY 1;

-- 2. Profit, Sales, and Margin by Category
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM main
GROUP BY category
ORDER BY total_sales DESC;

-- 3. Profit, Sales, and Margin by Region
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM main
GROUP BY region
ORDER BY total_sales DESC;

-- 4. Relation between Discount and Profitability
SELECT
    discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM main
GROUP BY discount
ORDER BY discount;

-- 5. Underperforming Products (Products with negative total profit)
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM main
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;