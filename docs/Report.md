# Sales & Profitability Analysis: Report

## Overview

This project analyzes 10,192 order lines (5,111 orders) from 2023 to 2026, focusing on discounts, product categories and sub-categories, regions, and the annual and monthly trends.

| Metric                | Value    |
|-----------------------|----------|
| Total sales           | $2.33M   |
| Total profit          | $292K    |
| Overall profit margin | 12.6%    |
| Order lines           | 10,192   |
| Orders                | 5,111    |
| Average ticket        | $455.13  |

The goal is to understand where profitability is strong, where it is weak, and what role discounts play.

## Key Findings

1. **Discounts above 20% are where margin is lost.** Order lines with no discount have a 29.6% margin, while those discounted by more than 20% add up to a net loss of about $136K across 1,414 order lines (−37.3% margin). Within them, the 874 order lines discounted 60% to 80% account for 57% of that loss ($77K) on only 2.8% of sales.
2. **Central's low margin is not a product-mix problem.** Central has a 7.9% margin against 15.0% in West, and its effective discount is 24.6% against 15.5% in West (about 1.6x). Furniture is 32.7% of Central's sales, in line with the other regions. About $26K of Central's roughly $30K profit gap versus the other regions comes from Office Supplies, where its effective discount is 32.4% (10.0% to 21.9% elsewhere). In Technology, Central's discount (16.4%) is no higher than West's (17.3%), and its margin (19.8%) is the highest of all regions. Clearance-level discounts (60% or more) are the clearest sign: 18.9% of Central's order lines are at that level against 3.1% in West, and without those lines Central's margin would be 15.9% against 16.8% in West.
3. **Furniture's weak margin is concentrated in two sub-categories.** Furniture has a 2.6% margin overall, but Tables (−8.5%) and Bookcases (−3.1%) operate at a loss. Supplies (−2.5%), in Office Supplies, is a third loss-maker.
4. **More sales did not always mean more profit.** November is the strongest month for sales, but December leads in profit. In 2024, sales fell 4.2% while profit rose 20%.

## Discounts and Profitability

| Discount tier | Order lines | Sales      | Profit    | Margin |
|---------------|-------------|------------|-----------|--------|
| No discount   | 4,924       | $1,105,225 | $326,683  | 29.6%  |
| Up to 20%     | 3,854       | $856,450   | $101,599  | 11.9%  |
| Above 20%     | 1,414       | $364,479   | −$136,009 | −37.3% |

- Order lines above 20% are 13.9% of the total and 15.7% of sales, yet they destroy $136K of profit.
- Order lines with no discount are 47.5% of sales and generate $326.7K in profit, more than the company's total profit of $292.3K.
- Without the order lines above 20%, the remaining business would have earned a 21.8% margin.

This is a strong association, but it is not proof of causation. High discounts may be concentrated in specific products or regions, which is why the regional analysis below compares discounts and margins within each category.

### Margin by discount level

| Discount | Order lines | Sales      | Profit    | Margin  |
|----------|-------------|------------|-----------|---------|
| 0%       | 4,924       | $1,105,225 | $326,683  | 29.6%   |
| 10%      | 96          | $54,952    | $9,100    | 16.6%   |
| 15%      | 52          | $27,559    | $1,419    | 5.1%    |
| 20%      | 3,706       | $773,939   | $91,080   | 11.8%   |
| 30%      | 229         | $104,193   | −$10,501  | −10.1%  |
| 32%      | 27          | $14,493    | −$2,391   | −16.5%  |
| 40%      | 207         | $116,498   | −$23,086  | −19.8%  |
| 45%      | 11          | $5,485     | −$2,493   | −45.5%  |
| 50%      | 66          | $58,919    | −$20,506  | −34.8%  |
| 60%      | 149         | $7,106     | −$6,164   | −86.7%  |
| 70%      | 424         | $40,805    | −$40,301  | −98.8%  |
| 80%      | 301         | $16,980    | −$30,565  | −180.0% |

- **20% is the last profitable level.** The margin is positive at every level up to 20% and negative at every level from 30%. Even at 20% the margin (11.8%) is slightly below the company average (12.6%), and that level holds 36% of all order lines.
- **The loss above 20% is concentrated in clearance-level discounts.** Order lines at 30% to 50% (540 lines, $299,588 of sales) lose $59.0K (−19.7%). Order lines at 60% to 80% (874 lines, 8.6% of the total, $64,891 of sales, 2.8% of all sales) lose $77.0K (−118.7%), which is 57% of the loss above 20%. For these lines the loss exceeds the revenue, which looks like clearance pricing rather than commercial discounting.
- Levels with few order lines (15%, 32% and 45%) give unstable margins and should not be read as a trend.

