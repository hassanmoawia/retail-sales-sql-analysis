/*
Purpose: Rank subcategories within each product category by revenue
Business question: Within each category, which subcategories are the top performers?
Tables used: gold.fact_sales, gold.dim_products
*/
SELECT 
    category,
    subcategory,
    total_revenue,
    RANK() OVER (PARTITION BY category ORDER BY total_revenue DESC) AS revenue_rank
FROM (
    SELECT 
        p.category,
        p.subcategory,
        SUM(f.sales_amount) AS total_revenue
    FROM gold.fact_sales f
    JOIN gold.dim_products p ON f.product_key = p.product_key
    GROUP BY p.category, p.subcategory
) sub
ORDER BY category, revenue_rank;