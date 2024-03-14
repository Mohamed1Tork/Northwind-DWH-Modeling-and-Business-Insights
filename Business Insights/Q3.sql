WITH all_data AS (
	SELECT DISTINCT s.shipper_id, s.company_name, s.freight_per_unit, o.order_id, d.date AS order_date,
		o.shipped_date, (o.shipped_date - d.date) AS days_diff
	FROM orders_fact o
	JOIN public."shippers_Dim" s
		ON o.shipper_key = s.shipper_key
	JOIN public."date_Dim" d ON o.date_key = d.date_key
),
avg_days AS (
	SELECT DISTINCT
		shipper_id, company_name, freight_per_unit,
		ROUND(AVG(days_diff) OVER (PARTITION BY shipper_id), 2) AS avg_days
	FROM all_data
	ORDER BY shipper_id
)
SELECT * FROM avg_days;