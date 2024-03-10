# **Northwind Data Warehouse Modeling and Business Insigts**

## **Overview**

This document provides a comprehensive overview of the process undertaken to create a dimensional model for a data warehouse using the Northwind dataset. The dimensional model is designed to meet specific business requirements outlined by stakeholders and aims to provide valuable insights into various aspects of the business.

## **Business Requirements**

The initial phase involved identifying and understanding the key business requirements. Through stakeholder meetings and discussions, the following requirements were identified:

1. **Churn Rate Calculation**: Calculate the churn rate for customers to understand customer retention and attrition.
2. **Seasonal Best Sellers**: Identify best-selling products during seasons with high sales rates.
3. **Shipper Evaluations**: Evaluate shippers based on average shipping days and freight costs.
4. **Top Sales Employees**: Determine top-performing sales employees based on sales performance.
5. **Returns Analysis**: Explore causes of returns to predict root causes and take necessary actions.
6. **Customer Maturity Analysis**: Analyze customer maturity based on average sales over time to ensure revenue optimization.
7. **Proactive Customer Engagement**: Contact customers before they initiate orders to enhance customer experience and loyalty.

## **Dimensional Model**

The dimensional model was designed to address the identified business requirements effectively. It consists of the following dimensions and fact tables:

### **Fact Tables**

1. **FactOrders**: Contains transactional data related to orders.
    - Fields: (ProductKey, EmployeeKey, CustomerKey, DateKey, LocationKey, ShipperKey, OrderID, RequiredDate, ShippedDate, Freight, ShippperName, ShipAddress, UnitPrice, Quantity, Discount,, IsReturn, TotalSales)
2. **FactReturns**: Stores information about returned orders.
    - Fields: (ProductKey, EmployeeKey, CustomerKey, DateKey, LocationKey, ShipperKey, OrderID, RequiredDate, ShippedDate, Freight, ShippperName, Shipaddress, UnitPrice, Quantity, Discount, ReturnDate, ReturnCause, TotalSales)

### **Dimension Tables**

1. **DimLocation**: Contains information about geographical locations.
    - Fields: (LocationKey, PostalCode, City, Region, Country)
2. **DimCustomer**: Stores details about customers.
    - Fields: (CustomerKey, LocationKey, CustomerID, CompanyName, ContactName, ContactTitle, Address, Phone, Fax, Maturity)
3. **DimSupplier**: Holds data regarding suppliers.
    - Fields: (SupplierKey, LocationKey, SupplierID, CompanyName, ContactName, ContactTitle, Address, Phone, Fax)
4. **DimEmployee**: Contains information about employees.
    - Fields: (EmployeeKey, LocationKey, EmployeeID, LastName, FirstName, Title, DateOfBirth, HiredDate, Address, Phone, SupervisedBy)
5. **DimProduct**: Stores details about products.
    - Fields: (ProductKey, SupplierKey, ProductID, ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, Discontinued, CategoryName)
6. **DimShipper**: Holds data related to shipping companies.
    - Fields: (ShipperKey, CompanyName, Phone, ShipperID)
7. **DimDate**: Contains date-related information.
    - Fields: (DateKey, OrderDate, DayOfWeek, DayName, DayOfMonth, DayOfYear, IsWeekend, IsHoliday, IsRamadan, WeekOfYear, MonthName, Month, Quarter, Year)

## **Indexing Strategy for Northwind Data Warehouse**

After creating the dimensional model for the Northwind data warehouse, the next step involves optimizing query performance by creating indexes on columns that are frequently used in queries. The following columns have been identified as crucial for efficient query processing based on the business requirements:

1. **RequiredDate**: Indexing this column will facilitate quicker retrieval of data related to order requirements, especially for analyzing time-based trends such as seasonal fluctuations.
2. **TotalSales**: This derived column in the FactOrders table represents the total sales amount ((unit price * quantity) - Discount). Indexing it will expedite calculations involving sales figures, which are pivotal for various business analyses.
3. **CategoryName**: A bitmap index is recommended for this column to swiftly identify best-selling product categories. This will aid in efficiently managing inventory and ensuring adequate stock availability, particularly during peak seasons or holidays.
4. Year: Grouping data by year is a common requirement across different analyses. Indexing the year column with a bitmap index will enhance the performance of queries involving temporal aggregations and comparisons.
5. **ReturnCause**: Utilizing a bitmap index for this column will streamline the process of categorizing and analyzing return causes. This will enable prompt identification of recurring issues, whether they stem from customers, suppliers, shippers, or internal processes, facilitating targeted remedial actions.
6. **Maturity**: Indexing this column, which categorizes customers into startup, midsize, and corporate segments based on their sales performance, will expedite analyses aimed at identifying and addressing deviations in customer behavior. This proactive approach can help enhance customer engagement and retention.
7. **Foreign Key Indexing**: Additionally, indexes have been created for all foreign key columns in the data warehouse schema. This optimization enhances query performance by expediting joins and filtering operations involving foreign key relationships, ensuring swift data retrieval and improving overall analytical efficiency.
