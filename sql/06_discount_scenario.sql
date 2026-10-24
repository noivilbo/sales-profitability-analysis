-- Simulação: teto de 20% de desconto (assume que sales é líquido de desconto e custos fixos)
WITH repriced AS (
    SELECT sales, profit, discount,
           CASE WHEN discount > 0.20
                THEN sales / NULLIF(1 - discount, 0) * 0.80
                ELSE sales END AS sales_cap
    FROM public.main
),
r AS (SELECT *, sales_cap - sales + profit AS profit_cap FROM repriced)
SELECT 'Current' AS scenario, ROUND(SUM(sales)) AS sales, ROUND(SUM(profit)) AS profit,
       ROUND(SUM(profit) / SUM(sales) * 100, 1) AS margin_pct FROM r
UNION ALL
SELECT 'Cap at 20%, all orders kept', ROUND(SUM(sales_cap)), ROUND(SUM(profit_cap)),
       ROUND(SUM(profit_cap) / SUM(sales_cap) * 100, 1) FROM r
UNION ALL
SELECT 'Cap at 20%, half of those orders kept',
       ROUND(SUM(CASE WHEN discount > 0.20 THEN 0.5 * sales_cap  ELSE sales  END)),
       ROUND(SUM(CASE WHEN discount > 0.20 THEN 0.5 * profit_cap ELSE profit END)),
       ROUND(SUM(CASE WHEN discount > 0.20 THEN 0.5 * profit_cap ELSE profit END)
           / SUM(CASE WHEN discount > 0.20 THEN 0.5 * sales_cap  ELSE sales  END) * 100, 1) FROM r
UNION ALL
SELECT 'Those orders are lost entirely',
       ROUND(SUM(sales)  FILTER (WHERE discount <= 0.20)),
       ROUND(SUM(profit) FILTER (WHERE discount <= 0.20)),
       ROUND(SUM(profit) FILTER (WHERE discount <= 0.20)
           / SUM(sales)  FILTER (WHERE discount <= 0.20) * 100, 1) FROM r;