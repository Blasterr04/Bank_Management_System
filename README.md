# 🏦 Bank Management System

A comprehensive data analytics project that processes, analyzes, and visualizes banking client data to provide insights into customer behavior, risk assessment, and financial performance.

## 📊 Project Overview

This Bank Management System integrates multiple technologies to create an end-to-end data pipeline:

- **Excel**: Initial data storage and preparation
- **PostgreSQL**: Robust database management and querying
- **Python (Google Colab/Jupyter Notebook)**: Data analysis and processing
- **Power BI**: Interactive dashboard and visualization

The system processes client banking information to generate valuable insights for decision-making, risk assessment, and customer relationship management.

## 🛠️ Tech Stack

| Technology | Purpose | Version |
|------------|---------|---------|
| Microsoft Excel | Data Storage & Preparation | 365+ |
| PostgreSQL | Database Management | 12+ |
| Python | Data Analysis & Processing | 3.8+ |
| Google Colab/Jupyter | Development Environment | - |
| Power BI | Data Visualization | Desktop |
| DAX | Data Analysis Expressions | - |

# 🏦 Bank Management System

## Overview 📌
The **Bank Management System** project is a comprehensive solution to manage and analyze banking client data using **Excel**, **PostgreSQL**, **Python (Google Colab/Jupyter Notebook)**, and **Power BI**. The system allows seamless data import, storage, processing, analysis, and visualization to support business intelligence, customer engagement insights, and financial reporting.

**Technologies Used:**
- **Excel:** Data source for client information.
- **PostgreSQL:** Relational database to store and query data.
- **Python (Google Colab/Jupyter Notebook):** Data analysis, preprocessing, and visualization.
- **Power BI:** Dashboard creation and business intelligence reporting.

---

## 🗂 Project Workflow

1. **Data Preparation (Excel)**
   - Client data was collected and structured in Excel.
   - Columns included `ClientID`, `Name`, `Age`, `LocationID`, `JoinedBank`, `BankingContact`, `Nationality`, `Occupation`, `FeeStructure`, `LoyaltyClassification`, `EstimatedIncome`, `SuperannuationSavings`, `AmountOfCreditCards`, `CreditCardBalance`, `BankLoans`, `BankDeposits`, `CheckingAccounts`, `SavingAccounts`, `ForeignCurrencyAccount`, `BusinessLending`, `PropertiesOwned`, `RiskWeighting`, `BRId`, `GenderId`, `IAId`.

2. **Data Storage (PostgreSQL)**
   - Data was imported from Excel into PostgreSQL using the `Clients` table.

   ```sql
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
   
   SELECT * FROM clients;
   ```

3. **Data Analysis (Python - Google Colab / Jupyter Notebook) 🐍**
   -Data imported from PostgreSQL into Python using `psycopg2` and `pandas`.
   -Performed exploratory data analysis (EDA), cleaning, and preprocessing.
   -Example code snippet:
   ```python
   import pandas as pd
   import psycopg2
   
   conn = psycopg2.connect(
       dbname="bankdb", 
       user="username", 
       password="password", 
       host="localhost", 
       port="5432"
   )
   
   query = "SELECT * FROM Clients;"
   df = pd.read_sql(query, conn)
   print(df.head())
   ```
4. **Analyses Performed** 
   - Customer segmentation by **income bands**
   - Calculation of **total deposits, loans, and fees**
   - Engagement metrics such as **customer retention duration**

