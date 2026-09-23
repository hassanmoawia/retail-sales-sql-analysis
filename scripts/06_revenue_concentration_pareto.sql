/*
Purpose: Measure how concentrated total revenue is among top-selling products
Business question: Are we overexposed to a small number of products, and what share of revenue do the top 10 represent?
Tables used: gold.fact_sales, gold.dim_products
*/
WITH product_revenue AS (
    SELECT 
        p.product_name,
        SUM(f.sales_amount) AS total_revenue
    FROM gold.fact_sales f
    JOIN gold.dim_products p ON f.product_key = p.product_key
    GROUP BY p.product_name
),
ranked AS (
    SELECT 
        product_name,
        total_revenue,
        SUM(total_revenue) OVER () AS grand_total,
        SUM(total_revenue) OVER (ORDER BY total_revenue DESC 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
    FROM product_revenue
)
SELECT TOP 10
    product_name,
    total_revenue,
    ROUND(total_revenue * 100.0 / grand_total, 2) AS pct_of_total_revenue,
    ROUND(running_total * 100.0 / grand_total, 2) AS cumulative_pct
FROM ranked
ORDER BY total_revenue DESC;