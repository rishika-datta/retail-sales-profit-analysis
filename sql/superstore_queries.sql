/*
=====================================================================
Retail Sales & Profit Analysis - Complete SQL Analysis
SQLite syntax
Table: Orders
Dataset: Cleaned Sample Superstore

Cleaned dataset:
- 10,192 order lines
- 5,111 distinct orders
- Total Sales: $2,326,153.86
- Total Profit: $292,273.46

Purpose:
1. Core sales and profitability analysis
2. Product, category, region and segment analysis
3. Discount and profitability analysis
4. Quantified discount impact
5. Discount cap scenario validation
6. Loss-making product prioritization
7. Pareto analysis supporting the Power BI report

Note:
The interactive Discount What-If scenario is implemented in
Power BI using DAX parameters and measures. The SQL scenario
queries below provide supporting calculations and validation.
=====================================================================
*/


/*
=====================================================================
SANITY CHECK
=====================================================================
*/

SELECT
    COUNT(*) AS order_lines,
    COUNT(DISTINCT "Order ID") AS orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM Orders;


/*
=====================================================================
Q1. TOTAL SALES
=====================================================================
*/

SELECT
    ROUND(SUM(Sales), 2) AS total_sales
FROM Orders;


/*
=====================================================================
Q2. TOTAL PROFIT
=====================================================================
*/

SELECT
    ROUND(SUM(Profit), 2) AS total_profit
FROM Orders;


/*
=====================================================================
Q3. PROFIT MARGIN
=====================================================================
*/

SELECT
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct
FROM Orders;


/*
=====================================================================
Q4. ALL SIX KPIs
=====================================================================
*/

SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct,
    COUNT(DISTINCT "Order ID") AS total_orders,
    ROUND(
        SUM(Sales) / NULLIF(COUNT(DISTINCT "Order ID"), 0),
        2
    ) AS avg_order_value,
    ROUND(100.0 * AVG(Discount), 2) AS avg_discount_pct
FROM Orders;


/*
=====================================================================
Q5. SALES BY CATEGORY
=====================================================================
*/

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM Orders
GROUP BY Category
ORDER BY total_sales DESC;


/*
=====================================================================
Q6. PROFIT BY CATEGORY
=====================================================================
*/

SELECT
    Category,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct
FROM Orders
GROUP BY Category
ORDER BY total_profit DESC;


/*
=====================================================================
Q7. SALES BY REGION
=====================================================================
*/

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales
FROM Orders
GROUP BY Region
ORDER BY total_sales DESC;


/*
=====================================================================
Q8. PROFIT BY REGION
=====================================================================
*/

SELECT
    Region,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct,
    ROUND(100.0 * AVG(Discount), 1) AS avg_discount_pct
FROM Orders
GROUP BY Region
ORDER BY total_profit DESC;


/*
=====================================================================
Q9. SALES AND PROFIT BY CUSTOMER SEGMENT
=====================================================================
*/

SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct
FROM Orders
GROUP BY Segment
ORDER BY total_sales DESC;


/*
=====================================================================
Q10a. TOP 10 PRODUCTS BY PROFIT
=====================================================================
*/

SELECT
    "Product Name" AS product_name,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM Orders
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 10;


/*
=====================================================================
Q10b. TOP 10 PRODUCTS BY SALES
=====================================================================
*/

SELECT
    "Product Name" AS product_name,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct
FROM Orders
GROUP BY "Product Name"
ORDER BY total_sales DESC
LIMIT 10;


/*
=====================================================================
Q11. LOSS-MAKING PRODUCTS
=====================================================================
*/

SELECT
    "Product Name" AS product_name,
    "Sub-Category" AS sub_category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM Orders
GROUP BY
    "Product Name",
    "Sub-Category"
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC;


/*
=====================================================================
Q12. DISCOUNT VS PROFITABILITY
=====================================================================

Final project discount bands:
- 0%
- 1-20%
- 21-40%
- Above 40%
=====================================================================
*/

SELECT
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.20 THEN '1-20%'
        WHEN Discount <= 0.40 THEN '21-40%'
        ELSE 'Above 40%'
    END AS discount_band,

    COUNT(*) AS transaction_lines,

    ROUND(SUM(Sales), 2) AS sales,

    ROUND(SUM(Profit), 2) AS profit,

    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN Profit < 0 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        1
    ) AS pct_lines_losing_money

FROM Orders

GROUP BY
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.20 THEN '1-20%'
        WHEN Discount <= 0.40 THEN '21-40%'
        ELSE 'Above 40%'
    END

ORDER BY
    CASE
        WHEN Discount = 0 THEN 1
        WHEN Discount <= 0.20 THEN 2
        WHEN Discount <= 0.40 THEN 3
        ELSE 4
    END;


/*
=====================================================================
Q13. MONTHLY SALES
=====================================================================
*/

SELECT
    strftime('%Y-%m', "Order Date") AS order_month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM Orders
GROUP BY order_month
ORDER BY order_month;


/*
=====================================================================
Q14. MONTHLY PROFIT AND MARGIN
=====================================================================
*/

