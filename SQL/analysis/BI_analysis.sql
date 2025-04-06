-- Calculating the High-Income treshold (75% above the average income)

select avg(YearlyIncome)*1.75 as highincome_treshold
from DimCustomer;

-- Rounding the calculated threshold to 100,000 for simplicity and practical application.
GO

-- State/Province level CTE:
Create View HighIncomeCustomerSegmentation_Statelevel as
WITH HighIncomeStateDensity AS (
    SELECT
        g.EnglishCountryRegionName,
        g.StateProvinceName,
        COUNT(c.CustomerKey) as HighIncomeCustomerCount
    FROM DimGeography g
    JOIN
        DimCustomer c on g.GeographyKey = c.GeographyKey
    WHERE c.YearlyIncome > 100000
    GROUP BY
        g.EnglishCountryRegionName,
        g.StateProvinceName
),
TopHighIncomeStates as (
    SELECT
        TOP 10 
        EnglishCountryRegionName,
        StateProvinceName,
        HighIncomeCustomerCount
    FROM HighIncomeStateDensity
    Order by HighIncomeCustomerCount DESC
)
Select 
    t.EnglishCountryRegionName,
    t.StateProvinceName,
    Count(c.CustomerKey) as HighIncomeCustomerCount,
    Format(AVG(c.YearlyIncome), 'N2') as Avg_income
FROM
    TopHighIncomeStates t
JOIN
    DimGeography g ON t.EnglishCountryRegionName = g.EnglishCountryRegionName AND t.StateProvinceName = g.StateProvinceName
JOIN
    DimCustomer c ON g.GeographyKey = c.GeographyKey
WHERE c.YearlyIncome > 100000
GROUP BY
    t.EnglishCountryRegionName,
    t.StateProvinceName

GO

-- City level CTE with included columns for demographic traits

Create view HighIncomeCustomerDemographic_Citylevel as
WITH HighIncomeCityDensity AS (
    SELECT
        g.EnglishCountryRegionName,
        g.StateProvinceName,
        g.City,
        COUNT(c.CustomerKey) AS HighIncomeCustomerCount
    FROM
        DimGeography g
    JOIN
        DimCustomer c ON g.GeographyKey = c.GeographyKey
    WHERE
        c.YearlyIncome > 100000
    GROUP BY
        g.EnglishCountryRegionName,
        g.StateProvinceName,
        g.City
),
TopHighIncomeCities AS (
    SELECT TOP 10
        EnglishCountryRegionName,
        StateProvinceName,
        City,
        HighIncomeCustomerCount
    FROM
        HighIncomeCityDensity
    ORDER BY
        HighIncomeCustomerCount DESC
)
SELECT
    t.EnglishCountryRegionName,
    t.StateProvinceName,
    t.City,
    COUNT(c.CustomerKey) AS HighIncomeCustomerCount,
    FORMAT(AVG(c.YearlyIncome), 'N2') AS AverageIncome,
    FORMAT(AVG(CASE WHEN c.MaritalStatus = 'M' THEN 1.0 ELSE 0.0 END) * 100, 'N2') AS MarriedPercentage,
    FORMAT(AVG(CASE WHEN c.Gender = 'M' THEN 1.0 ELSE 0.0 END) * 100, 'N2') AS MalePercentage,
    AVG(c.TotalChildren) AS AverageChildren,
    AVG(c.NumberCarsOwned) as AverageCars,
    AVG(case when c.HouseOwnerFlag = 1 then 1.0 else 0.0 end)*100 as HouseOwnerPercentage
FROM
    TopHighIncomeCities t
JOIN
    DimGeography g ON t.EnglishCountryRegionName = g.EnglishCountryRegionName AND t.StateProvinceName = g.StateProvinceName AND t.City = g.City
JOIN
    DimCustomer c ON g.GeographyKey = c.GeographyKey
WHERE c.YearlyIncome > 100000
GROUP BY
    t.EnglishCountryRegionName,
    t.StateProvinceName,
    t.City;
