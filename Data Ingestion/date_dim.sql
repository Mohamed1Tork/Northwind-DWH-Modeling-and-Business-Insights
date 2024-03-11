WITH RECURSIVE dates AS (
    SELECT '1996-01-01'::date AS date
    UNION ALL
    SELECT date + 1
    FROM dates
    WHERE date < '2050-12-31' -- End date of your range
)
INSERT INTO public."date_Dim" (date_key, date, day_name, day_of_week, day_of_month, day_of_year, is_weekend, is_holiday, is_ramadan, week_of_year, month_name, month, quartar, year)
SELECT
    ROW_NUMBER() OVER () AS date_key,
    date,
    TO_CHAR(date, 'Day') AS day_name,
    EXTRACT(ISODOW FROM date) AS day_of_week,
    EXTRACT(DAY FROM date) AS day_of_month,
    EXTRACT(DOY FROM date) AS day_of_year,
    CASE WHEN EXTRACT(ISODOW FROM date) IN (6, 7) THEN 1 ELSE 0 END AS is_weekend,
    0 AS is_holiday, 
    0 AS is_ramadan,
    EXTRACT(WEEK FROM date) AS week_of_year,
    TO_CHAR(date, 'Month') AS month_name,
    EXTRACT(MONTH FROM date) AS month,
    CASE WHEN EXTRACT(MONTH FROM date) IN (1, 2, 3) THEN 'Q1'
         WHEN EXTRACT(MONTH FROM date) IN (4, 5, 6) THEN 'Q2'
         WHEN EXTRACT(MONTH FROM date) IN (7, 8, 9) THEN 'Q3'
         ELSE 'Q4'
    END AS quartar,
    EXTRACT(YEAR FROM date) AS year
FROM dates;
