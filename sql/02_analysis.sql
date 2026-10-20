-- ==========================================================
-- Sales & Profitability Analysis 
-- ==========================================================

-- 1. Monthly Performance
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM main
GROUP BY 1
ORDER BY 1;

-- 1.1 Year-over-Year (YoY) Growth 
WITH yearly_performance AS (
    SELECT 
        EXTRACT(YEAR FROM order_date) AS year,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
    FROM main
    GROUP BY 1
)
SELECT 
    year,
    total_sales,
    LAG(total_sales) OVER (ORDER BY year) AS previous_year_sales,
    ROUND((total_sales - LAG(total_sales) OVER (ORDER BY year)) / NULLIF(LAG(total_sales) OVER (ORDER BY year), 0) * 100, 2) AS yoy_sales_growth_pct,
    total_profit,
    profit_margin_pct
FROM yearly_performance
ORDER BY year;

-- 2. Category & Granular Sub-Category Drill-down 
SELECT 
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM main
GROUP BY category, sub_category
ORDER BY total_profit ASC;

-- 3. Regional Performance
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM main
GROUP BY region
ORDER BY total_sales DESC;

-- 4. Discount Tiers Impact Analysis 
SELECT 
    CASE 
        WHEN discount = 0 THEN '0% (No Discount)'
        WHEN discount <= 0.2 THEN 'Low (up to 20%)'
        ELSE 'High (> 20%)'
    END AS discount_tier,
    COUNT(*) AS total_transactions,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct
FROM main
GROUP BY 1
ORDER BY total_profit DESC;

-- 5. Underperforming Products (Negative profit)
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM main
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;