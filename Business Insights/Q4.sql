WITH all_data AS (
	SELECT e.employee_key, e.first_name || ' ' || e.last_name AS employee_name,
		o.total_sales, d.year AS sales_year
	FROM orders_fact o
	JOIN public."employees_Dim" e
		ON o.employee_key = e.employee_key
	JOIN public."date_Dim" d ON o.date_key = d.date_key
)
SELECT
    employee_key, employee_name, sales_year,
    SUM(total_sales) AS total_Employee_Sales,
	ROUND(AVG(total_sales::numeric), 3) AS avg_employee_sales
FROM all_data
GROUP BY employee_key, employee_name, sales_year
ORDER BY SUM(total_sales) DESC;