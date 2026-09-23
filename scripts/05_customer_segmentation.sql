/*
Purpose: Segment customers into VIP, Regular, and Occasional tiers based on total spend
Business question: How many customers fall into each spend tier, and how much revenue does each tier contribute?
Tables used: gold.fact_sales, gold.dim_customers
*/
WITH customer_spend AS (
    SELECT 
        c.customer_key,
        c.first_name + ' ' + c.last_name AS customer_name,
        c.country,
        COUNT(DISTINCT f.order_number) AS num_orders,
        SUM(f.sales_amount) AS total_spent
    FROM gold.fact_sales f
    JOIN gold.dim_customers c ON f.customer_key = c.customer_key
    GROUP BY c.customer_key, c.first_name, c.last_name, c.country
)
SELECT 
    CASE 
        WHEN total_spent >= 5000 THEN 'VIP'
        WHEN total_spent BETWEEN 1000 AND 4999 THEN 'Regular'
        ELSE 'Occasional'
    END AS customer_segment,
    COUNT(*) AS num_customers,
    AVG(total_spent) AS avg_spent,
    SUM(total_spent) AS segment_revenue
FROM customer_spend
GROUP BY 
    CASE 
        WHEN total_spent >= 5000 THEN 'VIP'
        WHEN total_spent BETWEEN 1000 AND 4999 THEN 'Regular'
        ELSE 'Occasional'
    END
ORDER BY segment_revenue DESC;