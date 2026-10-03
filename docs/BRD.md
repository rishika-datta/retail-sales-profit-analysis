# Retail Sales & Profit Analysis: Business Requirements Document

| Field | Details |
|---|---|
| **Version** | 1.0 |
| **Prepared by** | Business Analyst (portfolio case study) |
| **Data Source** | Sample Superstore dataset, Orders sheet |
| **Status** | Final |

> **Portfolio disclaimer:** This is a fictional case study built on a public sample dataset. The stakeholders are **assumed**, and no real stakeholder interviews took place.

---

## 1. Business Objective

Management has observed changes in sales performance but does not have clear visibility into the factors associated with profitability.

This project delivers a three-page Power BI report supported by SQL analysis and documented business requirements so management can:

- see how sales and profit change over time
- identify which categories, sub-categories and products contribute to profit or loss
- identify underperforming regions
- assess whether higher discounts are associated with lower profit
- compare customer segments
- quantify sales and profit associated with higher discounting
- evaluate an estimated discount-cap scenario under stated assumptions
- prioritize products responsible for the largest losses

**Success criteria:** The major business questions can be answered from the Power BI report, dashboard totals reconcile with SQL results using the same cleaned dataset, and the Discount What-If and Loss Prioritization analyses clearly document their assumptions and limitations.

---

## 2. Stakeholders

These are **assumed stakeholder roles for a portfolio case study** and do not represent real stakeholders or interview participants.

| Stakeholder | Role in this Project | Main Need |
|---|---|---|
| Senior Management | Decision maker and sponsor | High-level view of sales and profit performance |
| Sales Manager | Dashboard user | Sales trends, segment performance and discounting patterns |
| Finance Manager | Dashboard user | Profit, margin and sources of loss |
| Product Manager | Dashboard user | Category, sub-category and product performance |
| Regional Manager | Dashboard user | Comparison of regional performance |

---

## 3. Functional Requirements

Priority follows the MoSCoW approach:

- **M** = Must Have
- **S** = Should Have

| ID | Requirement | Priority |
|---|---|---|
| FR-01 | The dashboard shall display six KPI cards: Total Sales, Total Profit, Profit Margin, Total Orders, Average Order Value and Average Discount. | M |
| FR-02 | The dashboard shall show monthly sales and profit trends over time. | M |
| FR-03 | The dashboard shall show profit margin over time so users can assess changes in profitability rather than profit dollars alone. | M |
| FR-04 | The dashboard shall show sales, profit and margin by product category. | M |
| FR-05 | The dashboard shall show profit by sub-category, with loss-making sub-categories clearly visible. | M |
| FR-06 | The dashboard shall identify top products by sales and profit and highlight high-sales/low-profit products. | S |
| FR-07 | The dashboard shall list loss-making products with total profit below zero, together with their sales and profit. | M |
| FR-08 | The dashboard shall show sales, profit and margin by region. | M |
| FR-09 | The dashboard shall show sales and profit by customer segment. | M |
| FR-10 | The dashboard shall show profit and margin by discount level so users can assess the association between discounting and profitability. | M |
| FR-11 | The dashboard shall provide slicers for Year, Region, Category and Segment, with visuals and KPI cards responding to the selected filters. | M |
| FR-12 | The dashboard shall include concise data notes stating that the source is sample data, 2026 contains future-dated records relative to the analysis date, and two exact duplicate rows were removed before analysis. | S |
| FR-13 | The analysis shall quantify the sales, profit and transaction-line count associated with transactions above a selected discount threshold. | M |
| FR-14 | The dashboard shall provide a Discount What-If scenario allowing users to select a maximum discount and an assumed percentage of affected units lost, and shall estimate the resulting change in profit. The scenario assumptions shall be clearly displayed. | M |
| FR-15 | The dashboard shall provide a Loss Prioritization analysis identifying products that account for the largest share of total product losses, including a Pareto analysis, loss by sub-category and a ranked Top 10 review list. | M |

**Analytical principle:** Relationships observed in the data, particularly between discounting and profitability, are treated as associations. The analysis does not claim that discounting caused the observed profit outcomes.

---

## 4. Non-Functional Requirements

| Category | Requirement |
|---|---|
| **Usability** | The report shall use clear labels, consistent visual conventions and intuitive navigation. The main Overview page shall present the core business KPIs and analysis in a single page. |
| **Performance** | Visuals should refresh within a few seconds when slicers or scenario parameters are changed. The cleaned dataset contains approximately 10,000 order lines. |
| **Accuracy** | Dashboard calculations shall reconcile with SQL results using the same cleaned dataset. Profit Margin shall be calculated from total Profit divided by total Sales rather than by averaging row-level margins. |
| **Maintainability** | DAX measures, calculated columns, SQL queries and data-cleaning decisions shall be documented so the analysis can be understood and reproduced. |
| **Data Refresh** | The report is based on a static cleaned dataset. The source can be replaced and the Power BI report refreshed. Automated refresh is outside the project scope. |
| **Documentation of Limitations** | Known limitations, including unadjusted returns, inconsistent Product IDs, retained Canadian records and future-dated 2026 records, shall be documented rather than hidden. |
| **Scenario Transparency** | Discount What-If outputs shall clearly display the assumptions used. The scenario shall be presented as an estimate rather than a forecast, and derived list-price and unit-cost calculations shall be documented. |