## Category and Sub-category Performance

Furniture has a 2.6% margin, far below Office Supplies (~17.2%) and Technology (~17.4%). The drill-down shows where the problem sits:

| Sub-category | Category        | Sales    | Profit   | Margin |
|--------------|-----------------|----------|----------|--------|
| Tables       | Furniture       | $208,020 | −$17,753 | −8.5%  |
| Bookcases    | Furniture       | $115,361 | −$3,632  | −3.1%  |
| Supplies     | Office Supplies | $46,725  | −$1,171  | −2.5%  |
| Machines     | Technology      | $189,925 | $3,462   | 1.8%   |
| Chairs       | Furniture       | $335,487 | $27,236  | 8.1%   |

- Tables and Bookcases together lose $21.4K on $323K of sales (−6.6%). The other two Furniture lines, Chairs and Furnishings, earn a combined 9.5%.
- Machines is profitable but barely (1.8% on $190K of sales), so it deserves review alongside the loss-makers.
- The highest margins are in Labels (43.9%), Paper (43.4%), Envelopes (42.3%) and Copiers (37.2%).

## Regional Performance

| Region  | Order lines | Sales    | Profit   | Margin | Effective discount |
|---------|-------------|----------|----------|--------|--------------------|
| West    | 3,253       | $739,814 | $110,799 | 15.0%  | 15.5%              |
| East    | 2,984       | $691,447 | $94,860  | 13.7%  | 19.3%              |
| South   | 1,620       | $391,722 | $46,749  | 11.9%  | 21.3%              |
| Central | 2,335       | $503,171 | $39,865  | 7.9%   | 24.6%              |

Central sells more than South but earns less profit: its margin is 7.9% against 11.9%, and it has the highest effective discount. The ranking of regions by discount is the reverse of their ranking by margin.

### Is it the region or the product mix?

Margin and effective discount by category within each region:

| Region  | Category        | Sales    | Profit  | Margin | Effective discount |
|---------|-----------------|----------|---------|--------|--------------------|
| Central | Furniture       | $164,538 | −$2,802 | −1.7%  | 23.2%              |
| Central | Office Supplies | $168,217 | $8,970  | 5.3%   | 32.4%              |
| Central | Technology      | $170,416 | $33,697 | 19.8%  | 16.4%              |
| East    | Furniture       | $211,851 | $3,421  | 1.6%   | 21.6%              |
| East    | Office Supplies | $211,658 | $42,997 | 20.3%  | 15.6%              |
| East    | Technology      | $267,938 | $48,442 | 18.1%  | 20.3%              |
| South   | Furniture       | $117,299 | $6,771  | 5.8%   | 16.2%              |
| South   | Office Supplies | $125,651 | $19,986 | 15.9%  | 21.9%              |
| South   | Technology      | $148,772 | $19,992 | 13.4%  | 24.4%              |
| West    | Furniture       | $260,680 | $12,316 | 4.7%   | 18.0%              |
| West    | Office Supplies | $226,367 | $54,070 | 23.9%  | 10.0%              |
| West    | Technology      | $252,767 | $44,412 | 17.6%  | 17.3%              |

- **Mix does not explain the gap.** Furniture is 32.7% of Central's sales, close to the other regions (29.9% to 35.2%, with West the highest).
- **If Central earned the margins the other three regions earn in each category, its profit would be about $70K (13.9% margin) instead of $39.9K.** The roughly $30K gap sits in Office Supplies (about $26K) and Furniture (about $9K), while Technology is about $5K ahead of the others. Office Supplies alone accounts for about 86% of the net gap.
- **The weak results sit where Central discounts the most.** In Office Supplies, Central's effective discount (32.4%) is the highest of any region-category pair, and its margin (5.3%) is far below the other regions (15.9% to 23.9%). In Furniture the difference in discount is smaller (23.2% against 16.2% to 21.6%).
- **Where Central's discount is not higher, its margin is not lower.** In Technology, Central's effective discount (16.4%) is below West's (17.3%), and its margin (19.8%) is the highest of all regions.

These figures are association, not proof of causation, and they are calculated from rounded values. Still, the pattern points to discounting in Central's Office Supplies, and to a lesser extent Furniture, not to the region or the product mix, as the main driver.

