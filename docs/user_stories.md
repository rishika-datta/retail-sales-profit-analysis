# User Stories

These 15 user stories cover all 15 functional requirements (FR-01 to FR-15). The users are the **assumed stakeholders** from the BRD, and no real stakeholder interviews are involved.

---

## US-01: Overall Performance Snapshot (FR-01)

**As a** Senior Manager,  
**I want** to see total sales, profit, margin, orders, average order value and average discount at a glance,  
**so that** I can assess overall business performance without opening detailed reports.

### Acceptance Criteria

- Six KPI cards are displayed: Total Sales, Total Profit, Profit Margin, Total Orders, Average Order Value and Average Discount.
- Profit Margin is displayed as a percentage, and Sales and Profit are displayed as currency.
- The KPI cards update when slicers are applied.
- Total Orders uses a distinct count of Order IDs.

---

## US-02: Sales and Profit Over Time (FR-02)

**As a** Senior Manager,  
**I want** to see sales and profit by month,  
**so that** I can assess sales trends and whether profit is keeping pace with sales.

### Acceptance Criteria

- A monthly view displays both Sales and Profit.
- Months are displayed in chronological order.
- The user can filter the analysis by year.
- Data notes make clear that the dataset contains 2026 dates through December.

---

## US-03: Margin Trend (FR-03)

**As a** Finance Manager,  
**I want** to see profit margin over time,  
**so that** I can assess whether profitability is improving or worsening rather than looking only at profit dollars.

### Acceptance Criteria

- Profit Margin is displayed by month.
- Profit Margin is calculated as Total Profit ÷ Total Sales rather than as an average of row-level margins.
- Negative margin periods, where present, remain visible.
- The analysis responds to Region, Category and Segment filters.

---

## US-04: Profit by Category (FR-04)

**As a** Finance Manager,  
**I want** to analyze sales, profit and margin by product category,  
**so that** I can identify categories that contribute differently to profitability.

### Acceptance Criteria

- Sales, Profit and Margin are displayed for each category.
- Categories can be compared side by side.
- The analysis can be filtered by year, region and segment.
- Values update when applicable filters are applied.

---

## US-05: Sub-Category Profitability (FR-05)

**As a** Product Manager,  
**I want** to see profit by sub-category,  
**so that** I can identify which sub-categories generate profit and which generate losses.

### Acceptance Criteria

- All sub-categories are displayed and can be compared by profit.
- Loss-making sub-categories are clearly identifiable.
- The user can filter the analysis by category.
- Values update when slicers are applied.

---

## US-06: Top Products and High-Sales/Low-Profit Products (FR-06)

**As a** Product Manager,  
**I want** to see top products by sales and profit and identify products with high sales but low profit,  
**so that** I do not assume that a best-selling product is necessarily profitable.

### Acceptance Criteria

- Top products are shown by Sales and by Profit using Product Name.
- High-sales products with low or negative profit can be identified through a sales-versus-profit comparison.
- The analysis respects the active slicers.
- The number of products displayed is limited to keep the dashboard readable.

---

## US-07: Loss-Making Products (FR-07)

**As a** Finance Manager,  
**I want** to see a list of loss-making products,  
**so that** I can identify products generating negative profit for further review.

### Acceptance Criteria

- Only products with total Profit below zero are displayed.
- Each product shows its Sales and Profit.
- The list is ordered from largest loss to smallest loss.
- The list responds to the active filters.

---

## US-08: Regional Comparison (FR-08)

**As a** Regional Manager,  
**I want** to compare my region's sales, profit and margin with other regions,  
**so that** I can understand how regional performance compares.

### Acceptance Criteria

- All four regions are available for comparison.
- Sales, Profit and Margin are displayed for each region.
- The user can select a region using the Region slicer.
- Values update when Year, Category or Segment filters are applied.

---

## US-09: Customer Segment Performance (FR-09)

**As a** Sales Manager,  
**I want** to see sales and profit by customer segment,  
**so that** I can understand how different customer segments contribute to performance.

