# Sales & Profitability Analysis: Report

## Overview

This project analyzes 10,194 sales transactions from 2023 to 2026, focusing on discounts, product categories and sub-categories, regions, and the annual and monthly trends.

| Metric | Value |
|---|---|
| Total sales | $2.33M |
| Total profit | $292K |
| Overall profit margin | 12.6% |
| Transactions | 10,194 |

The goal is to understand where profitability is strong, where it is weak, and what role discounts play.

## Key Findings

1. **Discounts above 20% are where margin is lost.** Orders with no discount have a 29.6% margin, while orders discounted by more than 20% add up to a net loss of about $136K across 1,415 transactions (−37.3% margin).
2. **Central's low margin is not a product-mix problem.** Central has a 7.9% margin against 15.0% in West, and its average discount is 24.1%, roughly double West's 10.9%. Its Furniture and Office Supplies discounts are far above the other regions, while its product mix is similar.
3. **Furniture's weak margin is concentrated in two sub-categories.** Furniture has a 2.6% margin overall, but Tables (−8.5%) and Bookcases (−3.1%) operate at a loss. Supplies (−2.5%), in Office Supplies, is a third loss-maker.
4. **More sales did not always mean more profit.** November is the strongest month for sales, but December leads in profit. In 2024, sales fell 4.3% while profit rose 20%.

## Discounts and Profitability

| Discount tier | Transactions | Sales | Profit | Margin |
|---|---|---|---|---|
| No discount | 4,925 | $1,105,324 | $326,719 | 29.6% |
| Up to 20% | 3,854 | $856,450 | $101,599 | 11.9% |
| Above 20% | 1,415 | $364,760 | −$136,021 | −37.3% |

- Orders above 20% are 13.9% of transactions and 15.7% of sales, yet they destroy $136K of profit.
- Orders with no discount are 47.5% of sales and generate $326.7K in profit, more than the company's total profit of $292.3K.
- Without the orders above 20%, the remaining business would have earned a 21.8% margin.

This is a strong association, but it is not proof of causation. High discounts may be concentrated in specific products or regions, which is why the regional analysis below compares discounts and margins within each category.

## Category and Sub-category Performance

Furniture has a 2.6% margin, far below Office Supplies (~17.2%) and Technology (~17.4%). The drill-down shows where the problem sits:

| Sub-category | Category | Sales | Profit | Margin |
|---|---|---|---|---|
| Tables | Furniture | $208,020 | −$17,753 | −8.5% |
| Bookcases | Furniture | $115,361 | −$3,632 | −3.1% |
| Supplies | Office Supplies | $46,725 | −$1,171 | −2.5% |
| Machines | Technology | $189,925 | $3,462 | 1.8% |
| Chairs | Furniture | $335,768 | $27,224 | 8.1% |

- Tables and Bookcases together lose $21.4K on $323K of sales (−6.6%). The other two Furniture lines, Chairs and Furnishings, earn a combined 9.5%.
- Machines is profitable but barely (1.8% on $190K of sales), so it deserves review alongside the loss-makers.
- The highest margins are in Labels (43.9%), Paper (43.4%), Envelopes (42.3%) and Copiers (37.2%).

## Regional Performance

| Region | Transactions | Sales | Profit | Margin | Avg. discount |
|---|---|---|---|---|---|
| West | 3,253 | $739,814 | $110,799 | 15.0% | 10.9% |
| East | 2,986 | $691,828 | $94,883 | 13.7% | 14.3% |
| South | 1,620 | $391,722 | $46,749 | 11.9% | 14.7% |
| Central | 2,335 | $503,171 | $39,865 | 7.9% | 24.1% |

Central sells more than South but earns far less profit: its margin is 7.9% against 11.9%, and it has the highest average discount by a wide margin.

### Is it the region or the product mix?

Margin and average discount by category within each region:

| Region | Category | Sales | Profit | Margin | Avg. discount |
|---|---|---|---|---|---|
| Central | Furniture | $164,538 | −$2,802 | −1.7% | 29.7% |
| Central | Office Supplies | $168,217 | $8,970 | 5.3% | 25.4% |
| Central | Technology | $170,416 | $33,697 | 19.8% | 13.3% |
| East | Furniture | $212,232 | $3,445 | 1.6% | 15.4% |
| East | Office Supplies | $211,658 | $42,997 | 20.3% | 14.0% |
| East | Technology | $267,938 | $48,442 | 18.1% | 14.1% |
| South | Furniture | $117,299 | $6,771 | 5.8% | 12.2% |
| South | Office Supplies | $125,651 | $19,986 | 15.9% | 16.7% |
| South | Technology | $148,772 | $19,992 | 13.4% | 10.8% |
| West | Furniture | $260,680 | $12,316 | 4.7% | 13.0% |
| West | Office Supplies | $226,367 | $54,070 | 23.9% | 9.3% |
| West | Technology | $252,767 | $44,412 | 17.6% | 13.3% |

