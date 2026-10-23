-- ==========================================================
-- 03_views_star.sql
-- Star schema served to Power BI (replaces the pre-aggregated views in 03_view.sql)
--
-- Why: pre-aggregated views are isolated "islands" in Power BI. They share no keys,
-- so one slicer cannot filter all visuals, orders cannot be re-counted at another
-- grain, and year-over-year comparisons are impossible. Here the fact view keeps the
-- order-line grain and Power BI aggregates it with DAX measures.
--
--   vw_dim_date      1 --- *  vw_fact_sales  * --- 1  vw_dim_customer
--   vw_dim_location  1 --- *       *
--   vw_dim_product   1 --- *       *
--
-- Relationships (Power BI): dimension -> fact, one-to-many, single direction.
-- ==========================================================

-- ----------------------------------------------------------
-- Dimension: customer (one row per customer_id)
-- ----------------------------------------------------------
CREATE OR REPLACE VIEW public.vw_dim_customer AS
SELECT
    customer_id,
    MAX(customer_name) AS customer_name,
    MAX(segment)       AS segment
FROM public.main
GROUP BY customer_id;

-- ----------------------------------------------------------
-- Dimension: product (one row per product_id)
-- MAX() guarantees one row per ID even if the source has inconsistent names;
-- see sql/04_model_checks.sql to list any conflicting IDs.
-- ----------------------------------------------------------
CREATE OR REPLACE VIEW public.vw_dim_product AS
SELECT
    product_id,
    MAX(product_name) AS product_name,
    MAX(category)     AS category,
    MAX(sub_category) AS sub_category
FROM public.main
GROUP BY product_id;

-- ----------------------------------------------------------
-- Dimension: location (region > country > province > city)
-- location_key is a deterministic hash of the four columns, computed identically
-- here and in vw_fact_sales, so no join is needed and no rows can be lost or
-- duplicated when building the fact view.
-- ----------------------------------------------------------
CREATE OR REPLACE VIEW public.vw_dim_location AS
SELECT DISTINCT
    md5(concat(country, '|', province, '|', city, '|', region)) AS location_key,
    region,
    country,
    province,
    city
FROM public.main;

-- ----------------------------------------------------------
-- Dimension: date (complete calendar years covering the data)
-- Complete years are needed for time-intelligence functions such as SAMEPERIODLASTYEAR.
-- ----------------------------------------------------------
CREATE OR REPLACE VIEW public.vw_dim_date AS
SELECT
    d::date                         AS date,
    EXTRACT(YEAR    FROM d)::int    AS year,
    EXTRACT(QUARTER FROM d)::int    AS quarter,
    'Q' || EXTRACT(QUARTER FROM d)::int AS quarter_name,
    EXTRACT(MONTH   FROM d)::int    AS month_number,
    TO_CHAR(d, 'FMMonth')           AS month_name,
    TO_CHAR(d, 'Mon')               AS month_short,
    TO_CHAR(d, 'YYYY-MM')           AS year_month
FROM generate_series(
    date_trunc('year', (SELECT MIN(order_date) FROM public.main)::timestamp),
    date_trunc('year', (SELECT MAX(order_date) FROM public.main)::timestamp)
        + interval '1 year' - interval '1 day',
    interval '1 day'
) AS d;

-- ----------------------------------------------------------
-- Fact: one row per order line (same grain as public.main)
-- gross_sales / discount_amount rebuild the pre-discount value (sales is net of
-- discount), which allows an effective discount rate: SUM(discount_amount) / SUM(gross_sales).
-- discount_tier buckets the discount so it can be used as an axis or slicer.
-- ----------------------------------------------------------
CREATE OR REPLACE VIEW public.vw_fact_sales AS
SELECT
    row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    product_id,
    md5(concat(country, '|', province, '|', city, '|', region)) AS location_key,
    sales,
    quantity,
    discount,
    profit,
    sales / NULLIF(1 - discount, 0)         AS gross_sales,
    sales / NULLIF(1 - discount, 0) - sales AS discount_amount,
    CASE
        WHEN discount = 0    THEN '0%'
        WHEN discount <= 0.10 THEN '1-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        ELSE '>20%'
    END AS discount_tier,
    CASE
        WHEN discount = 0    THEN 1
        WHEN discount <= 0.10 THEN 2
        WHEN discount <= 0.20 THEN 3
        ELSE 4
    END AS discount_tier_order
FROM public.main;

-- ==========================================================
-- AFTER the Power BI report is fully migrated to the star schema, remove the old
-- pre-aggregated views (run manually; do not run before migrating):
--
-- DROP VIEW IF EXISTS vw_monthly_sales, vw_product_profitability,
--                     vw_discount_profitability, vw_discount_monthly,
--                     vw_discount_region, vw_discount_category,
--                     vw_region_profitability;
-- ==========================================================
