# Business Findings

The following findings are based on the cleaned Sample Superstore dataset and the supporting SQL and Power BI analysis.

---

## Finding 1: Sales and Profit Are Growing, but Monthly Profitability Varies

**Analysis references:** Sales & Profit by Year; Sales & Profit by Month; Profit Margin by Month

### Evidence

- Like-for-like January–September comparison shows sales increasing from **$377,188 in 2025 to $458,463 in 2026**, approximately **+21.5%**.
- Profit increased from **$44,471 to $66,908** over the same period, approximately **+50.5%**.
- Annual profit margins were **10.5% in 2023, 13.1% in 2024, 13.5% in 2025 and 12.9% in 2026**. The 2026 figure includes future-dated records through December.
- Monthly profit margin ranged from **–17.3% in January 2024 to +27.2% in October 2025**.
- Only two months recorded an overall loss: **July 2023 (–$841)** and **January 2024 (–$3,190)**.
- Across the 48 months, the share of monthly sales associated with discounts above 20% had a correlation of **–0.72** with monthly profit margin.
- In January 2024, **54.5% of sales** were associated with discounts above 20%, compared with a typical month of approximately 13%.
- July 2023 does not follow this pattern, with only **14.0%** of sales associated with discounts above 20%. The available analysis does not identify a clear explanation for that month's loss.

### Business Implication

Sales and profit have increased over the analyzed period, but monthly profitability varies considerably. Higher discount exposure is associated with lower monthly margins, although it does not explain every period of weak profitability.

---

## Finding 2: Discounts Above 20% Are Strongly Associated with Lower Profitability

**Analysis reference:** Profit & Margin by Discount Band

### Evidence

| Discount Band | Lines | Profit Margin | Lines Losing Money |
|---|---:|---:|---:|
| 0% | 4,924 | 29.6% | 0% |
| 1–20% | 3,758 | 11.5% | 14.0% |
| 21–40% | 463 | –15.3% | 90.3% |
| Above 40% | 951 | –77.4% | 100% |

- Lines above a 20% discount represent **13.9% of order lines** and **15.7% of sales**, while being associated with approximately **$136,000 in combined losses**.
- These transactions account for **1,369 of the 1,900 loss-making lines**, or approximately **72%**.
- The same general relationship appears within each product category rather than being isolated to a single category.
- The share of order lines above a 20% discount has remained relatively stable at approximately 14% across the analyzed years.

### Business Implication

Higher discount levels are strongly associated with lower profitability in this dataset and represent an important area for further review.

### Limitation

This is an observed association, not proof that discounting caused the losses. The dataset does not contain detailed cost information or direct list-price fields that would allow the underlying drivers of the losses to be established.

---

## Finding 3: Furniture Generates a Large Share of Sales but a Small Share of Profit

**Analysis references:** Sales, Profit & Margin by Category; Profit by Sub-Category

### Evidence

- Furniture generated **$754,367 in sales**, representing approximately **32.4% of total sales**.
- Furniture generated **$19,707 in profit**, representing approximately **6.7% of total profit**.
- Furniture's overall profit margin was **2.61%**, compared with substantially higher margins for Technology and Office Supplies.
- Furniture's annual margin remained between approximately **1.5% and 3.6%** across the analyzed years.
- **Tables** generated $208,020 in sales but recorded a **$17,753 loss**, equivalent to an **–8.5% margin**.
- **Bookcases** recorded a **$3,632 loss**.
- Table transactions with discounts of 30% or more recorded a **$30,790 loss**, while Table transactions below 30% discount generated **$13,037 in profit** and an **11.1% margin**.
- Excluding Tables and Bookcases, the remaining Furniture sub-categories generated approximately **$41,092 in profit**.

### Business Implication

Furniture's lower profitability is concentrated particularly in Tables and Bookcases rather than being uniform across all Furniture products. The Table results are associated with higher discount levels, providing an area for further profitability review.

---

## Finding 4: Central Has the Lowest Regional Profit Margin and Higher Discount Exposure

**Analysis reference:** Sales, Profit & Margin by Region

### Evidence

| Region | Profit Margin | Average Discount |
|---|---:|---:|
| Central | 7.92% | 24.1% |
| South | 11.93% | 14.7% |
| East | 13.72% | 14.3% |
| West | 14.98% | 10.9% |

