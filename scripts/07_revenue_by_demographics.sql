/*
Purpose: Analyze revenue and average order value across customer gender and marital status
Business question: Are there meaningful differences in spending behavior across customer demographic groups?
Tables used: gold.fact_sales, gold.dim_customers
*/
SELECT 
    c.gender,
    c.marital_status,
    COUNT(DISTINCT c.customer_key) AS num_customers,
    SUM(f.sales_amount) AS total_revenue,
    ROUND(AVG(f.sales_amount), 2) AS avg_order_value
FROM gold.fact_sales f
JOIN gold.dim_customers c ON f.customer_key = c.customer_key
WHERE c.country <> 'n/a'
GROUP BY c.gender, c.marital_status
ORDER BY total_revenue DESC;