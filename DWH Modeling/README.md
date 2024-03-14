# Data Warehouse Modeling Overview
## Facts:
  After gathering requirements from stakeholders, we embarked on designing a dimensional model tailored to meet the business needs effectively while prioritizing performance. Our primary focus was on modeling the sale transaction process, encompassing customer **OrdersFact**. This process entails the following facts:

> *(ProductKey, EmployeeKey, CustomerKey, DateKey, LocationKey, ShipperKey, OrderID, RequiredDate, ShippedDate, Freight, ShipperName, ShipAddress, UnitPrice, Quantity, Discount, IsReturn, TotalSales)*
> 
We included an "IsReturn" flag column in this fact table to differentiate returned orders from regular orders that customers purchased. Additionally, we introduced the "TotalSales" column to simplify querying sales data from the fact table.

  In addition to **OrdersFact**, we identified another critical business process: **ReturnsFact**. This process includes the following facts:

> *(ProductKey, EmployeeKey, CustomerKey, DateKey, LocationKey, ShipperKey, OrderID, RequiredDate, ShippedDate, Freight, ShipperName, Shipaddress, UnitPrice, Quantity, Discount, ReturnDate, ReturnCause, TotalSales)*
>
In this table, we included a "ReturnCause" column, which offers various categories for these causes to track patterns in returned orders. This enables easy identification of the root cause of returns, whether it involves frequent returns from a particular customer indicating dissatisfaction, repeated occurrences of a shipper's name suggesting issues with order delivery leading to product damage, or problems related to the product itself, such as damage due to inadequate storage or issues with the production line from the supplier.

## Dimensions:
From the database schema, we defined the dimensions of our model as follows:

1- **DimLocation**: This dimension stores geographical location information. It is linked to three dimensions: Customers, Suppliers, Employees, as they all have location data provided, crucial for warehouse operations.

> Fields: *(LocationKey, PostalCode, City, Region, Country)*

2- **DimCustomer**: This dimension holds customer details, now augmented with a new column, Maturity, indicating the maturity level of each customer company (Start-up, Mid-size, Corporate). This can be utilized for comparing total sales among companies of similar maturity levels.

> Fields: *(CustomerKey, LocationKey, CustomerID, CompanyName, ContactName, ContactTitle, Address, Phone, Fax, Maturity)*

3- **DimSupplier**: Contains data pertaining to suppliers who provide Northwind with products they sell to Customers.

> Fields: *(SupplierKey, LocationKey, SupplierID, CompanyName, ContactName, ContactTitle, Address, Phone, Fax)*

4- **DimEmployee**: This dimension encompasses employee information.
> Fields: (EmployeeKey, LocationKey, EmployeeID, LastName, FirstName, Title, DateOfBirth, HiredDate, Address, Phone, SupervisedBy)

5- **DimProduct**: Stores product details. Instead of having a separate dimension for product categories, we've included it as a column within this dimension. This approach aims to minimize joins when querying data, thereby improving optimization.
> Fields: *(ProductKey, SupplierKey, ProductID, ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, Discontinued, CategoryName)*

6- **DimShipper**: Holds data regarding shipping companies, with a new addition of a freight column for comparing freight costs among shippers and average delivery times.
> Fields: *(ShipperKey, CompanyName, Phone, ShipperID, Freight)*

7- **DimDate**: This dimension contains date-related information. With columns IsHoliday, IsRamadan added, we tend to ease tracking difference in purchases during these times of year.
> Fields: *(DateKey, OrderDate, DayOfWeek, DayName, DayOfMonth, DayOfYear, IsWeekend, IsHoliday, IsRamadan, WeekOfYear, MonthName, Month, Quarter, Year)*
>
This dimensional model serves as the foundation for our data warehouse, providing a structured framework for efficient data retrieval and insightful analysis.
