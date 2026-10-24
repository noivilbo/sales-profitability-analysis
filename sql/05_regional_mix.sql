-- Mix de produtos ou desconto? Margem e desconto por região e categoria
SELECT
    l.region,
    p.category,
    ROUND(SUM(f.sales), 0)  AS sales,
    ROUND(SUM(f.profit), 0) AS profit,
    ROUND(SUM(f.profit) / NULLIF(SUM(f.sales), 0) * 100, 1) AS margin_pct,
    ROUND(SUM(f.discount_amount) / NULLIF(SUM(f.gross_sales), 0) * 100, 1) AS effective_discount_pct,
    ROUND(SUM(f.sales) / SUM(SUM(f.sales)) OVER (PARTITION BY l.region) * 100, 1) AS share_of_region_pct
FROM public.vw_fact_sales f
JOIN public.vw_dim_location l USING (location_key)
JOIN public.vw_dim_product  p USING (product_id)
GROUP BY l.region, p.category
ORDER BY l.region, p.category;