-- Checking for Null Values in DimCustomer
SELECT 
    (SUM(CASE WHEN CustomerKey IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS CustomerKey_null_percentage,
    (SUM(CASE WHEN GeographyKey IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS GeographyKey_null_percentage,
    (SUM(CASE WHEN CustomerAlternateKey IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS CustomerAlternateKey_null_percentage,
    (SUM(CASE WHEN Title IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS Title_null_percentage,
    (SUM(CASE WHEN FirstName IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS FirstName_null_percentage,
    (SUM(CASE WHEN MiddleName IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS MiddleName_null_percentage,
    (SUM(CASE WHEN LastName IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS LastName_null_percentage,
    (SUM(CASE WHEN NameStyle IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS NameStyle_null_percentage,
    (SUM(CASE WHEN BirthDate IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS BirthDate_null_percentage,
    (SUM(CASE WHEN MaritalStatus IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS MaritalStatus_null_percentage,
    (SUM(CASE WHEN Suffix IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS Suffix_null_percentage,
    (SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS Gender_null_percentage,
    (SUM(CASE WHEN EmailAddress IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS EmailAddress_null_percentage,
    (SUM(CASE WHEN YearlyIncome IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS YearlyIncome_null_percentage,
    (SUM(CASE WHEN TotalChildren IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS TotalChildren_null_percentage,
    (SUM(CASE WHEN NumberChildrenAtHome IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS NumberChildrenAtHome_null_percentage,
    (SUM(CASE WHEN EnglishEducation IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS EnglishEducation_null_percentage,
    (SUM(CASE WHEN SpanishEducation IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS SpanishEducation_null_percentage,
    (SUM(CASE WHEN FrenchEducation IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS FrenchEducation_null_percentage,
    (SUM(CASE WHEN EnglishOccupation IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS EnglishOccupation_null_percentage,
    (SUM(CASE WHEN SpanishOccupation IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS SpanishOccupation_null_percentage,
    (SUM(CASE WHEN FrenchOccupation IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS FrenchOccupation_null_percentage,
    (SUM(CASE WHEN HouseOwnerFlag IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS HouseOwnerFlag_null_percentage,
    (SUM(CASE WHEN NumberCarsOwned IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS NumberCarsOwned_null_percentage,
    (SUM(CASE WHEN AddressLine1 IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS AddressLine1_null_percentage,
    (SUM(CASE WHEN AddressLine2 IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS AddressLine2_null_percentage,
    (SUM(CASE WHEN Phone IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS Phone_null_percentage,
    (SUM(CASE WHEN DateFirstPurchase IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS DateFirstPurchase_null_percentage,
    (SUM(CASE WHEN CommuteDistance IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS CommuteDistance_null_percentage
FROM DimCustomer;

-- Dropping unnecessary columns in DimCustomer
-- The following changes are made to clean up the data for analysis

-- 1. Droping columns with high NULL Values Percentage, making them irrelevant for the analysis:
alter TABLE DimCustomer
Drop column Title;
alter TABLE DimCustomer
Drop column MiddleName;
alter TABLE DimCustomer
Drop column Suffix;
alter TABLE DimCustomer
Drop column AddressLine2;

-- 2. Dropping columns, which have same data but in multiple languages (Education and Occupation). Using only the English version for consistency in analysis:
alter TABLE DimCustomer
Drop column SpanishEducation;
alter TABLE DimCustomer
Drop column FrenchEducation;
alter TABLE DimCustomer
Drop column SpanishOccupation;
alter TABLE DimCustomer
Drop column FrenchOccupation;

-- 3. Email, AddressLine1 and Phone are not relevant for the analysis, but they are kept if needed by the business for communication

-- Check columns in the DimCustomer table
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'DimCustomer';

-- Checking for NULL Values in DimGeography 
SELECT 
    (SUM(CASE WHEN GeographyKey IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS GeographyKey_null_percentage,
    (SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS City_null_percentage,
    (SUM(CASE WHEN StateProvinceCode IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS StateProvinceCode_null_percentage,
    (SUM(CASE WHEN StateProvinceName IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS StateProvinceName_null_percentage,
    (SUM(CASE WHEN CountryRegionCode IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS CountryRegionCode_null_percentage,
    (SUM(CASE WHEN EnglishCountryRegionName IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS EnglishCountryRegionName_null_percentage,
    (SUM(CASE WHEN SpanishCountryRegionName IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS SpanishCountryRegionName_null_percentage,
    (SUM(CASE WHEN FrenchCountryRegionName IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS FrenchCountryRegionName_null_percentage,
    (SUM(CASE WHEN PostalCode IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS PostalCode_null_percentage,
    (SUM(CASE WHEN SalesTerritoryKey IS NULL THEN 1 ELSE 0 END) * 100) / COUNT(*) AS SalesTerritoryKey_null_percentage
from DimGeography;

-- Dropping Unnecessary Columns in DimGeography
-- The following changes are made to clean up the data for analysis

-- Dropping columns, which have same data but in multiple languages (CountryRegionName). Using only the English version for consistency in analysis:
alter TABLE DimGeography
Drop column SpanishCountryRegionName;
alter TABLE DimGeography
Drop column FrenchCountryRegionName;

-- Check columns in the DimGeography table
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'DimGeography';