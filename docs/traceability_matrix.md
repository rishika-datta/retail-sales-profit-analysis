# Requirements Traceability Matrix

## Retail Sales & Profit Analysis

This Requirements Traceability Matrix (RTM) maps each User Story to its corresponding Functional Requirement, implemented Power BI visual or analysis component, relevant dataset fields or measures, and intended business outcome.

The purpose of the matrix is to confirm that every functional requirement is represented in the project and that each dashboard or analysis component has a defined business purpose.

---

## 1. Traceability Matrix

| User Story | Requirement | Power BI Visual / Analysis Component | Dataset Fields / Measures | Business Outcome | Status |
|---|---|---|---|---|---|
| **US-01** Overall Performance Snapshot (Senior Manager) | FR-01 | Six KPI cards | `Sales`, `Profit`, `Order ID`, `Discount`; `[Total Sales]`, `[Total Profit]`, `[Profit Margin]`, `[Total Orders]`, `[AOV]`, `[Average Discount]` | Provides a high-level view of sales, profitability, order volume and discounting. | **Pass** |
| **US-02** Sales and Profit Over Time (Senior Manager) | FR-02 | Sales & Profit by Month | `Order Date`, `Sales`, `Profit`; `Month Start` / `Order Month` | Shows how sales and profit change over time. | **Pass** |
| **US-03** Margin Trend (Finance Manager) | FR-03 | Profit Margin by Month | `Order Date`, `Sales`, `Profit`; `[Profit Margin]` | Shows changes in profitability over time and makes negative-margin periods visible. | **Pass** |
| **US-04** Profit by Category (Finance Manager) | FR-04 | Sales, Profit & Margin by Category | `Category`, `Sales`, `Profit`; `[Profit Margin]` | Identifies differences in sales and profitability across categories. | **Pass** |
| **US-05** Sub-Category Profitability (Product Manager) | FR-05 | Profit by Sub-Category | `Sub-Category`, `Category`, `Profit` | Identifies profitable and loss-making sub-categories for further review. | **Pass** |
| **US-06** Top Products and High-Sales/Low-Profit Products (Product Manager) | FR-06 | Top 10 Products by Sales; Top 10 Products by Profit; High-Sales/Low-Profit Products scatter | `Product Name`, `Sales`, `Profit`, `Category`; `[Profit Margin]` | Distinguishes sales performance from profitability and identifies high-sales/low-profit products. | **Pass** |
| **US-07** Loss-Making Products (Finance Manager) | FR-07 | Loss-Making Products table | `Product Name`, `Sales`, `Profit` | Provides a list of products with negative total profit for further review. | **Pass** |
| **US-08** Regional Comparison (Regional Manager) | FR-08 | Sales, Profit & Margin by Region | `Region`, `Sales`, `Profit`; `[Profit Margin]` | Allows regional sales and profitability performance to be compared. | **Pass** |
| **US-09** Customer Segment Performance (Sales Manager) | FR-09 | Sales & Profit by Customer Segment | `Segment`, `Sales`, `Profit` | Shows how Consumer, Corporate and Home Office segments contribute to sales and profit. | **Pass** |
| **US-10** Discount versus Profitability (Sales Manager) | FR-10 | Profit & Margin by Discount Band | `Discount`, `Discount Band`, `Profit`, `Sales`; `[Profit Margin]` | Supports analysis of the association between discount levels and profitability without claiming causation. | **Pass** |
| **US-11** Filtering and Slicing (Dashboard User) | FR-11 | Year, Region, Category and Segment slicers | `Calendar[Year]`, `Region`, `Category`, `Segment` | Allows users to focus the analysis on a selected time period, region, category or customer segment. | **Pass** |
| **US-12** Trustworthy Data (Senior Manager) | FR-12 | Data Notes section | `Row ID`, `Order Date` and Orders fields; cleaned dataset | Makes important data assumptions, cleaning decisions and limitations visible to users. | **Pass** |
| **US-13** Quantified Discount Impact (Finance Manager) | FR-13 | Discount Impact analysis | `Discount`, `Sales`, `Profit`; discount threshold analysis | Quantifies the sales and profit associated with transactions above selected discount levels. | **Pass** |
| **US-14** Discount What-If Scenario (Sales Manager) | FR-14 | Discount What-If parameter controls, KPI cards, sub-category analysis and regional comparison | `Sales`, `Profit`, `Quantity`, `Discount`; `[Discount Cap Value]`, `[Units Lost Value]`, `[Baseline Profit]`, `[Scenario Profit]`, `[Scenario Profit Change]`, `[Average Price Increase Required]` | Estimates how a selected discount cap and assumed units lost could affect profit under stated assumptions. | **Pass** |
| **US-15** Loss Prioritization (Product Manager) | FR-15 | Loss Priorities — Pareto analysis, loss by sub-category and Top 10 loss table | `Product Name`, `Sub-Category`, `Sales`, `Profit`; `[Product Loss Amount]`, `[Product Loss Rank]`, `[Cumulative Loss %]` | Prioritizes products and sub-categories for profitability review based on loss magnitude. | **Pass** |

---

## 2. Coverage Check

