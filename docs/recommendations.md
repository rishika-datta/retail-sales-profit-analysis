# Business Recommendations

The recommendations below are based on the findings from the Sales & Profit Analysis. They are intended as business actions for further investigation and decision-making, not as proof of causation.

---

## Recommendation 1: Add a Review Step for Discounts Above 20%

**Findings addressed:** Finding 1 — Sales and profit are growing, but monthly margin varies widely; Finding 2 — Discounts above 20% are strongly associated with losses; Finding 5 — Losses are concentrated in three sub-categories and a few hundred products.

### Problem

Order lines with discounts above 20% represent a relatively small share of the dataset but are associated with approximately **$136,000 in combined losses** and approximately **72% of all loss-making lines**.

Higher discount exposure is also associated with lower monthly profit margins, although it does not explain every month with weak profitability.

### Recommended Action

Introduce a review step for discounts above 20%, with particular attention to transactions above 40%.

The review could initially focus on **Binders, Tables and Machines**, which account for a large share of the observed losses.

Track the share of sales associated with discounts above 20% and monthly Profit Margin on the dashboard to monitor changes over time.

### Business Owner

Sales Manager / Finance Manager

### Suggested Next Analysis

- Review discount levels by product and sub-category.
- Identify products that remain loss-making at high discount levels.
- Compare discount levels with recorded profit before changing discount policy.
- Investigate whether high discounts are concentrated in particular regions or product groups.
- Monitor monthly Profit Margin to identify periods of unusual profitability variation.

### Expected Business Benefit

Reviewing high-discount transactions could help identify and investigate areas where losses are concentrated.

The observed loss amount should **not** be treated as a potential savings estimate because some transactions may depend on the discount to generate sales.

### Important Limitation

The dataset does not contain detailed cost or price-list information. Therefore, the analysis cannot establish that discounting itself caused the observed losses or predict the financial effect of changing discount policy.

---

## Recommendation 2: Review Discounting Practice in the Central Region

**Finding addressed:** Finding 4 — Central region has the lowest margin and higher discount exposure.

### Problem

Central has the lowest regional profit margin at **7.92%** and the highest average discount at **24.1%**.

Approximately **19.7% of Central's lines carry discounts above 40%**, compared with 3.6% to 9.6% in the other regions. These heavily discounted Central lines recorded approximately **$40,845 in losses**.

### Recommended Action

Have the Regional Manager and Finance Manager review how large discounts are approved in the Central region, beginning with **Texas and Illinois** and the **Binders and Furnishings** product areas.

Compare Central's discounting patterns with other regions to identify differences in discount exposure and profitability.

### Business Owner

Regional Manager / Sales Manager / Finance Manager

### Suggested Next Analysis

- Compare Central's discount levels by state.
- Identify products and sub-categories receiving the highest discounts.
- Compare the profitability of the same products across regions.
- Review whether high discounts are concentrated among particular product groups.
- Investigate the commercial reasons for higher discount levels in Central.

### Expected Business Benefit

A regional review could help identify specific discounting practices associated with Central's lower profitability and provide evidence for future commercial decisions.

### Important Limitation

The data shows that higher discount exposure coincides with weaker profitability in Central. It does not prove that discounting alone caused the region's lower margin.

---

## Recommendation 3: Review Pricing and Discount Rules for Tables and Bookcases

**Findings addressed:** Finding 3 — Furniture is a third of sales but under 7% of profit; Finding 5 — Losses are concentrated in three sub-categories and a few hundred products.

### Problem

Furniture represents approximately **32.4% of sales** but only **6.7% of profit**.

Tables record approximately **$17,753 in losses**, while Bookcases record approximately **$3,632 in losses**.

Higher-discount transactions within these sub-categories show substantially weaker profitability.

### Recommended Action

Have the Product Manager and Finance Manager review pricing, cost and discount rules for Tables and Bookcases.

