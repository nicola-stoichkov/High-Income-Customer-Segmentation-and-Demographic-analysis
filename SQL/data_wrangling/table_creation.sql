-- Table creating:
CREATE TABLE DimCustomer (
    CustomerKey INT PRIMARY KEY,
    GeographyKey INT,
    CustomerAlternateKey VARCHAR(50) UNIQUE,
    Title VARCHAR(10),
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    NameStyle INT,
    BirthDate DATE,
    MaritalStatus VARCHAR(10),
    Suffix VARCHAR(10),
    Gender CHAR(1),
    EmailAddress VARCHAR(100),
    YearlyIncome DECIMAL(18, 2),
    TotalChildren INT,
    NumberChildrenAtHome INT,
    EnglishEducation VARCHAR(50),
    SpanishEducation VARCHAR(50),
    FrenchEducation VARCHAR(50),
    EnglishOccupation VARCHAR(50),
    SpanishOccupation VARCHAR(50),
    FrenchOccupation VARCHAR(50),
    HouseOwnerFlag INT,
    NumberCarsOwned INT,
    AddressLine1 VARCHAR(255),
    AddressLine2 VARCHAR(255),
    Phone VARCHAR(20),
    DateFirstPurchase DATE,
    CommuteDistance VARCHAR(50),
    FOREIGN KEY (GeographyKey) REFERENCES DimGeography(GeographyKey)
);

CREATE TABLE DimGeography (
    GeographyKey INT PRIMARY KEY,
    City VARCHAR(100),
    StateProvinceCode VARCHAR(10),
    StateProvinceName VARCHAR(100),
    CountryRegionCode VARCHAR(10),
    EnglishCountryRegionName VARCHAR(100),
    SpanishCountryRegionName VARCHAR(100),
    FrenchCountryRegionName VARCHAR(100),
    PostalCode VARCHAR(20),
    SalesTerritoryKey INT
);
