/*
Purpose: Break down total revenue and units sold by product category
Business question: Which product category generates the most revenue, and does that align with order volume?
Tables used: gold.fact_sales, gold.dim_products
*/
SELECT 
    p.category,
    SUM(f.sales_amount) AS total_revenue,
    SUM(f.quantity) AS total_units,
    COUNT(DISTINCT f.order_number) AS num_orders
FROM gold.fact_sales f
JOIN gold.dim_products p ON f.product_key = p.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;