### Clearance-level discounts by region

| Region  | Order lines | Lines at 60%+ | % of lines | Sales at 60%+ | Profit at 60%+ | Margin | Margin without 60%+ |
|---------|-------------|---------------|------------|---------------|----------------|--------|---------------------|
| Central | 2,335       | 442           | 18.9%      | $23,668       | −$36,536       | 7.9%   | 15.9%               |
| South   | 1,620       | 132           | 8.1%       | $11,401       | −$8,404        | 11.9%  | 14.5%               |
| East    | 2,984       | 200           | 6.7%       | $19,899       | −$20,381       | 13.7%  | 17.2%               |
| West    | 3,253       | 100           | 3.1%       | $9,924        | −$11,709       | 15.0%  | 16.8%               |

- **Central holds 51% of the order lines at 60% or more** (442 of 874) while having 23% of all lines. In Central, 18.9% of order lines are at that level, against 3.1% in West (about 6 times) and 5.5% in the other three regions combined.
- **Those lines lose $36.5K in Central**, 47% of the $77.0K lost on clearance-level discounts across the company.
- **Without them, Central's gap nearly disappears.** Its margin would be 15.9% against 16.8% in West: the gap falls from 7.1 to 0.9 points (about 87% smaller), and Central would sit above South (14.5%).
- The last column removes those order lines; it is not a pricing simulation, and it is an association, not proof of causation.

## Regression Check

`notebooks/02_discount_regression.ipynb` models the margin of each order line (in percentage points) with West as the reference region and heteroskedasticity-robust standard errors. The dollar-weighted version (weighted by sales) matches the margin definition used in the rest of this report; the unweighted version counts every order line equally.

| Model                      | Central vs West, dollar-weighted | Central vs West, unweighted |
|----------------------------|----------------------------------|-----------------------------|
| A. Region only             | −7.05 pp                         | −32.50 pp                   |
| B. + sub-category          | −7.93 pp                         | −32.00 pp                   |
| C. + discount (linear)     | −3.91 pp                         | −6.12 pp                    |
| D. + discount bands        | +2.64 pp (95% CI 0.01 to 5.26)   | −5.84 pp                    |

- **Product mix does not explain Central's gap.** Controlling for sub-category leaves it unchanged in both versions. For South, in contrast, sub-category absorbs about half of the raw gap (−3.04 to −1.57 pp).
- **Discount is strongly associated with margin.** Each additional point of discount is associated with 1.63 points less margin (95% CI −1.75 to −1.50) in the dollar-weighted model and 1.99 points in the unweighted one.
- **Discount absorbs most of Central's gap.** A linear discount term absorbs about 45% of the dollar-weighted gap and about 81% of the unweighted gap. With discount bands, the dollar-weighted gap disappears (borderline), while the unweighted gap keeps a residual of about −6 pp, so whether discount explains all of it depends on the weighting.
- **West's advantage reverses.** With discount bands, East and South end up above West under both weightings, so West's margin advantage reflects lower discounting rather than better underlying margins.
- **The unweighted raw gap (−32.5 pp)** is driven by small, deeply discounted order lines, which are concentrated in Central (see the previous section).

These are associations, not causal effects.

## Annual Performance

| Year | Sales    | YoY growth | Profit  | Margin |
|------|----------|------------|---------|--------|
| 2023 | $493,660 | n/a        | $51,661 | 10.5%  |
| 2024 | $472,993 | −4.2%      | $62,021 | 13.1%  |
| 2025 | $613,934 | +29.8%     | $82,665 | 13.5%  |
| 2026 | $745,568 | +21.4%     | $95,926 | 12.9%  |

- 2024 was the only year with falling sales, yet profit rose from $51.7K to $62.0K because the margin improved by 2.6 points.
- Sales grew strongly in 2025 and 2026, and margins stayed around 13%.
- In 2026, sales grew 21% while the margin slipped from 13.5% to 12.9%, so more sales did not mean proportionally more profit.

## Monthly Performance

Adding the same calendar month across the four years:

| Month | Sales    | Profit  | Margin |
|-------|----------|---------|--------|
| Sep   | $308,884 | $37,235 | 12.1%  |
| Oct   | $207,126 | $33,215 | 16.0%  |
| Nov   | $352,567 | $35,506 | 10.1%  |
| Dec   | $330,218 | $44,230 | 13.4%  |
| Feb   | $59,751  | $10,295 | 17.2%  |