5. **Dashboard Creation 📊 (Power BI)**
   -Connected Power BI directly to the PostgreSQL database
   -Created new calculated columns using **DAX**:

   ```DAX
   Processing Fees = 
   SWITCH('Clients - Banking'[Fee Structure],
   "High",0.05,
   "Mid" ,0.03,
   "Low" , 0.01 , 0
   )
   
   Income Band = 
   SWITCH(TRUE(),
   'Clients - Banking'[Estimated Income] < 100000,"Low",
   'Clients - Banking'[Estimated Income] < 300000,"Mid",
   "High" )
   
   Engagment Days = 
   DATEDIFF('Clients - Banking'[Joined Bank],TODAY(), DAY )
   
   Engagement Timeframe = 
   SWITCH(TRUE(),
   'Clients - Banking'[Engagment Days] < 365 , "< 1 Years",
   'Clients - Banking'[Engagment Days] < 1825 , "< 5 Years",
   'Clients - Banking'[Engagment Days] < 3650 , "< 10 Years",
   'Clients - Banking'[Engagment Days] < 7300 , "< 20 Years",
   "> 20 Years")
   ```
### Key Measures Created in Power BI 📊

```DAX
Total loan = SUM('Clients - Banking'[Bank Loans]) + 
             SUM('Clients - Banking'[Business Lending]) + 
             SUM('Clients - Banking'[Credit Card Balance])

Total Fees = SUMX('Clients - Banking', [Total loan] * 'Clients - Banking'[Processing Fees])

Total Deposits = SUM('Clients - Banking'[Bank Deposits]) +
                 SUM('Clients - Banking'[Saving Accounts]) +
                 SUM('Clients - Banking'[Checking Accounts]) +
                 SUM('Clients - Banking'[Foreign Currency Account])

Total Clients = DISTINCTCOUNT('Clients - Banking'[Client ID])

Engagement Length = SUM('Clients - Banking'[Engagment Days])
```
## 🛠 Implementation Details ⚙️

| Stage        | Tool                         | Description                           |
|------------- |----------------------------- |---------------------------------------|
| Data Entry   | Excel                        | Original client data input            |
| Database     | PostgreSQL                   | Store and query large datasets        |
| Analysis     | Python (Google Colab/Jupyter)| Data cleaning, preprocessing, visualization |
| BI Dashboard | Power BI                     | Dynamic reports, KPI tracking, calculated measures |

**Data Flow:**  
`Excel → PostgreSQL → Python (analysis)` and `PostgreSQL → Power BI (dashboard)`

---

## 📊 Results / Outputs

**Interactive Power BI dashboard including:**
- Total Clients
- Total Loans and Deposits
- Total Fees Generated
- Client Engagement Timeline
- Income Band Distribution

**Python analysis included:**
- Data quality checks
- Income and engagement statistics
- Correlation plots and visual insights

**Example visualizations in Power BI:**
- Loan vs Deposit Analysis  
- Fee generation by income band  
- Engagement distribution by timeframe  

---

## 🎯 Conclusions

- SQL and Python integration provides a robust system for querying and analyzing large banking datasets.
- Power BI dashboards enable real-time insights for decision-making.
- Income, fee structures, and engagement duration were key metrics for customer segmentation.
- This project demonstrates the synergy between **data storage, analysis, and visualization** for banking business intelligence.

---

## 📂 Project Files

- `Clients.xlsx` → Raw Excel data  
- `SQL_Queries.sql` → PostgreSQL table creation and sample queries  
- `Data_Analysis.ipynb` → Python analysis notebook  
- `PowerBI_Dashboard.pbix` → Final dashboard template  
- `Project_Report.pdf` → Detailed report with visuals and explanations
- 
---
## 🔹 Author  
👤 **Priyanshu Singh**  
- 🎓 Final Year Mechanical Engineering Student at IIT Ropar  
- 📊 Passionate about Data Science, Business Analytics & Product Analysis  
- 🎥 Content Creator: [The Unfiltered Guyy](https://youtube.com/@theunfilteredguyy)  
- 🔧 Technical Skills: SQL, Python, Power BI, Tableau, Excel, Product Management, A/B Testing, Data Visualization  
- 📧 Email: priyanshusingh04112003@gmail.com  
- 🌐 [LinkedIn](https://www.linkedin.com/in/priyanshu-singh-a47033265) | [YouTube](https://youtube.com/@theunfilteredguyy)

---
