INSERT INTO public."employees_Dim"
    (employee_key, location_key, employee_id, last_name, first_name, title, birth_date, hire_date, address, phone, supervised_by)
VALUES
	(1, 118, 2, 'Fuller', 'Andrew', 'Vice President, Sales', '1952-02-19', '1992-08-14', '908 W. Capital Way', '(206) 555-9482', NULL),
	(2, 119, 3, 'Leverling', 'Janet', 'Sales Representative', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', '(206) 555-3412', 2),
	(3, 120, 4, 'Peacock', 'Margaret', 'Sales Representative', '1937-09-19', '1993-05-03', '4110 Old Redmond Rd.', '(206) 555-8122', 2),
	(4, 121, 6, 'Suyama', 'Michael', 'Sales Representative', '1963-07-02', '1993-10-17', 'Coventry House\nMiner Rd.', '(71) 555-7773', 5),
	(5, 122, 7, 'King', 'Robert', 'Sales Representative', '1960-05-29', '1994-01-02', 'Edgeham Hollow\nWinchester Way', '(71) 555-5598', 5),
	(6, 123, 8, 'Callahan', 'Laura', 'Inside Sales Coordinator', '1958-01-09', '1994-03-05', '4726 - 11th Ave. N.E.', '(206) 555-1189', 2),
	(7, 124, 9, 'Dodsworth', 'Anne', 'Sales Representative', '1966-01-27', '1994-11-15', '7 Houndstooth Rd.', '(71) 555-4444', 5),
	(8, 125, 1, 'Davolio', 'Nancy', 'Sales Representative', '1948-12-08', '1992-05-01', '507 - 20th Ave. E.\nApt. 2A', '(206) 555-9857', 2);