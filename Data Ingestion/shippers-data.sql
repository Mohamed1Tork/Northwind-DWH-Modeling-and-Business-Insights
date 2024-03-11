-- freign_per_unit (missing)

INSERT INTO public."shippers_Dim"
    (shipper_key, shipper_id, company_name, phone, freight_per_unit)
VALUES
	(1, 1, 'Speedy Express', '(503) 555-9831', null),
	(2, 2, 'United Package', '(503) 555-3199', null),
	(3, 3, 'Federal Shipping', '(503) 555-9931', null),
	(4, 4, 'Alliance Shippers', '1-800-222-0451', null),
	(5, 5, 'UPS', '1-800-782-7892', null),
	(6, 6, 'DHL', '1-800-225-5345', null);