- **Mix does not explain the gap.** Furniture is 32.7% of Central's sales, close to the other regions (29.9% to 35.2%, with West the highest).
- **If Central earned the margins the other three regions earn in each category, its profit would be about $70K (13.9% margin) instead of $39.9K.** The roughly $30K gap sits in Office Supplies (about $26K) and Furniture (about $9K), while Technology is about $5K ahead of the others.
- **Where Central's discount is in line, its margin is too.** In Technology, Central's average discount (13.3%) matches West's (13.3%), and its margin (19.8%) is actually the highest of all regions. The weak results are in Furniture and Office Supplies, where Central's discounts are 25.4% to 29.7%.

These figures are association, not proof of causation, and they are calculated from rounded values. Still, the pattern points to discounting in Central's Furniture and Office Supplies, not to the region or the product mix, as the main driver.

## Annual Performance

| Year | Sales | YoY growth | Profit | Margin |
|---|---|---|---|---|
| 2023 | $494,040 | n/a | $51,684 | 10.5% |
| 2024 | $472,993 | −4.3% | $62,021 | 13.1% |
| 2025 | $613,934 | +29.8% | $82,665 | 13.5% |
| 2026 | $745,568 | +21.4% | $95,926 | 12.9% |

- 2024 was the only year with falling sales, yet profit rose from $51.7K to $62.0K because the margin improved by 2.6 points.
- Sales grew strongly in 2025 and 2026, and margins stayed around 13%.
- In 2026, sales grew 21% while the margin slipped from 13.5% to 12.9%, so more sales did not mean proportionally more profit.

## Monthly Performance

Adding the same calendar month across the four years:

| Month | Sales | Profit | Margin |
|---|---|---|---|
| Sep | $308,884 | $37,235 | 12.1% |
| Oct | $207,126 | $33,215 | 16.0% |
| Nov | $352,666 | $35,541 | 10.1% |
| Dec | $330,218 | $44,230 | 13.4% |
| Feb | $59,751 | $10,295 | 17.2% |

- Sales peak toward the end of the year. November has the highest sales ($352.7K), but December has the highest profit ($44.2K), and November's margin (10.1%) is below the average.
- The single strongest sales month is November 2026 ($118.5K), but it earned only $9.7K in profit (8.2% margin). The most profitable month is December 2025 ($17.9K).
- February has the lowest sales and the highest margin (17.2%) in the combined view, but it did so in 2023 to 2025 only: in 2026 its margin was 8.0%. With so little volume, this margin should be read with caution.
- Only two months lost money: July 2023 (−$841) and January 2024 (−$3,190).

## Scenario: Capping Discounts at 20%

The simulation reprices the 1,415 orders above 20% as if they had been sold at a 20% discount. It assumes that `sales` is already net of discount and that costs do not change.

| Scenario | Sales | Profit | Margin |
|---|---|---|---|
| Current | $2,326,534 | $292,297 | 12.6% |
| Cap at 20%, all orders kept | $2,546,749 | $512,511 | 20.1% |
| Cap at 20%, half of those orders kept | $2,254,261 | $470,415 | 20.9% |
| Those orders are lost entirely | $1,961,774 | $428,318 | 21.8% |

- Under these assumptions, profit lands between about **$428K and $512K**, against $292K today. Both ends of the range are higher than the current profit because the orders above 20% lose money.
- The upper end is optimistic. It assumes customers would buy the same quantity at a higher price (for an order discounted 50%, a 20% cap implies a price 60% higher). The lower end is the more conservative reading.
- This is an estimate on historical data, not a forecast.

## Recommendations

1. **Cap or review discounts above 20%.** They account for $136K of losses, and even losing those orders entirely would raise profit under the assumptions above.
2. **Review discounting in Central's Furniture and Office Supplies**, where average discounts are 29.7% and 25.4% and margins are −1.7% and 5.3%. Use West (10.9% average discount, 15.0% margin) as an internal benchmark.
3. **Audit Tables and Bookcases** to reprice, bundle or discontinue chronic loss-makers, and review Supplies and Machines.
4. **Test discount ranges before rolling out a cap**, to measure how much volume is lost when prices rise.

## Conclusion

The business grew over the period, but sales growth did not always translate into profit. The main driver of lost margin is discounts above 20%, and Central's gap versus the other regions is explained by deeper discounts on Furniture and Office Supplies, not by product mix. A few sub-categories (Tables, Bookcases and Supplies) also operate at a loss. The recommended next step is to test a discount cap on a limited scope and measure the volume response.

## Data and Limitations

- Source: Superstore Sales Dataset (Kaggle, CC0).
- **Dates:** the dataset includes orders through December 2026, which is after the date of this analysis. The dates were shifted to the 2023 to 2026 period, so the timeline should be read as a simulated period, not as real calendar results.
- The dataset is a sample and has no operating costs, so "profit" refers to the profit column in the data.
- Average discounts are simple averages per transaction, not weighted by sales.
- Calculations on regional gaps use rounded figures, so small differences are possible.
- The scenario assumes that costs do not change and that `sales` is net of discount.
