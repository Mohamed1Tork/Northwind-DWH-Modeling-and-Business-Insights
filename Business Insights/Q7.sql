with all_data AS(
	SELECT c.customer_id, o.order_id, o.total_sales, d.month, d.year 
	FROM orders_fact o
	JOIN public."customers_Dim" c
		ON o.customer_key = c.customer_key
	JOIN public."date_Dim" d
		ON o.date_key = d.date_key
),
sales_bymonth AS (
	SELECT customer_id, MONTH, YEAR,
		SUM(total_sales) AS total_sales
	FROM all_data
	GROUP BY customer_id, MONTH, YEAR
	ORDER BY customer_id, YEAR, MONTH
)
SELECT * FROM sales_bymonth;