- Central has the lowest profit margin at **7.92%**.
- **19.7% of Central's order lines** carry discounts above 40%, compared with **3.6% in West, 7.3% in East and 9.6% in South**.
- The 460 Central lines with discounts above 40% recorded a combined **$40,845 loss**, compared with Central's overall profit of **$39,865**.
- Excluding these lines, the remaining Central transactions generated approximately **$80,711 in profit** at a **17.1% margin**.
- Central's margin on undiscounted lines was **31.3%**, which is closer to the corresponding performance of other regions.
- Most of the Central region's highest discount exposure is concentrated in **Texas and Illinois**, particularly within Binders and Furnishings.

### Business Implication

Central's lower profitability coincides with substantially higher discount exposure than the other regions. This pattern supports further investigation of regional discounting practices and the products receiving the highest discounts.

### Limitation

The available data does not establish that regional discounting caused Central's lower overall margin. Other factors may also contribute.

---

## Finding 5: Losses Are Concentrated in a Small Number of Sub-Categories and Products

**Analysis references:** Profit by Sub-Category; High-Sales, Low-Profit Products; Top 10 Loss-Making Products; Loss-Making Products

### Evidence

- Binders, Tables and Machines account for **64.4% of the losses associated with loss-making order lines**, approximately **$101,186 of $157,027**, while representing approximately **26.0% of sales**.
- Binders have the highest average discount among these areas at **36.9%**.
- Binder transactions with discounts of 30% or more recorded approximately **$38,562 in losses**, while transactions below 30% generated a **40.9% margin**.
- Machines show a similar pattern, with approximately **$29,555 in losses at discounts of 30% or more**, compared with a **29.2% margin below 30%**.
- **300 of 1,849 products** are loss-making overall, representing approximately **$77,600 in net product losses on $559,058 in sales**.
- Among the top-selling products, **43 of the top 10% by sales (185 products)** are loss-making.
- The largest individual product loss is associated with the **Cubify CubeX 3D Printer Double Head Print**, at approximately **–$8,880**, with an average discount of approximately **53%**.

### Business Implication

Losses are concentrated enough that management could focus initial profitability review on a relatively small number of sub-categories and products rather than treating all products equally.

Higher discount exposure is also visible within Binders, Tables and Machines, although the analysis does not establish that discounting alone caused their losses.

---

## Finding 6: Customer Segments Have Relatively Similar Profitability

**Analysis reference:** Sales & Profit by Customer Segment

### Evidence

| Segment | Share of Sales | Share of Profit | Profit Margin |
|---|---:|---:|---:|
| Consumer | 50.3% | 46.7% | 11.65% |
| Corporate | 30.8% | 32.2% | 13.16% |
| Home Office | 18.9% | 21.1% | 14.03% |

- Consumer contributes the largest share of sales and profit in absolute terms.
- Profit margins differ by approximately **2.4 percentage points** across the three customer segments.
- The difference between segments is smaller than the profitability differences observed across product categories.

### Business Implication

Customer segments show relatively similar profitability compared with the larger differences observed across categories and products. Segment-level performance therefore appears less differentiated than product and discount-related profitability patterns in this dataset.

---

## What This Data Cannot Tell Us

### Causation

The analysis identifies associations between discounting and profitability, but it cannot establish that discounting caused the observed losses. The dataset does not contain detailed cost or direct list-price information.

### Returns

Sales and Profit are analyzed as recorded and are not adjusted for the **296 returned orders**, because the available Returns data does not reliably identify the individual returned product lines.

### 2026 Interpretation

Order dates extend through **December 2026**, including dates after the project analysis date. Therefore, 2026 should not be interpreted as a completed real-world year.

### Product Identification

Product-level findings use **Product Name** because inconsistencies were identified between Product IDs and Product Names in the source data.

### July 2023

July 2023 recorded an overall loss, but the available analysis did not identify a clear pattern that explains the result. This remains an unresolved observation rather than a conclusion.

---

## Overall Finding Summary

The analysis identifies several areas for further business review:

1. **Monthly profitability varies considerably even as overall sales and profit increase.**
2. **Higher discount levels are strongly associated with lower profitability.**
3. **Furniture has relatively weak profitability despite its large sales contribution.**
4. **Central has the lowest regional margin and substantially higher discount exposure.**
5. **Losses are concentrated in specific sub-categories and products.**
6. **Customer segments show comparatively similar profitability.**

These findings describe patterns in the available data and should be interpreted together with the documented data-quality limitations and assumptions.