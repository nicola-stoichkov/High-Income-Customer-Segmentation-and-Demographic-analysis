# 📊 High-Income Customer Segmentation & Demographic Analysis

# 📌 About the Project
This project focuses on identifying and segmenting high-income customers using demographic and geographic data from the AdventureWorks dataset. The goal is to uncover actionable insights that can support targeted marketing strategies, particularly through location-based personalization.

By analyzing customer income, demographics, and geographic distribution, the project highlights the top 10 cities with the highest density of high-income customers — enabling more strategic and effective marketing initiatives.

# 🎯 Objectives

✅ Demonstrate end-to-end data analysis by simulating a real business scenario.

✅ Identify and profile high-income customers to support marketing personalization.

✅ Showcase the use of Azure cloud services for enterprise data analytics.

# ☁️ Cloud Stack Used (Azure Ecosystem)

This project replicates an enterprise-grade data analytics workflow fully deployed on Microsoft Azure:

 - __Azure Storage__:	Hosted source .csv files.

 - __Azure SQL Server & Database__:	Stored and managed data tables (DimCustomer, DimGeography).

 - __Azure Data Factory__:	Created pipelines to load data from Blob Storage into SQL Database.

 - __Azure Data Studio__:	Used for SQL querying and data exploration.

 - __Power BI Desktop__:	Visualized insights by directly connecting to the Azure SQL Database.

# 🧠 Methodology

__1. Resource Deployment & Data Wrangling__
 - Deployed Azure resources: SQL Server, Blob Storage, and SQL Database.

 - Uploaded raw .csv data to Azure Blob Storage.

 - Created tables in the SQL Database.

 - Built Data Factory pipelines to automate data loading (ETL).

__1.1 Cleaned data by:__

 - Identifying and dropping high-null or irrelevant columns.

 - Ensuring join keys were intact.

__2. Exploratory Data Analysis (EDA)__
 - Ran descriptive statistics on numeric fields.

 - Analyzed distributions of categorical variables.

 - Performed correlation analysis (Pearson) to identify feature relationships.

__3. Business Intelligence (BI) Analysis__

Built SQL views and Common Table Expressions (CTEs) to extract business insights:

 - 📍 Top 10 States/Provinces with highest concentration of high-income customers.
   
 - 📍 Top 10 Cities enriched with demographic features (e.g., education, marital status, gender).

__4. Visualization__
Created a Power BI dashboard featuring:

 - Bar Charts showing high-income customer distribution by City and State.

 - Tables displaying demographic breakdown of high-value customer clusters.

# 🧾 Data Overview

__Source__: Microsoft AdventureWorks Training Dataset

__Tables Used__: DimCustomer, DimGeography

__Format__: CSV files uploaded to Azure Blob Storage and queried in Azure SQL.

| Table        | Rows    | Columns |
| ------------ | ------- | ------- |
| DimCustomer  | 18,484  | 26      |
| DimGeography | 655     | 11      |

__🔗 Join Key__: GeographyKey (Primary Key in DimGeography, Foreign Key in DimCustomer)

__Data Dictionaries listed below.__

# 📈 Analysis Summary

__📍 Geographic Segmentation__

Identified:

 - Top 5 Countries

 - Top 10 States

 - Top 10 Cities with highest density of high-income customers.

__🧬 Demographic Profiling__
Profiled customers by:

 - Marital status

 - Number of children

 - Car ownership

 - House ownership

# ✅ Key Takeaways

 - __Built a cloud-native data pipeline using the Azure ecosystem.__

- __Applied SQL for data modeling, cleaning, and aggregation.__

- __Designed Power BI dashboards for data-driven decision-making.__

- __Delivered insights to inform geo-targeted marketing strategies.__

# 📘 Data Dictionaries

__DimCustomer__

| Column Name           | Data Type        | Description                                    |
|-----------------------|------------------|------------------------------------------------|
| CustomerKey           | INT (PK)         | Unique customer identifier.                     |
| GeographyKey          | INT (FK)         | Foreign key to DimGeography.                    |
| CustomerAlternateKey  | VARCHAR(50)      | Alternate customer ID.                          |
| Title                 | VARCHAR(10)      | Title (Mr., Ms., etc.).                          |
| FirstName             | VARCHAR(50)      | First name.                                     |
| MiddleName            | VARCHAR(50)      | Middle name.                                    |
| LastName              | VARCHAR(50)      | Last name.                                      |
| NameStyle             | INT              | Boolean flag for name formatting.              |
| BirthDate             | DATE             | Date of birth.                                   |
| MaritalStatus         | VARCHAR(10)      | S = Single, M = Married.                            |
| Suffix                | VARCHAR(10)      | Name suffix (e.g., Jr., III).                     |
| Gender                | CHAR(1)          | M or F.                                         |
| EmailAddress          | VARCHAR(100)     | Email address.                                  |
| YearlyIncome          | DECIMAL(18,2)    | Annual income.                                  |
| TotalChildren         | INT              | Number of children.                              |
| NumberChildrenAtHome  | INT              | Number of children at home.                      |
| EnglishEducation      | VARCHAR(50)      | Education level (English).                      |
| SpanishEducation      | VARCHAR(50)      | Education level (Spanish).                      |
| FrenchEducation       | VARCHAR(50)      | Education level (French).                       |
| EnglishOccupation     | VARCHAR(50)      | Occupation (English).                           |
| SpanishOccupation     | VARCHAR(50)      | Occupation (Spanish).                           |
| FrenchOccupation      | VARCHAR(50)      | Occupation (French).                            |
| HouseOwnerFlag        | INT              | Boolean: 1 = Owns home, 0 = Does not.          |
| NumberCarsOwned       | INT              | Number of cars.                                  |
| AddressLine1          | VARCHAR(255)     | Street address.                                 |
| AddressLine2          | VARCHAR(255)     | Secondary address line (optional).              |
| Phone                 | VARCHAR(20)      | Phone number.                                    |
| DateFirstPurchase     | DATE             | Date of first purchase.                          |
| CommuteDistance       | VARCHAR(50)      | Commute range (e.g., "5–10 Miles").             |

__DimGeography__ 

| Column Name                 | Data Type    | Description                                    |
|-----------------------------|--------------|------------------------------------------------|
| GeographyKey                | INT (PK)     | Primary key for location.                        |
| City                        | VARCHAR(100) | City name.                                      |
| StateProvinceCode           | VARCHAR(10)  | Abbreviated code for state/province.            |
| StateProvinceName           | VARCHAR(100) | Full name of the state/province.               |
| CountryRegionCode           | VARCHAR(10)  | Abbreviation for country/region.               |
| EnglishCountryRegionName    | VARCHAR(100) | Country name in English.                     |
| SpanishCountryRegionName    | VARCHAR(100) | Country name in Spanish.                     |
| FrenchCountryRegionName     | VARCHAR(100) | Country name in French.                      |
| PostalCode                  | VARCHAR(20)  | ZIP or postal code.                              |
| SalesTerritoryKey           | INT          | FK (assumed) to sales territory dimension. |
