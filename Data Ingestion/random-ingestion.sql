UPDATE public."shippers_Dim"
SET freight_per_unit = 
    CASE 
        WHEN shipper_id = 1 THEN 0.50
        WHEN shipper_id = 2 THEN 1.00 
        WHEN shipper_id = 3 THEN 0.75 
        WHEN shipper_id = 4 THEN 1.25 
        WHEN shipper_id = 5 THEN 0.90 
        WHEN shipper_id = 6 THEN 0.80 
		ELSE NULL 
    END;

--------------------------------------------------------------------------------------

UPDATE public."customers_Dim"
SET maturity =
    CASE 
        WHEN RANDOM() < 0.33 THEN 'Cooperated'
        WHEN RANDOM() >= 0.33 AND RANDOM() < 0.66 THEN 'Mid-size'
        ELSE 'Startup'
    END;

--------------------------------------------------------------------------------------

UPDATE public."orders_fact"
SET return_flag =
    CASE 
        WHEN RANDOM() < 0.10 THEN 1
        ELSE 0
    END;

--------------------------------------------------------------------------------------

UPDATE public."returns_fact"
SET return_cause =
    CASE 
        WHEN RANDOM() < 0.20 THEN 'damaged'
        WHEN RANDOM() >= 0.20 AND RANDOM() < 0.40 THEN 'wrong_item'
		WHEN RANDOM() >= 0.40 AND RANDOM() < 0.60 THEN 'change mind'
        WHEN RANDOM() >= 0.60 AND RANDOM() < 0.80 THEN 'late delivary'
        ELSE 'poor_quality'
    END;