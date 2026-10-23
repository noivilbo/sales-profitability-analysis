-- ==========================================================
-- 04_model_checks.sql
-- Validation queries for the star schema. Run after 03_views_star.sql.
-- Every "expect" comment says what a healthy result looks like.
-- ==========================================================

-- 1. Fact view must match the source table exactly (expect identical rows)
SELECT 'main' AS source, COUNT(*) AS order_lines, COUNT(DISTINCT order_id) AS orders,
       ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM public.main
UNION ALL
SELECT 'vw_fact_sales', COUNT(*), COUNT(DISTINCT order_id),
       ROUND(SUM(sales), 2), ROUND(SUM(profit), 2)
FROM public.vw_fact_sales;

-- 2. Dimension keys must be unique (expect 0 rows from each query)
SELECT 'customer' AS dim, customer_id AS key, COUNT(*) FROM public.vw_dim_customer GROUP BY 2 HAVING COUNT(*) > 1;
SELECT 'product'  AS dim, product_id  AS key, COUNT(*) FROM public.vw_dim_product  GROUP BY 2 HAVING COUNT(*) > 1;
SELECT 'location' AS dim, location_key AS key, COUNT(*) FROM public.vw_dim_location GROUP BY 2 HAVING COUNT(*) > 1;
SELECT 'date'     AS dim, date::text   AS key, COUNT(*) FROM public.vw_dim_date     GROUP BY 2 HAVING COUNT(*) > 1;

-- 3. Orphan keys: fact rows without a matching dimension row (expect 0 in every column)
SELECT
    COUNT(*) FILTER (WHERE c.customer_id  IS NULL) AS orphan_customers,
    COUNT(*) FILTER (WHERE p.product_id   IS NULL) AS orphan_products,
    COUNT(*) FILTER (WHERE l.location_key IS NULL) AS orphan_locations,
    COUNT(*) FILTER (WHERE d.date         IS NULL) AS orphan_dates
FROM public.vw_fact_sales f
LEFT JOIN public.vw_dim_customer c ON c.customer_id  = f.customer_id
LEFT JOIN public.vw_dim_product  p ON p.product_id   = f.product_id
LEFT JOIN public.vw_dim_location l ON l.location_key = f.location_key
LEFT JOIN public.vw_dim_date     d ON d.date         = f.order_date;

-- 4. Source inconsistencies hidden by MAX() in the dimensions (expect 0 rows; if rows
--    appear, decide which value is correct and fix it in the notebook)
SELECT product_id,
       COUNT(DISTINCT product_name) AS names,
       COUNT(DISTINCT category)     AS categories,
       COUNT(DISTINCT sub_category) AS sub_categories
FROM public.main
GROUP BY product_id
HAVING COUNT(DISTINCT product_name) > 1
    OR COUNT(DISTINCT category) > 1
    OR COUNT(DISTINCT sub_category) > 1;

SELECT customer_id,
       COUNT(DISTINCT customer_name) AS names,
       COUNT(DISTINCT segment)       AS segments
FROM public.main
GROUP BY customer_id
HAVING COUNT(DISTINCT customer_name) > 1 OR COUNT(DISTINCT segment) > 1;

-- 5. Postal-code padding problems left by the notebook (expect 0)
--    Matches 'nan' strings padded to '00nan' and floats like '42420.0'
SELECT COUNT(*) AS suspicious_postal_codes
FROM public.main
WHERE postal_code ~* 'nan' OR postal_code ~ '\.0$';

-- 6. "Average discount" has more than one definition. Compare them per region so the
--    README, the report and the dashboard all use the same one.
--      simple      = plain average of the discount column
--      sales_wtd   = weighted by net sales (what 03_view.sql used)
--      effective   = total discount given / total pre-discount value (recommended)
SELECT
    l.region,
    ROUND(AVG(f.discount) * 100, 1)                                    AS avg_discount_simple_pct,
    ROUND(SUM(f.sales * f.discount) / NULLIF(SUM(f.sales), 0) * 100, 1) AS avg_discount_sales_weighted_pct,
    ROUND(SUM(f.discount_amount) / NULLIF(SUM(f.gross_sales), 0) * 100, 1) AS effective_discount_pct
FROM public.vw_fact_sales f
JOIN public.vw_dim_location l USING (location_key)
GROUP BY l.region
ORDER BY l.region;

-- 7. Headline numbers for the README (orders are distinct order_id, not order lines)
SELECT
    COUNT(*)                                          AS order_lines,
    COUNT(DISTINCT order_id)                          AS orders,
    ROUND(SUM(sales), 0)                              AS total_sales,
    ROUND(SUM(profit), 0)                             AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 1) AS profit_margin_pct,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2)   AS average_ticket
FROM public.vw_fact_sales;
