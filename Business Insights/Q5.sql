-- Create Materialized View to contain the required data
CREATE MATERIALIZED VIEW return_cause_details AS
    SELECT DISTINCT rf.order_id AS order_no, c.company_name AS customer,
        rf.return_cause AS cause, s.company_name AS shipper
    FROM public.returns_fact rf
    JOIN public."customers_Dim" c
        ON rf.customer_key = c.customer_key
    JOIN public."shippers_Dim" s
            ON rf.shipper_key = s.shipper_key;

-- Retrieve data
SELECT * FROM return_cause_details;

SELECT 'Federal Shipping' AS shipper, cause, COUNT(*) AS count
FROM return_cause_details
WHERE shipper = 'Federal Shipping'
GROUP BY cause
UNION ALL
SELECT 'Speedy Express' AS shipper, cause, COUNT(*) AS count
FROM return_cause_details
WHERE shipper = 'Speedy Express'
GROUP BY cause
UNION ALL
SELECT 'United Package' AS shipper, cause, COUNT(*) AS count
FROM return_cause_details
WHERE shipper = 'United Package'
GROUP BY cause
ORDER BY shipper, cause;


SELECT
    shipper,
    SUM(CASE WHEN cause = 'change mind' THEN 1 ELSE 0 END) AS "change mind",
    SUM(CASE WHEN cause = 'damaged' THEN 1 ELSE 0 END) AS damaged,
    SUM(CASE WHEN cause = 'late delivary' THEN 1 ELSE 0 END) AS "late delivary",
    SUM(CASE WHEN cause = 'poor_quality' THEN 1 ELSE 0 END) AS poor_quality,
    SUM(CASE WHEN cause = 'wrong_item' THEN 1 ELSE 0 END) AS wrong_item
FROM return_cause_details
GROUP BY shipper
ORDER BY shipper;