/*
Purpose: Track monthly revenue and its cumulative growth over time
Business question: What does the month-by-month revenue trajectory look like, and how has cumulative revenue built up?
Tables used: gold.fact_sales
*/
SELECT 
    order_month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (ORDER BY order_month) AS running_total_revenue
FROM (
    SELECT 
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS order_month,
        SUM(sales_amount) AS monthly_revenue
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY YEAR(order_date), MONTH(order_date)
) monthly
ORDER BY order_month;