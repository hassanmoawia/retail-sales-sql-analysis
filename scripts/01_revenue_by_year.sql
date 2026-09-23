/*
Purpose: Establish the overall revenue trend across the years covered by the dataset
Business question: Is total revenue growing or declining year over year, and how does order volume compare?
Tables used: gold.fact_sales
*/
SELECT 
    YEAR(order_date) AS order_year,
    COUNT(DISTINCT order_number) AS total_orders,
    SUM(sales_amount) AS total_revenue,
    SUM(quantity) AS total_units_sold
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY order_year;