-- ==========================================================
-- 01_create_main.sql
-- Raw-clean landing table loaded from data/processed/samplesuperstore_clean.csv
-- Grain: one row per order line (row_id is unique after the data-quality step)
-- ==========================================================

CREATE TABLE IF NOT EXISTS public.main (
    row_id        INTEGER PRIMARY KEY,   -- unique per order line; blocks accidental double loads
    order_id      VARCHAR(50),
    order_date    DATE,
    ship_date     DATE,
    ship_mode     VARCHAR(50),
    customer_id   VARCHAR(50),
    customer_name VARCHAR(150),
    segment       VARCHAR(50),
    country       VARCHAR(100),
    city          VARCHAR(100),
    province      VARCHAR(100),
    postal_code   VARCHAR(25),
    region        VARCHAR(50),
    product_id    VARCHAR(50),
    category      VARCHAR(50),
    sub_category  VARCHAR(50),
    product_name  VARCHAR(225),
    sales         NUMERIC(12,3),
    quantity      INTEGER,
    discount      NUMERIC(5,2),          -- fraction: 0.20 = 20%
    profit        NUMERIC(12,3)
);