SELECT
    strftime('%Y-%m', "Order Date") AS order_month,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct
FROM Orders
GROUP BY order_month
ORDER BY order_month;


/*
=====================================================================
Q15. QUANTIFIED DISCOUNT IMPACT
=====================================================================

Quantifies sales and profit associated with transactions
above a selected discount threshold.

Example threshold: 20%.
=====================================================================
*/

SELECT
    COUNT(*) AS affected_lines,
    ROUND(SUM(Sales), 2) AS affected_sales,
    ROUND(SUM(Profit), 2) AS affected_profit
FROM Orders
WHERE Discount > 0.20;


/*
=====================================================================
Q16. DISCOUNT IMPACT BY DISCOUNT BAND
=====================================================================
*/

SELECT
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.20 THEN '1-20%'
        WHEN Discount <= 0.40 THEN '21-40%'
        ELSE 'Above 40%'
    END AS discount_band,

    COUNT(*) AS transaction_lines,

    ROUND(SUM(Sales), 2) AS sales,

    ROUND(SUM(Profit), 2) AS profit,

    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct

FROM Orders

GROUP BY
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.20 THEN '1-20%'
        WHEN Discount <= 0.40 THEN '21-40%'
        ELSE 'Above 40%'
    END

ORDER BY
    CASE
        WHEN Discount = 0 THEN 1
        WHEN Discount <= 0.20 THEN 2
        WHEN Discount <= 0.40 THEN 3
        ELSE 4
    END;


/*
=====================================================================
Q17. DISCOUNT IMPACT ABOVE 30%
=====================================================================
*/

SELECT
    COUNT(*) AS affected_lines,
    ROUND(SUM(Sales), 2) AS affected_sales,
    ROUND(SUM(Profit), 2) AS affected_profit
FROM Orders
WHERE Discount > 0.30;


/*
=====================================================================
Q18. DISCOUNT IMPACT BY CATEGORY
=====================================================================
*/

SELECT
    Category,

    COUNT(*) AS affected_lines,

    ROUND(SUM(Sales), 2) AS affected_sales,

    ROUND(SUM(Profit), 2) AS affected_profit,

    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct

FROM Orders

WHERE Discount > 0.20

GROUP BY Category

ORDER BY affected_profit ASC;


/*
=====================================================================
Q19. DISCOUNT IMPACT BY SUB-CATEGORY
=====================================================================
*/

SELECT
    "Sub-Category" AS sub_category,

    COUNT(*) AS affected_lines,

    ROUND(SUM(Sales), 2) AS affected_sales,

    ROUND(SUM(Profit), 2) AS affected_profit

FROM Orders

WHERE Discount > 0.20

GROUP BY "Sub-Category"

ORDER BY affected_profit ASC;


/*
=====================================================================
Q20. DERIVED LIST PRICE AND COST PER UNIT
=====================================================================

The source dataset does not contain direct list-price or unit-cost
fields.

Derived calculations:

List Price Per Unit =
    Sales / (Quantity * (1 - Discount))

Cost Per Unit =
    (Sales - Profit) / Quantity

These are derived estimates used to support scenario analysis.
=====================================================================
*/

SELECT
    "Order ID" AS order_id,
    "Product Name" AS product_name,
    Quantity,
    Discount,

    ROUND(Sales, 2) AS sales,

    ROUND(Profit, 2) AS profit,

    ROUND(
        Sales /
        NULLIF(
            Quantity * (1 - Discount),
            0
        ),
        2
    ) AS list_price_per_unit,

    ROUND(
        (Sales - Profit) /
        NULLIF(Quantity, 0),
        2
    ) AS cost_per_unit

FROM Orders;


/*
=====================================================================
Q21. TRANSACTIONS ABOVE A 30% DISCOUNT CAP
=====================================================================

Identifies transactions affected by a 30% discount cap.
=====================================================================
*/

SELECT
    "Order ID" AS order_id,
    "Product Name" AS product_name,
    Category,
    "Sub-Category" AS sub_category,
    Quantity,
    Discount,

    ROUND(Sales, 2) AS sales,

    ROUND(Profit, 2) AS profit,

    ROUND(
        Sales /
        NULLIF(
            Quantity * (1 - Discount),
            0
        ),
        2
    ) AS list_price_per_unit,

    ROUND(
        (Sales - Profit) /
        NULLIF(Quantity, 0),
        2
    ) AS cost_per_unit

FROM Orders

WHERE Discount > 0.30

ORDER BY Discount DESC;


/*
=====================================================================
Q22. ESTIMATED SCENARIO PROFIT AT 30% DISCOUNT CAP
=====================================================================

Scenario assumptions:
- Discount cap = 30%
- Unit cost remains constant
- No units are lost
- Transactions at or below 30% retain actual profit
- Transactions above 30% are repriced to 30%
- This is an estimate, not a forecast
=====================================================================
*/

SELECT
    ROUND(
        SUM(
            CASE
                WHEN Discount > 0.30 THEN

                    (
                        (
                            Sales /
                            NULLIF(
                                Quantity * (1 - Discount),
                                0
                            )
                        )
                        * Quantity
                        * (1 - 0.30)
                    )

                    -

                    (
                        (
                            Sales - Profit
                        )
                        /
                        NULLIF(Quantity, 0)
                        * Quantity
                    )

                ELSE Profit

            END
        ),
        2
    ) AS scenario_profit