---

## 5. Key Performance Indicators

| KPI | Definition | Calculation | Business Purpose |
|---|---|---|---|
| **Total Sales** | Revenue recorded across order lines within the selected filters | Sum of `Sales` | Shows overall sales volume |
| **Total Profit** | Profit recorded across order lines within the selected filters | Sum of `Profit` | Shows overall profitability |
| **Profit Margin** | Profit as a percentage of sales | Total Profit ÷ Total Sales | Allows profitability to be compared across business areas of different sizes |
| **Total Orders** | Number of distinct orders | Distinct count of `Order ID` | Shows order volume |
| **Average Order Value (AOV)** | Average sales value per order | Total Sales ÷ Total Orders | Shows average value generated per order |
| **Average Discount** | Average discount across order lines | Average of `Discount` | Shows the overall level of discounting |

---

## 6. Analytical Scenarios

### 6.1 Discount What-If Analysis

The Discount What-If analysis allows users to select:

- a maximum discount cap
- an assumed percentage of affected units lost

Transactions above the selected discount cap are repriced to the selected cap.

The scenario assumes:

- unit cost remains constant
- transactions at or below the selected cap retain their recorded profit
- transactions above the selected cap are repriced to the selected cap
- the assumed Units Lost percentage is applied to the affected scenario profit

Because the source dataset does not contain direct list-price or unit-cost fields, these values are derived from:

- `Sales`
- `Quantity`
- `Discount`
- `Profit`

The scenario is an **estimate based on stated assumptions, not a forecast**.

The scenario should be interpreted as a sensitivity analysis rather than a prediction of actual future business results.

---

### 6.2 Loss Prioritization Analysis

The Loss Prioritization analysis focuses on products with negative total profit.

It includes:

- ranking products by loss amount
- identifying the Top 20 loss-making products
- showing cumulative loss through a Pareto analysis
- showing loss by sub-category
- providing a prioritized Top 10 loss-making product review list

The purpose is to identify areas that account for a substantial share of observed product-level losses and may therefore warrant further business investigation.

---

## 7. Data Quality and Analysis Considerations

The analysis uses a cleaned version of the Sample Superstore Orders data.

The following decisions and limitations apply:

- Two exact duplicate rows were removed before analysis.
- Product-level analysis uses **Product Name** because inconsistencies were identified between Product IDs and Product Names.
- Canadian records are retained under their assigned regions.
- Returns are not adjusted because the Returns data identifies returned orders but does not reliably identify the individual returned order lines.
- The dataset contains future-dated 2026 records. Therefore, 2026 is not treated as a completed real-world year.
- The dataset does not contain detailed cost or expense fields.
- Observed relationships between variables do not establish causation.
- Customer-level analysis is limited because of data-quality considerations affecting one customer name and multiple Customer IDs.
- The dataset is a public sample dataset and does not represent real company data.

---

## 8. Data and Calculation Principles

The following calculation principles apply throughout the project:

- **Total Orders** uses a distinct count of `Order ID`, because a single order can contain multiple order lines.
- **Profit Margin** is calculated as total Profit divided by total Sales.
- **Average Order Value** is calculated as total Sales divided by distinct Total Orders.
- **Average Discount** is calculated as the average of the recorded Discount values.
- Product analysis uses `Product Name` rather than `Product ID`.
- SQL and Power BI use the same cleaned dataset.
- Dashboard totals are cross-checked against SQL calculations.
- Discount What-If calculations use derived list-price and unit-cost values because those fields are not directly available in the source data.

---

## 9. Business Requirements Summary

The requirements cover the following business areas:

1. Overall sales and profitability performance
2. Sales and profit trends
3. Profit margin trends
4. Category profitability
5. Sub-category profitability
6. Product performance
7. Loss-making products
8. Regional performance
9. Customer segment performance
10. Discount and profitability analysis
11. Interactive filtering
12. Data transparency and quality notes
13. Quantified discount-impact analysis
14. Discount What-If scenario analysis
15. Loss prioritization and Pareto analysis

---

## 10. Requirement Completion Criteria

The project requirements are considered satisfied when:

- all six required KPI cards are available
- monthly sales and profit trends are available
- margin trends are available
- category and sub-category profitability can be analyzed
- product performance and loss-making products can be identified
- regional and segment performance can be compared
- discount and profitability relationships can be analyzed
- required slicers are available and responsive
- data-quality notes are documented
- quantified discount analysis is available
- the Discount What-If scenario is functional and transparent
- Loss Prioritization includes Pareto, sub-category and Top 10 analysis
- dashboard calculations reconcile with SQL results
- assumptions and limitations are documented

---

## 11. Portfolio Disclaimer

This is a **portfolio case study using the Sample Superstore dataset**.

The stakeholders, business requirements, analysis objectives and recommendations are assumed for demonstration purposes. They do not represent a real company's internal data, stakeholder interviews or business decisions.