SHOW databases;

create database bankingDB;
use bankingDB;

create table customers(
customerID INT,
firstname varchar(50),
lastname varchar(50),
email varchar(100),
phone varchar(10)
);

desc customers;
ALTER TABLE customers 
ADD CONSTRAINT pk_customers_id primary key (customerID);

select * from customers;

ALTER table customers
ADD AccountCreationDate Date;

CREATE TABLE Accounts (
AccountID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);
alter table accounts
add constraint PK_AccountID primary key(AccountID);

desc accounts;

CREATE TABLE TRANSACTIONS (
TransactionID INT,
TransactionDate DATE,
Amount DECIMAL(10,2),
TransactionType VARCHAR(20)
);
alter table transactions
add constraint PK_TransactionID primary key (TransactionID);

desc Accounts;

create table Branches (
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(10)
);
alter table Branches 
add constraint PK_BranchID primary key (BranchID);

create table AccountBranches(
AssignmentDate date
);
desc accountbranches;

select * from branches;
create table loans(
LoanID int,
LoanAmount decimal(10,2),
InterestRate decimal(5,2),
Startdate date,
Enddate date
);
alter table loans
add constraint PK_LoanID primary key (LoanID);

desc loans;


alter table customers
Add	DateOfBirth Date;

desc customers

ALTER table customers
modify phone varchar(20);


ALTER table accounts
add constraint chk_MinBalance
CHECK (Balance >= 1000); 

desc accounts;

DROP TABLE AccountBranches;

ALTER TABLE Accounts
ADD CustomerID INT;

alter table accounts
add constraint FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

desc accounts;

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

DESC CUSTOMERS;

ALTER TABLE Customers
ADD constraint uq_Email UNIQUE (Email);

desc customers;

alter table customers 
alter column lastname set default "NA";

alter table accounts 
add BranchID int;

alter table accounts
add constraint FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES branches(BranchID);

desc accounts;

alter table transactions
add AccountID int; 

alter table Transactions
add constraint FK_Transactions_Accounts
foreign key (AccountID)
references accounts(AccountsID); 

desc transactions; 

alter table loans
add customersID int;

alter table loans
add constraint FK_Loans_Customers
foreign key (CustomersID)
references customers(CustomersID);

desc loans;



