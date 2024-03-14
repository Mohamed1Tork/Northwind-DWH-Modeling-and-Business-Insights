SELECT c.customer_key, c.company_name, c.maturity, SUM(o.total_sales) AS sales,
    CASE
        WHEN sum(o.total_sales) < '10000' THEN 'startup'
        WHEN sum(o.total_sales) BETWEEN '10000' AND '50000' THEN 'Mid-size'
        ELSE 'Cooperated'
    END AS maturity_level_on_sales	
FROM
    public."customers_Dim" c
JOIN public.orders_fact o
    ON c.customer_key = o.customer_key
GROUP BY c.customer_key
ORDER BY c.customer_key;