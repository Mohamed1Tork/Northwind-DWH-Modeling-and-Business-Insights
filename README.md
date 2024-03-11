# **Northwind Data Warehouse Modeling and Business Insigts**

## **Overview**

This document presents a comprehensive overview of the dimensional model developed for a data warehouse using the Northwind dataset. It outlines the model's purpose, design, and its alignment with specific business requirements.

## **Business Requirements**

The dimensional model was crafted to meet the following business requirements:

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
2. **FactReturns**: Stores information about returned orders.

### **Dimension Tables**

1. **DimLocation**: Contains information about geographical locations.
2. **DimCustomer**: Stores details about customers.
3. **DimSupplier**: Holds data regarding suppliers.
4. **DimEmployee**: Contains information about employees.
5. **DimProduct**: Stores details about products.
6. **DimShipper**: Holds data related to shipping companies.
7. **DimDate**: Contains date-related information.

![OrdersFact](https://github.com/mennamamdouh/Northwind-DWH-Modeling-and-Business-Insights/assets/155321343/ca9ef5b1-6be1-4c79-97ab-f45279c5885e)

![ReturnsFact](https://github.com/mennamamdouh/Northwind-DWH-Modeling-and-Business-Insights/assets/155321343/c8fde306-6f8a-4b5f-bca8-3bdddd0cbc12)


## **Indexing Strategy for Northwind Data Warehouse**

After creating the dimensional model for the Northwind data warehouse, the next step involves optimizing query performance by creating indexes on columns that are frequently used in queries. The following columns have been identified as crucial for efficient query processing based on the business requirements:

1. **RequiredDate**
2. **TotalSales**
3. **CategoryName**
4. **Year**
5. **ReturnCause**
6. **Maturity**
7. **Foreign Key Indexing**Indexes for all foreign key columns have also been created to enhance query efficiency.
