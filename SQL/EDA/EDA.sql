-- Calculating descriptive statistics of relevant numerical columns in DimCustomer:

Create View Descriptive_stats_DimCustomer as 
    SELECT
        'YearlyIncome' as column_name,
        MIN(YearlyIncome) AS min_val,
        MAX(YearlyIncome) AS max_val,
        AVG(YearlyIncome) AS mean_val,
        COUNT(DISTINCT YearlyIncome) AS unique_vals,
        VARP(YearlyIncome) AS variance_val,
        STDEVP(YearlyIncome) AS stddev_val    
    FROM DimCustomer
    UNION ALL
    SELECT
        'TotalChildren',
        MIN(TotalChildren) AS min_val,
        MAX(TotalChildren) AS max_val,
        AVG(TotalChildren) AS mean_val,
        COUNT(DISTINCT TotalChildren) AS unique_vals,
        VARP(TotalChildren) AS variance_val,
        STDEVP(TotalChildren) AS stddev_val    
    FROM DimCustomer
    UNION ALL
    SELECT
        'NumberChildrenAtHome',
        MIN(NumberChildrenAtHome) AS min_val,
        MAX(NumberChildrenAtHome) AS max_val,
        AVG(NumberChildrenAtHome) AS mean_val,
        COUNT(DISTINCT NumberChildrenAtHome) AS unique_vals,
        VARP(NumberChildrenAtHome) AS variance_val,
        STDEVP(NumberChildrenAtHome) AS stddev_val    
    FROM DimCustomer
    UNION ALL
    SELECT
        'NumberCarsOwned',
        MIN(NumberCarsOwned) AS min_val,
        MAX(NumberCarsOwned) AS max_val,
        AVG(NumberCarsOwned) AS mean_val,
        COUNT(DISTINCT NumberCarsOwned) AS unique_vals,
        VARP(NumberCarsOwned) AS variance_val,
        STDEVP(NumberCarsOwned) AS stddev_val    
    FROM DimCustomer
;
GO

-- Data frequency distribution in categorical data in DimCustomer:
Create view freq_distribution_gender as
SELECT Gender, COUNT(*) AS freq
FROM DimCustomer
GROUP BY Gender;
GO
Create view freq_distribution_mstatus as
SELECT MaritalStatus, COUNT(*) AS freq
FROM DimCustomer
GROUP BY MaritalStatus;

GO
-- Correlation calculation: 
Create view correlations as 
WITH Stats AS (
    SELECT 
        AVG(YearlyIncome) AS mean_X,
        AVG(TotalChildren) AS mean_Y
    FROM DimCustomer
),
stats2 As(
    SELECT 
        AVG(YearlyIncome) AS mean_X,
        AVG(HouseOwnerFlag) AS mean_Y
    FROM DimCustomer
),
stats3 As(
    SELECT 
        AVG(YearlyIncome) AS mean_X,
        AVG(NumberCarsOwned) AS mean_Y
    FROM DimCustomer
),
stats4 as(
    select
        AVG(TotalChildren) as mean_X,
        AVG(NumberChildrenAtHome) as mean_Y
    From DimCustomer
),
stats5 as(
    select
        AVG(HouseOwnerFlag) as mean_X,
        AVG(NumberCarsOwned) as mean_Y
    From DimCustomer
)
SELECT 
    'YearlyIncome X Total childern' as corr_pair,
    (SUM((YearlyIncome - s.mean_X) * (TotalChildren - s.mean_Y)) /
    (SQRT(SUM(POWER(YearlyIncome - s.mean_X, 2))) * 
     SQRT(SUM(POWER(TotalChildren - s.mean_Y, 2))))) AS correlation_coefficient
FROM DimCustomer, Stats s
Union all
SELECT
    'YearlyIncome X HouseOwnerFlag' as corr_pair, 
    (SUM((YearlyIncome - s.mean_X) * (HouseOwnerFlag - s.mean_Y)) /
    (SQRT(SUM(POWER(YearlyIncome - s.mean_X, 2))) * 
     SQRT(SUM(POWER(HouseOwnerFlag - s.mean_Y, 2))))) AS correlation_coefficient
FROM DimCustomer, Stats s
Union all
SELECT
    'YearlyIncome X NumberCarsOwned' as corr_pair, 
    (SUM((YearlyIncome - s.mean_X) * (NumberCarsOwned - s.mean_Y)) /
    (SQRT(SUM(POWER(YearlyIncome - s.mean_X, 2))) * 
     SQRT(SUM(POWER(NumberCarsOwned - s.mean_Y, 2))))) AS correlation_coefficient
FROM DimCustomer, Stats s
Union all
SELECT
    'TotalChildren X NumberChildrenAtHome' as corr_pair, 
    (SUM((TotalChildren - s.mean_X) * (NumberChildrenAtHome - s.mean_Y)) /
    (SQRT(SUM(POWER(TotalChildren - s.mean_X, 2))) * 
     SQRT(SUM(POWER(NumberChildrenAtHome - s.mean_Y, 2))))) AS correlation_coefficient
FROM DimCustomer, Stats s
Union all
SELECT
    'HouseOwnerFlag X NumberCarsOwned' as corr_pair, 
    (SUM((HouseOwnerFlag - s.mean_X) * (NumberCarsOwned - s.mean_Y)) /
    (SQRT(SUM(POWER(HouseOwnerFlag - s.mean_X, 2))) * 
     SQRT(SUM(POWER(NumberCarsOwned - s.mean_Y, 2))))) AS correlation_coefficient
FROM DimCustomer, Stats s;
GO
-- Data frequency distribution in categorical data in DimGeography

Create view freq_distribution_stateprovincename as
SELECT StateProvinceName, COUNT(*) AS freq
FROM DimGeography
GROUP BY StateProvinceName;
GO
Create view freq_distribution_countryname as
SELECT EnglishCountryRegionName, COUNT(*) AS freq
FROM DimGeography
GROUP BY EnglishCountryRegionName;
GO
Create view freq_distribution_city as
SELECT City, COUNT(*) AS freq
FROM DimGeography
GROUP BY City;