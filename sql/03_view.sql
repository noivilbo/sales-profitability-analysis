-- ==========================================================
-- Views for Power BI Integration
-- Description: Pre-aggregated database views to optimize BI performance
-- ==========================================================

-- 1. Monthly sales performance
CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT
    DATE_TRUNC('month', order_date)::date AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM main
GROUP BY 1;

-- 2. Profitability by product
CREATE OR REPLACE VIEW vw_product_profitability AS
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM main
GROUP BY
    product_id,
    product_name,
    category,
    sub_category;

-- 3. Discount vs profitability by product
CREATE OR REPLACE VIEW vw_discount_profitability AS
SELECT
    product_id,
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(sales * discount) / NULLIF(SUM(sales), 0) AS avg_discount
FROM main
GROUP BY
    product_id,
    product_name;

-- 4. Discount and performance per Month
CREATE OR REPLACE VIEW vw_discount_monthly AS
SELECT
    DATE_TRUNC('month', order_date)::date AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales * discount) / NULLIF(SUM(sales), 0) AS avg_discount,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM main
GROUP BY month;

-- 5. Discount and performance per Region
CREATE OR REPLACE VIEW vw_discount_region AS
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales * discount) / NULLIF(SUM(sales), 0) AS avg_discount,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM main
GROUP BY region;

-- 6. Discount and performance per Category
CREATE OR REPLACE VIEW vw_discount_category AS
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales * discount) / NULLIF(SUM(sales), 0) AS avg_discount,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM main
GROUP BY category;

-- 7. Profit and sales by region 
CREATE OR REPLACE VIEW vw_region_profitability AS
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM main