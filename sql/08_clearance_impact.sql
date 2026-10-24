SELECT region,
       COUNT(*) FILTER (WHERE discount >= 0.6)           AS lines_60_plus,
       ROUND(SUM(sales)  FILTER (WHERE discount >= 0.6)) AS sales_60_plus,
       ROUND(SUM(profit) FILTER (WHERE discount >= 0.6)) AS profit_60_plus,
       ROUND(SUM(profit) / SUM(sales) * 100, 1)          AS margin_pct,
       ROUND(SUM(profit) FILTER (WHERE discount < 0.6)
           / SUM(sales)  FILTER (WHERE discount < 0.6) * 100, 1) AS margin_without_60_plus_pct
FROM public.main
GROUP BY region
ORDER BY region;