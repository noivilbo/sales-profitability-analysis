SELECT region,
       COUNT(*)                                    AS order_lines,
       COUNT(*) FILTER (WHERE discount >= 0.6)     AS lines_60_plus,
       ROUND(100.0 * COUNT(*) FILTER (WHERE discount >= 0.6) / COUNT(*), 1) AS pct_of_lines
FROM public.main
GROUP BY region
ORDER BY pct_of_lines DESC;