- Sales peak toward the end of the year. November has the highest sales ($352.6K), but December has the highest profit ($44.2K), and November's margin (10.1%) is below the average.
- The single strongest sales month is November 2026 ($118.5K), but it earned only $9.7K in profit (8.2% margin). The most profitable month is December 2025 ($17.9K).
- February has the lowest sales and the highest margin (17.2%) in the combined view, but it did so in 2023 to 2025 only: in 2026 its margin was 8.0%. With so little volume, this margin should be read with caution.
- Only two months lost money: July 2023 (−$841) and January 2024 (−$3,190).

## Scenario: Capping Discounts at 20%

The simulation reprices the 1,414 order lines above 20% as if they had been sold at a 20% discount. It assumes that `sales` is already net of discount and that costs do not change.

| Scenario                              | Sales      | Profit   | Margin |
|---------------------------------------|------------|----------|--------|
| Current                               | $2,326,154 | $292,273 | 12.6%  |
| Cap at 20%, all orders kept           | $2,546,328 | $512,448 | 20.1%  |
| Cap at 20%, half of those orders kept | $2,254,002 | $470,365 | 20.9%  |
| Those orders are lost entirely        | $1,961,675 | $428,282 | 21.8%  |

- Under these assumptions, profit lands between about **$428K and $512K**, against $292K today. Both ends of the range are higher than the current profit because the order lines above 20% lose money.
- The upper end is optimistic. It assumes customers would buy the same quantity at a higher price (for an order discounted 50%, a 20% cap implies a price 60% higher). The lower end is the more conservative reading.
- About 57% of the gain in the "all orders kept" case (estimated from the discount-level table) comes from the 874 order lines discounted 60% to 80%, where a 20% cap implies prices 2 to 4 times higher. That makes the lower end of the range the safer reading.
- This is an estimate on historical data, not a forecast.

## Recommendations

1. **Review clearance-level discounts (60% or more) first, then cap the 30% to 50% range.** Discounts above 20% account for $136K of losses, $77K of them from 874 order lines at 60% to 80%. Even losing those order lines entirely would raise profit under the assumptions above.
2. **Review discounting in Central, starting with its clearance-level discounts.** 18.9% of its order lines are at 60% or more (3.1% in West), and by category its Office Supplies and Furniture carry effective discounts of 32.4% and 23.2% with margins of 5.3% and −1.7%. Use West (15.5% effective discount) as an internal benchmark for discount levels.
3. **Audit Tables and Bookcases** to reprice, bundle or discontinue chronic loss-makers, and review Supplies and Machines.
4. **Test discount ranges before rolling out a cap**, to measure how much volume is lost when prices rise.

## Conclusion

The business grew over the period, but sales growth did not always translate into profit. The main driver of lost margin is discounts above 20%, and Central's gap versus the other regions is largely accounted for by deeper discounts, above all clearance-level ones (60% or more), and not by product mix. A few sub-categories (Tables, Bookcases and Supplies) also operate at a loss. The recommended next step is to test a discount cap on a limited scope and measure the volume response.

## Data and Limitations

- Source: Superstore Sales Dataset (Kaggle, CC0).
- **Reconciliation:** 10,194 raw rows, 2 exact duplicates removed (both from East Furniture, in 2023), 10,192 order lines analyzed. All totals in this report, the SQL results and the dashboard reconcile to the same 10,192 lines.
- **Dates:** the dataset includes orders through December 2026, which is after the date of this analysis. The dates were shifted to the 2023 to 2026 period, so the timeline should be read as a simulated period, not as real calendar results.
- The dataset is a sample and has no operating costs, so "profit" refers to the profit column in the data.
- **Discount definition:** discounts are measured as the effective rate (total discount amount divided by total list value, rebuilt from net sales and the discount column), which weights larger orders more than a simple average. Central has the highest discount and West the lowest under all three definitions tested; the size of the gap depends on the definition (simple average 24.1% against 10.9%, sales-weighted 15.5% against 12.8%, effective 24.6% against 15.5%).
- Calculations on regional gaps use rounded figures, so small differences are possible.
- The regression is observational and its standard errors are not clustered by order. The share of Central's gap absorbed by discount depends on weighting and specification (dollar-weighted: about 45% with a linear term and all of it with bands; unweighted: about 81%, with a residual of about −6 pp).
- Discount levels with few order lines (15%, 32% and 45%) give unstable margins.
- "Margin without 60%+" removes those order lines; it does not simulate a price change.
- The scenario assumes that costs do not change and that `sales` is net of discount.