| Check | Result |
|---|---|
| Every user story maps to a functional requirement | Yes — US-01 to US-15 map to FR-01 to FR-15 |
| Every functional requirement has an implemented dashboard or analysis component | Yes |
| All six KPIs in the BRD are represented | Yes |
| Monthly sales, profit and margin analysis is included | Yes |
| Category and sub-category profitability analysis is included | Yes |
| Product and loss-making product analysis is included | Yes |
| Regional and customer segment analysis is included | Yes |
| Discount and profitability analysis is included | Yes |
| Quantified discount impact analysis is included | Yes |
| Discount What-If scenario analysis is included | Yes |
| Loss prioritization analysis is included | Yes |
| Required slicers are included | Yes |
| Data Notes are included | Yes |
| Requirements covered | **15 / 15** |
| Overall traceability status | **100% Complete** |

---

## 3. Non-Functional Requirements

| NFR | How It Is Addressed |
|---|---|
| **Usability** | The report is organized across three Power BI pages with clearly labelled KPI cards, charts, tables, slicers and scenario controls. |
| **Performance** | The cleaned dataset contains approximately 10,000 order lines and is designed for interactive Power BI analysis. |
| **Accuracy** | Dashboard calculations were checked against SQL analysis using the same cleaned dataset. Profit Margin is calculated as total Profit divided by total Sales. |
| **Maintainability** | DAX measures, calculated columns, SQL queries and data-cleaning decisions are documented separately. |
| **Data Refresh** | The dashboard is based on the cleaned CSV dataset. The source can be replaced and the Power BI report refreshed. Automated refresh is outside the project scope. |
| **Documentation of Limitations** | Important data limitations and assumptions are documented in the Data Notes and project documentation. |
| **Scenario Transparency** | Discount What-If outputs display the assumptions used. The scenario is presented as an estimate rather than a forecast, and derived list-price and unit-cost calculations are documented. |

---

## 4. Data and Calculation Traceability

The project uses the cleaned Superstore Orders dataset as the primary analytical data source.

### Key Calculations

- **Total Sales** = Sum of `Sales`
- **Total Profit** = Sum of `Profit`
- **Profit Margin** = Total Profit / Total Sales
- **Total Orders** = Distinct count of `Order ID`
- **Average Order Value** = Total Sales / Total Orders
- **Average Discount** = Average of `Discount`
- **Discount Band** = Calculated grouping based on `Discount`
- **Order Year** = Year extracted from `Order Date`
- **Order Month** = Year-month grouping based on `Order Date`
- **Calendar** = Dedicated date table used for time-based analysis
- **Product Loss Amount** = Negative total product profit converted to a positive loss amount
- **Product Loss Rank** = Ranking of products by loss amount
- **Cumulative Loss %** = Cumulative product loss divided by total product loss
- **Baseline Profit** = Total Profit under the selected filter context
- **Scenario Profit** = Estimated profit after applying the selected discount-cap assumptions
- **Scenario Profit Change** = Scenario Profit minus Baseline Profit
- **Average Price Increase Required** = Estimated average price adjustment required for transactions above the selected discount cap

### Product-Level Analysis

Product-level analysis uses **Product Name** rather than Product ID because inconsistencies were identified between Product IDs and Product Names in the source dataset.

### Discount What-If Calculations

The Discount What-If scenario derives list price per unit and cost per unit from:

- `Sales`
- `Quantity`
- `Discount`
- `Profit`

The source dataset does not contain direct list-price or unit-cost fields.

---

## 5. Data Quality and Trust

The cleaned dataset is used consistently across SQL and Power BI.

### Duplicate Removal

Two exact duplicate rows were identified and removed before analysis:

- Row ID 392
- Row ID 1700

These rows were exact repetitions of existing records apart from their Row ID values.

### Other Documented Limitations

- The dataset contains future-dated 2026 records through December.
- Returns are not adjusted in the profitability calculations because the available Returns data does not reliably identify returned product lines.
- Product IDs and Product Names are not completely consistent.
- Canadian records are retained under their assigned regions.
- Customer-level analysis is limited by identified customer-data inconsistencies.
- The dataset is a public sample dataset rather than real company data.

Dashboard totals were cross-checked against SQL calculations using the same cleaned dataset.

---

## 6. Business Outcome Traceability

The dashboard and analysis support the following business areas:

- Overall sales and profitability performance
- Sales, profit and margin trends
- Category and sub-category profitability
- Product sales, profit and loss analysis
- Regional and customer segment performance
- Discount and profitability analysis
- Quantified sales and profit associated with higher discount levels
- Discount-cap scenario analysis
- Prioritization of loss-making products and sub-categories

The project provides descriptive analysis and scenario-based analysis. Observed relationships, particularly between discounting and profitability, are treated as associations rather than proof of causation.

The Discount What-If analysis is an estimate based on stated assumptions and is not a forecast.

---

## 7. Final Traceability Statement

All 15 functional requirements defined in the Business Requirements Document have corresponding user stories and implemented dashboard or analysis components.

The traceability review confirms:

- **15 / 15 functional requirements covered**
- **15 / 15 user stories mapped**
- **All required dashboard and analysis components represented**
- **Key calculations documented**
- **Known data limitations documented**
- **Scenario assumptions documented**

**Overall RTM Status: 100% Complete**