### Acceptance Criteria

- Consumer, Corporate and Home Office are displayed.
- Sales and Profit are displayed for each segment.
- Segment results update when Year, Region and Category filters are applied.

---

## US-10: Discount versus Profitability (FR-10)

**As a** Sales Manager,  
**I want** to see profit and margin across different discount levels,  
**so that** I can assess whether heavier discounting is associated with lower profitability.

### Acceptance Criteria

- Discount levels are grouped into clear bands.
- Profit and Margin are displayed for each discount band.
- The analysis clearly states that the observed relationship represents an association and does not establish causation.
- The analysis responds to the active filters.

---

## US-11: Filtering and Slicing (FR-11)

**As a** Dashboard User,  
**I want** to filter by Year, Region, Category and Segment,  
**so that** I can focus on the part of the business relevant to my analysis.

### Acceptance Criteria

- Slicers for Year, Region, Category and Segment are available.
- KPI cards and applicable visuals respond to the slicers.
- The user can clear applied filters.
- Combining multiple slicers produces the corresponding filtered results.

---

## US-12: Trustworthy Data (FR-12)

**As a** Senior Manager,  
**I want** clear notes about the data and how it was cleaned,  
**so that** I can understand the basis and limitations of the reported numbers.

### Acceptance Criteria

- A data-notes section states that the source is sample data.
- The notes explain that the dataset contains 2026 dates through December.
- The two exact duplicate rows are removed before analysis and this cleaning decision is documented.
- Dashboard totals reconcile with SQL totals using the same cleaned dataset.

---

## US-13: Quantified Discount Impact (FR-13)

**As a** Finance Manager,  
**I want** to quantify the sales and profit associated with transactions above a selected discount threshold,  
**so that** I can understand the financial exposure associated with higher discounting.

### Acceptance Criteria

- Transactions above the selected discount threshold are identified.
- The number of affected transaction lines is available.
- Sales associated with the affected transactions are quantified.
- Profit associated with the affected transactions is quantified.
- The analysis uses the cleaned dataset.
- Results describe an observed association and do not claim that discounting caused the observed profit outcome.

---

## US-14: Discount What-If Scenario (FR-14)

**As a** Sales Manager,  
**I want** to select a maximum discount and an assumed percentage of affected units lost,  
**so that** I can estimate how a discount-cap scenario could affect profit.

### Acceptance Criteria

- The user can select a Discount Cap.
- The user can select an assumed percentage of Units Lost.
- Transactions above the selected discount cap are repriced to the selected cap.
- Unit cost is held constant within the scenario.
- Baseline Profit is displayed.
- Scenario Profit is displayed.
- Scenario Profit Change is displayed.
- Average Price Increase Required is displayed.
- Scenario results update when the parameters change.
- Scenario assumptions are clearly displayed.
- The result is presented as an estimate, not a forecast.

---

## US-15: Loss Prioritization (FR-15)

**As a** Product Manager,  
**I want** to identify the products and sub-categories responsible for the largest losses,  
**so that** I can prioritize products for profitability review.

### Acceptance Criteria

- Loss-making products are identified using negative total profit.
- Products are ranked by loss amount.
- A Pareto analysis shows the cumulative share of total product losses.
- The Top 20 loss-making products are displayed.
- Loss by sub-category is displayed.
- The 10 highest-loss products are displayed in a prioritized review table.
- The analysis uses the cleaned dataset.

---

## Coverage Check

| Functional Requirement | User Story |
|---|---|
| FR-01 | US-01 |
| FR-02 | US-02 |
| FR-03 | US-03 |
| FR-04 | US-04 |
| FR-05 | US-05 |
| FR-06 | US-06 |
| FR-07 | US-07 |
| FR-08 | US-08 |
| FR-09 | US-09 |
| FR-10 | US-10 |
| FR-11 | US-11 |
| FR-12 | US-12 |
| FR-13 | US-13 |
| FR-14 | US-14 |
| FR-15 | US-15 |

**Coverage: 15/15 functional requirements covered.**