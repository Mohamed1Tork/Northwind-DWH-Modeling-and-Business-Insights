-- Best seller 5 products in each month every year

WITH all_data AS (
	SELECT p.product_name, o.total_sales, d.year, d.month
	FROM orders_fact o
	JOIN public."date_Dim" d
		ON o.date_key = d.date_key
	JOIN public."products_Dim" p
		ON o.product_key = p.product_key
),
monthlysales AS (
    SELECT YEAR, MONTH, product_name, SUM(total_sales) AS total_sales
    FROM all_data
    GROUP BY YEAR,MONTH, product_name
),
ranked_products AS (
	SELECT YEAR,MONTH, product_name, total_sales,
		row_number() OVER (PARTITION BY YEAR, MONTH ORDER BY total_sales DESC) AS product_rank
	FROM monthlysales
	ORDER BY YEAR, MONTH
)
SELECT product_name, YEAR, MONTH, total_sales, product_rank
FROM ranked_products
where product_rank <=5;

--------------------------------------------------------------------------------------------------

-- Best seller 5 categories in each month every year

WITH all_data AS(
	SELECT p.category_name, o.total_sales, d.year, d.month
	FROM orders_fact o
	JOIN public."date_Dim" d
		ON o.date_key = d.date_key
	JOIN public."products_Dim" p
		ON o.product_key = p.product_key
),
monthlysales AS (
    SELECT YEAR, MONTH, category_name, SUM(total_sales) AS total_sales
    FROM all_data
    GROUP BY YEAR, MONTH, category_name
),
ranked_products AS (
	SELECT YEAR, MONTH, category_name, total_sales,
		row_number() OVER (PARTITION BY YEAR,MONTH ORDER BY total_sales DESC) AS category_rank
	FROM monthlysales
	ORDER BY YEAR, MONTH
)
SELECT category_name, YEAR, MONTH, total_sales, category_rank
FROM ranked_products
where category_rank <=5;
