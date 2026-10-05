-- Views for Power bi later

-- Monthly sales
CREATE OR REPLACE VIEW vw_monthly_sales AS

SELECT
    DATE_TRUNC('month', order_date)::date AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM main
GROUP BY 1;

-- profitability by each product
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

-- Discount x profitability
CREATE VIEW vw_discount_profitability AS
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

-- Discount per Month
CREATE VIEW vw_discount_monthly AS
SELECT
    DATE_TRUNC('month', order_date)::date AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,

    SUM(sales * discount)
        / NULLIF(SUM(sales), 0) AS avg_discount,

    SUM(profit)
        / NULLIF(SUM(sales), 0) AS profit_margin
FROM main
GROUP BY month;

-- Discount per Region
CREATE VIEW vw_discount_region AS
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,

    SUM(sales * discount)
        / NULLIF(SUM(sales), 0) AS avg_discount,

    SUM(profit)
        / NULLIF(SUM(sales), 0) AS profit_margin
FROM main
GROUP BY region;

-- Discount per Category
CREATE VIEW vw_discount_category AS
SELECT
    category,

    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,

    SUM(sales * discount)
        / NULLIF(SUM(sales), 0) AS avg_discount,

    SUM(profit)
        / NULLIF(SUM(sales), 0) AS profit_margin
FROM main
GROUP BY category;

-- Profit and sales by region
CREATE OR REPLACE VIEW vw_region_profitability

SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM main
GROUP BY region;