CREATE INDEX idx_required_date ON public.orders_fact (required_date);
CREATE INDEX idx_total_sales ON public.orders_fact (total_sales);
CREATE INDEX idx_year ON public."date_Dim" (year);
CREATE INDEX idx_category_name_bitmap ON public."products_Dim" USING brin (category_name);
CREATE INDEX idx_return_cause_bitmap ON public.returns_fact USING brin (return_cause);
CREATE INDEX idx_maturity_bitmap ON public."customers_Dim" USING brin (maturity);