WITH all_data AS(
	SELECT c.customer_id,o.order_id,o.total_sales,d.date AS order_date
	FROM orders_fact o
	JOIN  public."customers_Dim" c
          ON o.customer_key = c.customer_key
	JOIN public."date_Dim" d
          ON o.date_key = d.date_key
),
rfm_data AS (
    SELECT customer_id,
        ((SELECT MAX(order_date) FROM all_data)
		 - MAX(order_date))::int AS recency,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(total_sales) AS monetary
    FROM all_data 
    GROUP BY customer_id
),
customer_segment AS (
    SELECT customer_id, recency, frequency, monetary,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency) AS f_score,
        NTILE(5) OVER (ORDER BY monetary) AS m_score,
        round((NTILE(5) OVER (ORDER BY frequency) + NTILE(5) OVER (ORDER BY monetary)) / 2.0, 0) AS fm_score
    FROM rfm_data
)
SELECT customer_id, recency, frequency, monetary, r_score, fm_score,
    CASE
        WHEN (r_score >= 5 AND fm_score >= 5)
             OR (r_score >= 5 AND fm_score = 4)
             OR (r_score = 4 AND fm_score >= 5) THEN 'champions'
        WHEN (r_score >= 5 AND fm_score = 2)
             OR (r_score = 4 AND fm_score = 2)
             OR (r_score = 3 AND fm_score = 3)
             OR (r_score = 4 AND fm_score >= 3) THEN 'potential loyalists'
        WHEN (r_score >= 5 AND fm_score = 3)
             OR (r_score = 4 AND fm_score = 4)
             OR (r_score = 3 AND fm_score >= 5)
             OR (r_score = 3 AND fm_score >= 4) THEN 'loyal customers'
        WHEN r_score >= 5 AND fm_score = 1 THEN 'recent customers'
        WHEN (r_score = 4 AND fm_score = 1)
             OR (r_score = 3 AND fm_score = 1) THEN 'promising'
        WHEN (r_score = 3 AND fm_score = 2)
             OR (r_score = 2 AND fm_score = 3)
             OR (r_score = 2 AND fm_score = 2) THEN 'customers needing attention'
        WHEN (r_score = 2 AND fm_score >= 5)
             OR (r_score = 2 AND fm_score = 4)
             OR (r_score = 1 AND fm_score = 3) THEN 'at risk'
        WHEN (r_score = 1 AND fm_score >= 5)
             OR (r_score = 1 AND fm_score = 4) THEN 'cant lose them'
        WHEN (r_score = 1 AND fm_score = 2)
             OR (r_score = 2 AND fm_score = 1) THEN 'hibernating'
        WHEN r_score = 1 AND fm_score <= 1 THEN 'lost'
        ELSE 'other'
    END AS cust_segment
FROM customer_segment;