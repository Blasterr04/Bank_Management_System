CREATE TABLE Clients (
    ClientID VARCHAR(20),
    Name VARCHAR(100),
    Age INT,
    LocationID INT,
    JoinedBank DATE,
    BankingContact VARCHAR(100),
    Nationality VARCHAR(50),
    Occupation VARCHAR(100),
    FeeStructure VARCHAR(50),
    LoyaltyClassification VARCHAR(50),
    EstimatedIncome DECIMAL(15,2),
    SuperannuationSavings DECIMAL(15,2),
    AmountOfCreditCards INT,
    CreditCardBalance DECIMAL(15,2),
    BankLoans DECIMAL(15,2),
    BankDeposits DECIMAL(15,2),
    CheckingAccounts DECIMAL(15,2),
    SavingAccounts DECIMAL(15,2),
    ForeignCurrencyAccount DECIMAL(15,2),
    BusinessLending DECIMAL(15,2),
    PropertiesOwned INT,
    RiskWeighting INT,
    BRId INT,
    GenderId INT,
    IAId INT
);

SELECT tablename 
FROM pg_tables 
WHERE schemaname = 'public';

select * from clients;
