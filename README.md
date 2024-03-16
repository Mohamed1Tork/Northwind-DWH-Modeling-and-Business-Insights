# **Northwind Data Warehouse Documentation**

## **Overview**

This document offers a comprehensive overview of the process involved in creating a dimensional model for a data warehouse using the Northwind dataset, with some interpretations. The dimensional model aims to fulfill specific business requirements outlined by stakeholders and provide valuable insights into various aspects of the business.

## **Business Requirements**

The initial phase focused on identifying and understanding key business requirements through stakeholder meetings and discussions. The following requirements were identified:

1. **Churn Rate Calculation**: To understand customer retention and attrition by calculating the churn rate for customers.
2. **Seasonal Best Sellers**: Identify best-selling products during seasons with high sales rates.
3. **Shipper Evaluations**: Evaluate shippers based on average shipping days and freight costs.
4. **Top Sales Employees**: Determine top-performing sales employees based on sales performance.
5. **Returns Analysis**: Explore causes of returns to predict root causes and take necessary actions.
6. **Customer Maturity Analysis**: Analyze customer maturity based on average sales over time to ensure revenue optimization.
7. **Proactive Customer Engagement**: Enhance customer experience and loyalty by initiating contact with customers before they initiate orders.

## **Dimensional Model**

The dimensional model was designed to effectively address the identified business requirements. It consists of the following dimensions and fact tables:

### **Fact Tables**

1. **FactOrders**: Contains transactional data related to orders.
2. **FactReturns**: Stores information about returned orders.

### **Dimension Tables**

1. **DimLocation**: Contains information about geographical locations.
2. **DimCustomer**: Stores details about customers.
3. **DimSupplier**: Holds data regarding suppliers.
4. **DimEmployee**: Contains information about employees.
5. **DimProduct**: Stores details about products.
6. **DimShipper**: Holds data related to shipping companies.
7. **DimDate**: Contains date-related information.

![DWH Model](https://github.com/mennamamdouh/Northwind-DWH-Modeling-and-Business-Insights/assets/155321343/53b17696-6754-4882-ace6-de7cc14d06f1)


## **Indexes for Northwind Data Warehouse**

After creating the dimensional model for the Northwind data warehouse, the next step involves optimizing query performance by creating indexes on columns that are frequently used in queries. The following columns have been identified as crucial for efficient query processing based on the business requirements:

1. **RequiredDate**
2. **TotalSales**
3. **CategoryName**
4. **Year**
5. **ReturnCause**
6. **Maturity**
7. **Foreign Key Indexing**
> More details about the indexing strategy and dimensional modeling included in the README file in `DWH Modeling` folder

## **Folder Contents Explanation:**

1. **Business Insights:**
    - This folder includes the queries performed to meet the business requirements from the stakeholders. The README.md file presents visualizations of these queries.
2. **DWH Implementation:**
    - This folder contains the SQL scripts for creating the data warehouse and the indexes.
3. **DWH Modeling:**
    - This folder includes the dimensional modeling of the warehouse.
4. **Data Ingestion:**
    - This folder includes the SQL scripts for ingesting data into the created tables.

## **Tools Used:**

- **`Postgres`** for SQL implementation
- **`Power BI`** for visualization of data
