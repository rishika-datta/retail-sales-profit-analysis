# Retail Sales & Profit Analysis — Project Plan

**Project Type:** Business Analyst Portfolio Case Study  
**Dataset:** Sample Superstore  
**Tools:** SQL, Power BI, DAX, Excel, Markdown/GitHub  
**Status:** Portfolio Project — Completed

---

## 1. Project Title

**Retail Sales & Profit Analysis: Dashboard, Business Requirements Document and Discount What-If**

*Sample Superstore case study using SQL, Power BI and DAX.*

---

## 2. Business Problem Statement

Management at a retail company has noticed changes in sales performance but does not have clear visibility into the factors associated with profitability.

Sales figures alone do not show whether the business is generating healthy profit. Management needs to understand:

- which categories, sub-categories and products contribute to profit or loss
- which regions and customer segments perform differently
- where high sales are accompanied by weak profitability
- how discount levels are associated with profit
- which loss-making products and sub-categories should receive further review

The project focuses on transforming transactional sales data into structured business insights that can support management review and decision-making.

---

## 3. Business Objectives

The project aims to:

1. Track sales, profit and profitability trends over time.
2. Analyze performance by category, sub-category and product.
3. Compare performance across regions and customer segments.
4. Identify high-sales/low-profit and loss-making products.
5. Quantify sales and profit associated with higher discount levels.
6. Provide a parameter-driven Discount What-If analysis in Power BI.
7. Prioritize loss-making products and sub-categories using a Pareto-style analysis.
8. Document business requirements, user stories and requirements traceability.
9. Present evidence-based findings and recommendations.

**Analytical principle:** The project identifies patterns and associations in the data. It does not claim that an observed relationship, such as discount and profit, proves causation.

---

## 4. Project Scope

### 4.1 In Scope

- Orders data from the Sample Superstore dataset.
- Sales, profit, profit margin, order count, average order value and discount analysis.
- Time-based analysis.
- Category and sub-category analysis.
- Product-level analysis.
- Regional analysis.
- Customer-segment analysis.
- Identification of high-sales/low-profit products.
- Identification and prioritization of loss-making products.
- Discount-band analysis.
- Quantified analysis of transactions above selected discount thresholds.
- Discount What-If scenario analysis.
- Loss prioritization and Pareto analysis.
- SQL analysis and validation.
- Power BI dashboard and DAX calculations.
- Business Requirements Document (BRD).
- User stories with acceptance criteria.
- Requirements Traceability Matrix (RTM).
- Findings and recommendations.
- Portfolio README and supporting documentation.

### 4.2 Supporting Fields

Ship Mode may be used as a supporting field if it provides a relevant business finding. It is not a primary analysis requirement.

---

## 5. Out of Scope

The following items are intentionally excluded from the analytical scope:

- **Return adjustments:** The Returns sheet flags orders but does not identify which individual order lines were returned or refunded. Sales and Profit are therefore analyzed as recorded, with this limitation documented.
- **Forecasting and predictive modeling:** The project does not include forecasting, machine learning or predictive modeling.
- **Detailed cost-structure analysis:** The dataset contains Profit but does not provide a detailed cost or expense breakdown.
- **Customer lifetime value or churn analysis:** Customer-level analysis is limited because of data-quality considerations, including inconsistent Customer IDs for one customer name.
- **Postal-code geographic mapping:** Postal-code mapping is outside the project scope.
- **Real stakeholder interviews:** Stakeholders are assumed for this portfolio case study; no real company interviews are represented.
- **Real company data:** Sample Superstore is used as a case-study dataset.
- **Automated refresh pipelines:** Data-refresh automation is not implemented.
- **Causal analysis:** The project does not attempt to prove that discounting causes changes in profit.

---

## 6. Stakeholders

These are **assumed stakeholder roles for a portfolio case study**, not real stakeholders or interview participants.

| Stakeholder | Primary Interest |
|---|---|
| Senior Management | Overall sales and profit performance and business direction |
| Sales Manager | Sales trends, segment performance and discounting patterns |
| Finance Manager | Profit, margin and loss areas |
| Product Manager | Category, sub-category and product performance |
| Regional Manager | Regional sales and profitability performance |

---

## 7. Assumptions and Data-Quality Decisions