FROM Orders;


/*
=====================================================================
Q23. BASELINE VS 30% DISCOUNT CAP SCENARIO
=====================================================================
*/

WITH scenario AS (

    SELECT

        SUM(Profit) AS baseline_profit,

        SUM(
            CASE

                WHEN Discount > 0.30 THEN

                    (
                        (
                            Sales /
                            NULLIF(
                                Quantity * (1 - Discount),
                                0
                            )
                        )
                        * Quantity
                        * (1 - 0.30)
                    )

                    -

                    (
                        (
                            Sales - Profit
                        )
                        /
                        NULLIF(Quantity, 0)
                        * Quantity
                    )

                ELSE Profit

            END
        ) AS scenario_profit

    FROM Orders
)

SELECT

    ROUND(
        baseline_profit,
        2
    ) AS baseline_profit,

    ROUND(
        scenario_profit,
        2
    ) AS scenario_profit,

    ROUND(
        scenario_profit - baseline_profit,
        2
    ) AS scenario_profit_change

FROM scenario;


/*
=====================================================================
Q24. LOSS-MAKING PRODUCTS
=====================================================================

Products with negative total profit.
=====================================================================
*/

SELECT
    "Product Name" AS product_name,

    ROUND(SUM(Sales), 2) AS sales,

    ROUND(SUM(Profit), 2) AS profit

FROM Orders

GROUP BY "Product Name"

HAVING SUM(Profit) < 0

ORDER BY profit ASC;


/*
=====================================================================
Q25. TOP 20 LOSS-MAKING PRODUCTS
=====================================================================
*/

SELECT
    "Product Name" AS product_name,

    ROUND(SUM(Sales), 2) AS sales,

    ROUND(SUM(Profit), 2) AS profit,

    ROUND(
        -SUM(Profit),
        2
    ) AS product_loss_amount

FROM Orders

GROUP BY "Product Name"

HAVING SUM(Profit) < 0

ORDER BY product_loss_amount DESC

LIMIT 20;


/*
=====================================================================
Q26. LOSS BY SUB-CATEGORY
=====================================================================
*/

SELECT
    "Sub-Category" AS sub_category,

    ROUND(SUM(Profit), 2) AS profit,

    ROUND(
        -SUM(Profit),
        2
    ) AS loss_amount

FROM Orders

GROUP BY "Sub-Category"

HAVING SUM(Profit) < 0

ORDER BY loss_amount DESC;


/*
=====================================================================
Q27. LOSS-MAKING PRODUCTS WITH RANK
=====================================================================
*/

WITH product_losses AS (

    SELECT

        "Product Name" AS product_name,

        SUM(Sales) AS sales,

        SUM(Profit) AS profit,

        -SUM(Profit) AS product_loss_amount

    FROM Orders

    GROUP BY "Product Name"

    HAVING SUM(Profit) < 0
)

SELECT

    ROW_NUMBER() OVER (
        ORDER BY product_loss_amount DESC
    ) AS product_loss_rank,

    product_name,

    ROUND(sales, 2) AS sales,

    ROUND(profit, 2) AS profit,

    ROUND(
        product_loss_amount,
        2
    ) AS product_loss_amount

FROM product_losses

ORDER BY product_loss_rank;


/*
=====================================================================
Q28. TOP 20 LOSS-MAKING PRODUCTS WITH CUMULATIVE LOSS %
=====================================================================

SQL validation for the Power BI Pareto analysis.
=====================================================================
*/

WITH product_losses AS (

    SELECT

        "Product Name" AS product_name,

        SUM(Sales) AS sales,

        SUM(Profit) AS profit,

        -SUM(Profit) AS product_loss_amount

    FROM Orders

    GROUP BY "Product Name"

    HAVING SUM(Profit) < 0
),

ranked_losses AS (

    SELECT

        ROW_NUMBER() OVER (
            ORDER BY
                product_loss_amount DESC,
                product_name
        ) AS product_loss_rank,

        product_name,

        sales,

        profit,

        product_loss_amount

    FROM product_losses
),

total_loss AS (

    SELECT
        SUM(product_loss_amount) AS total_product_loss
    FROM product_losses
)

SELECT

    r.product_loss_rank,

    r.product_name,

    ROUND(r.sales, 2) AS sales,

    ROUND(r.profit, 2) AS profit,

    ROUND(
        r.product_loss_amount,
        2
    ) AS product_loss_amount,

    ROUND(
        SUM(r.product_loss_amount) OVER (
            ORDER BY r.product_loss_rank
            ROWS BETWEEN
                UNBOUNDED PRECEDING
                AND CURRENT ROW
        )
        * 100.0
        / NULLIF(
            t.total_product_loss,
            0
        ),
        2
    ) AS cumulative_loss_pct

FROM ranked_losses r

CROSS JOIN total_loss t

WHERE r.product_loss_rank <= 20

ORDER BY r.product_loss_rank;