-- Quanto lucro o Central teria com a margem das outras regiões em cada categoria
WITH by_cat AS (
    SELECT l.region, p.category, SUM(f.sales) AS sales, SUM(f.profit) AS profit
    FROM public.vw_fact_sales f
    JOIN public.vw_dim_location l USING (location_key)
    JOIN public.vw_dim_product  p USING (product_id)
    GROUP BY l.region, p.category
),
benchmark AS (
    SELECT category, SUM(profit) / SUM(sales) AS margin
    FROM by_cat WHERE region <> 'Central' GROUP BY category
)
SELECT c.category,
       ROUND(c.profit)                      AS actual_profit,
       ROUND(c.sales * b.margin)            AS profit_at_benchmark,
       ROUND(c.sales * b.margin - c.profit) AS gap
FROM by_cat c JOIN benchmark b USING (category)
WHERE c.region = 'Central'
ORDER BY gap DESC;