One scenario for further analysis is whether discount thresholds should be reviewed, particularly around the 30% level.

### Business Owner

Product Manager / Finance Manager

### Suggested Next Analysis

- Review profitability of individual Tables and Bookcases products.
- Compare profitability above and below the 30% discount level.
- Examine discount levels associated with loss-making products.
- Review actual product costs and pricing information.
- Identify high-sales products with negative or very low margins.
- Assess whether product mix contributes to Furniture's lower profitability.

### Expected Business Benefit

A focused review could identify products or pricing practices contributing to Furniture's low profitability and provide evidence for future pricing or discount decisions.

### Important Limitation

The current dataset does not contain detailed product cost information. The observed relationship between discounts and profitability should therefore be treated as an association rather than proof that changing discounts would automatically improve profit.

---

## Recommendation 4: Review a Shortlist of Loss-Making, High-Sales Products

**Finding addressed:** Finding 5 — Losses are concentrated in three sub-categories and a few hundred products.

### Problem

A relatively small group of products accounts for a substantial share of the observed losses.

The analysis identifies **300 of 1,849 products as loss-making overall**, with approximately **$77,600 in net product losses on $559,058 in sales**.

High sales do not necessarily indicate high profitability.

### Recommended Action

Create a focused review list of loss-making and high-sales/low-profit products using the Loss Priorities analysis.

For each product, review whether the appropriate business response is to investigate discounting, pricing, cost, product mix or the product's strategic role.

### Business Owner

Product Manager / Finance Manager

### Suggested Next Analysis

- Review the highest-loss products using the Loss Priorities analysis.
- Examine high-sales products with low or negative margins.
- Review discount levels associated with the highest-loss products.
- Investigate whether losses are repeated across periods.
- Review actual product costs before making pricing or product decisions.
- Identify whether any loss-making products serve a deliberate strategic purpose.

### Expected Business Benefit

A focused product-level review could help management concentrate attention on the products contributing most to observed losses instead of applying broad changes across the entire product portfolio.

### Important Limitation

Product-level analysis uses **Product Name** because inconsistencies were identified between Product IDs and Product Names in the source dataset.

---

## How You Would Know It Worked

The following metrics can be monitored on the dashboard after any business action is implemented.

| Recommendation | Metric to Track |
|---|---|
| 1. High-discount review | Share of sales above 20% discount; monthly Profit Margin |
| 2. Central-region review | Central Profit Margin; share of Central lines above 40% discount |
| 3. Furniture review | Furniture Profit Margin; Tables Profit Margin |
| 4. Product profitability review | Number of loss-making products; total product loss |

These metrics indicate whether the observed patterns are changing over time. They do not by themselves establish that a particular business action caused the change.

---

## What This Analysis Does Not Recommend

### No Segment-Wide Changes

Finding 6 shows that customer segments have relatively similar profitability. The analysis therefore does not provide a strong basis for targeting or dropping a particular customer segment.

Customer segment performance should continue to be monitored, with further investigation performed if meaningful differences emerge over time.

### No Guaranteed Profit Increase

The analysis does not provide a specific expected profit increase from changing discounts, prices or products.

The dataset does not contain detailed cost information or evidence about how customers would respond to pricing changes.

### No Explanation for July 2023

July 2023 recorded an overall loss, but the available analysis did not identify a clear pattern explaining that result.

It should therefore remain an unresolved observation rather than being assigned a specific business cause.

---

## Recommendation Summary

The analysis supports four main areas for further business investigation:

1. **Review high-discount transactions**, while monitoring monthly profitability.
2. **Review discounting practices in the Central region.**
3. **Review pricing and discount rules for Tables and Bookcases.**
4. **Review loss-making and high-sales/low-profit products.**

These recommendations are based on observed patterns in the cleaned Sample Superstore dataset. They should be validated with detailed cost, pricing, commercial and operational information before any business policy or pricing changes are implemented.