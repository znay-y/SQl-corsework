CREATE TABLE Countries(
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(100) NOT NULL,
    CountryGDP DECIMAL(18, 2) NOT NULL,
    CountryPopulation INT NOT NULL,
    CountryArea DECIMAL(18, 2) NOT NULL
    CountryDevelopment varchar(50) NOT NULL
)

CREATE TABLE Climate(
    ClimateID INT PRIMARY KEY,
    CountryID INT NOT NULL,
    AverageTemperature decimal(5, 2) NOT NULL,
    AirqualityIndex INT NOT NULL,
    RiverPollutionLevel INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
)

CREATE TABLE ClimateIsues(
    IssueID INT PRIMARY KEY,
    CountryID INT NOT NULL,
    IssueName VARCHAR(100) NOT NULL,
    EstimatedDamageCost DECIMAL(18, 2) NOT NULL,
    SeverityLevel INT NOT NULL,
    IssueBudget DECIMAL(18, 2) NOT NULL,
    IssuesDate DATE NOT NULL,
    IssueStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
 
)

CREATE TABLE ClimateActions(
    ActionID INT PRIMARY KEY,
    CountryID INT NOT NULL,
    RequiredBudget DECIMAL(18, 2) NOT NULL,
    BudgetReceived DECIMAL(18, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
    )

CREATE TABLE ClimateFunding(
    FundingID INT PRIMARY KEY,
    CountryID INT NOT NULL,
    AmountGiven DECIMAL(18, 2) NOT NULL,
    AmountUsed DECIMAL(18, 2) NOT NULL,
)
    