1. The Sample Superstore file is treated as a sample dataset representing a retail business case study.
2. The original Orders sheet contains 10,194 rows. Two exact duplicate rows were identified and removed from the cleaned analysis dataset.
3. The cleaned dataset therefore contains **10,192 order lines** and **5,111 distinct orders**.
4. The dataset contains future-dated 2026 order records relative to the project analysis date. Therefore, 2026 is treated cautiously and is not presented as a completed real-world year.
5. Sales, Profit and Discount are treated as recorded source values.
6. Product-level analysis uses **Product Name** rather than Product ID because inconsistencies were identified between product IDs and product names.
7. Canadian rows remain in the analysis under their assigned regions and are documented as a limitation.
8. Profit margin is calculated as total Profit divided by total Sales rather than by averaging individual row margins.
9. Discount is stored as a decimal fraction; for example, `0.20` represents a 20% discount.
10. The cleaned dataset is used consistently across SQL and Power BI.
11. The Discount What-If analysis derives list price per unit and cost per unit from Sales, Quantity, Discount and Profit because direct list-price and cost fields are not available.
12. The Discount What-If analysis is an estimate based on stated assumptions, not a forecast.

---

## 8. Constraints

- The project uses a single sample dataset and no live business data connection.
- Detailed cost information is unavailable.
- Returns cannot be reliably allocated to individual product lines.
- Future-dated records limit interpretation of 2026 as a completed year.
- Observational relationships cannot establish causation.
- Power BI Desktop is required to open and interact with the dashboard.
- The Discount What-If analysis depends on derived values because list price and unit cost are not directly provided.

---

## 9. Project Deliverables

| # | Deliverable | Description |
|---|---|---|
| 1 | Project Plan | Defines the business problem, objectives, scope, stakeholders, assumptions and constraints. |
| 2 | Business Requirements Document | Defines the business and functional requirements for the analysis and dashboard. |
| 3 | User Stories | Translates the requirements into user stories with acceptance criteria. |
| 4 | Data Analysis | Documents data-quality checks, cleaning decisions and baseline business analysis. |
| 5 | SQL Analysis | Provides SQL queries used to answer and validate the major business questions. |
| 6 | Power BI Dashboard | Provides an interactive view of sales, profit, margin, products, regions, segments and discounts. |
| 7 | DAX Calculations | Contains the measures and calculations supporting the dashboard and analytical scenarios. |
| 8 | Requirements Traceability Matrix | Links requirements to user stories, implementation and validation. |
| 9 | Business Findings | Summarizes the key patterns and insights identified from the analysis. |
| 10 | Business Recommendations | Provides evidence-based areas for management to review based on the findings. |
| 11 | Discount What-If Analysis | Provides a parameter-driven scenario for evaluating the potential effect of applying a maximum discount level. |
| 12 | Loss Prioritization Analysis | Identifies and prioritizes products and sub-categories associated with the largest losses. |
| 13 | Portfolio README | Documents the project, methodology, findings, assumptions, limitations and reproduction steps. |
| 14 | Resume and Interview Material | Summarizes the project for use in a Business Analyst portfolio, resume and interviews. |

---

## 10. Project Workflow

### 1. Project Planning

Define the business problem, objectives, scope, stakeholders, assumptions and constraints.

### 2. Requirements Analysis

Create the Business Requirements Document and translate the requirements into user stories with acceptance criteria.

### 3. Data Preparation and Analysis

Inspect the source data, identify data-quality issues, apply documented cleaning decisions and establish the baseline analysis.

### 4. SQL Analysis

Develop SQL queries to answer and validate the major business questions.

### 5. Dashboard Development

Build the Power BI dashboard with KPI cards, interactive filters and visual analysis of sales, profit, products, regions, segments and discounts.

### 6. Analytical Calculations

Develop DAX measures and calculations required for the dashboard and additional analytical scenarios.

### 7. Requirements Traceability

Create the Requirements Traceability Matrix to connect requirements with user stories, implementation and validation.

### 8. Findings and Recommendations

Translate the analysis into documented business findings and evidence-based areas for management review.

### 9. Scenario and Prioritization Analysis

Develop the Discount What-If analysis and loss-prioritization analysis to support deeper business investigation.

### 10. Portfolio Documentation

Prepare the README, project structure, screenshots and resume/interview material.

---

## 11. Final Project Structure

```text
superstore-ba-project/
├── README.md
├── data/
│   ├── sample_-_superstore.xls
│   └── superstore_orders_clean.csv
├── docs/
│   ├── project_plan.md
│   ├── BRD.md
│   ├── user_stories.md
│   ├── traceability_matrix.md
│   ├── findings.md
│   └── recommendations.md
├── sql/
│   └── superstore_queries.sql
├── powerbi/
│   ├── superstore_dashboard.pbix
│   ├── superstore_dax_measures.txt
│   ├── superstore_whatif_dax.txt
│   └── superstore_pareto_dax.txt
└── images/
    ├── dashboard.png
    ├── whatif.png
    └── pareto.png