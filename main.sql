-- Stores information about the contires 
CREATE TABLE Countries(
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(100) NOT NULL,
    CountryGDP DECIMAL(18, 2) NOT NULL,
    CountryPopulation INT NOT NULL,
    CountryArea DECIMAL(18, 2) NOT NULL
    CountryDevelopment varchar(50) NOT NULL
)

-- Stores information about the communities in a given country
CREATE TABLE Commnuitiies(
    CountryID INT PRIMARY KEY,
    CommunityID INT NOT NULL,
    CommunityName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Population INT NOT NULL,
    Finance DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
)

-- Data for teh climate of a given country
CREATE TABLE Climate(
    ClimateID INT PRIMARY KEY,
    CountryID INT NOT NULL,
    AverageTemperature decimal(5, 2) NOT NULL,
    AirqualityIndex INT NOT NULL,
    RiverPollutionLevel INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
)

-- General table for issues and actions
CREATE TABLE ClimateEvent(
    ClimateEventID INT PRIMARY KEY,
    CountryID INT NOT NULL,
    EventName VARCHAR(100) NOT NULL,
    Status VARCHAR(50) NOT NULL,
)

-- Specialization of climate events for issues (natrual disasters, pollution, etc.)
CREATE TABLE ClimateIsues(
    EstimatedDamageCost DECIMAL(18, 2) NOT NULL,
    SeverityLevel INT NOT NULL,
    IssueBudget DECIMAL(18, 2) NOT NULL,
    IssuesDate DATE NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
)

-- Specialization of climate events for actions (renewable energy projects, reforestation, etc.)
CREATE TABLE ClimateActions(
    RequiredBudget DECIMAL(18, 2) NOT NULL,
    BudgetReceived DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
)

-- Information for transactions related to climate events
CREATE TABLE Transactions(
    TransactionID INT PRIMARY KEY,
    CountryID INT NOT NULL,
    amount DECIMAL(18, 2) NOT NULL,
    ClimateEventID INT NOT NULL,
    FOREIGN KEY (ClimateEventID) REFERENCES ClimateEvent(ClimateEventID)
)