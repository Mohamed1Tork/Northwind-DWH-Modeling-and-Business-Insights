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