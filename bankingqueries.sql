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
ADD CONSTRAINT pk_customer_id primary key (customerID);

select *  from customers;

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

desc customers;

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
references accounts(AccountID); 

desc transactions; 

alter table loans
add customerID int;

alter table loans
add constraint FK_Loans_CustomersT
foreign key (CustomerID)
references customers(CustomerID);

desc loans;

create table KYC(
KycID INT primary key,
AadharNo varchar(12) not null,
PanNo varchar(10) not null,
CustomerID int not null,
constraint fk_customers
foreign key (customerid)references customers(customerid)
);

show CREATE TABLE kyc; --

SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'bankingdb'
  AND TABLE_NAME = 'kyc';

desc KYC;

ALTER TABLE loans DROP COLUMN customersID;

ALTER TABLE loans
DROP FOREIGN KEY FK_Loans_Customers;

Drop Table kyc;

ALTER TABLE transactions 
ADD CONSTRAINT pk_transaction_id primary key (transactionid);

INSERT INTO Customers
VALUES
(101,'Amit','Sharma','amit@gmail.com',9876543210,'2024-01-15','1998-05-10');


INSERT INTO Customers
(customerid,firstname,lastname,email,phone,accountcreationdate,dateofbirth)
VALUES (102,'Priya','Patil','priya@gmail.com','9876543211','2024-02-01','1999-08-22');

INSERT INTO Customers
(phone,email,lastname,firstname,accountcreationdate,dateofbirth,customerid)
values ('9876543212','rahul@gmail.com','Verma','Rahul','2024-03-12','1997-11-14',103);

INSERT INTO Customers
VALUES
(104,'Sneha','Joshi','sneha@gmail.com','9876543213','2024-04-18','2000-01-05'),
(105,'Karan','Mehta','karan@gmail.com','9876543214','2024-05-25','1996-12-30');

select *  from customers;

ALTER TABLE branches
MODIFY branchphone VARCHAR(15);

INSERT INTO Branches
VALUES
(1,'Nagpur Branch','Sitabuldi, Nagpur','0712-123456'),
(2,'Pune Branch','Shivaji Nagar, Pune','020-223344'),
(3,'Mumbai Branch','Andheri, Mumbai','022-334455');

select * from branches;

INSERT INTO Accounts
VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',45000,102,2),
(1003,'Savings',18000,103,1),
(1004,'Current',72000,104,3),
(1005,'Savings',15000,105,2);

select * from accounts;

INSERT INTO Transactions
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);

select * from transactions;

INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);

select * from loans;

update customers
set email= 'amit2026@yahoo.com'
where customerid= 101;

update customers
set lastname = 'Joshi'
where customerid = 102;

select * from customers;
select * from branches;

update branches
set branchaddress = 'Civil_Lines,Nagpur',
branchphone = '0712-562692'
where branchid = 1;


insert into kyc
values(701,'123456789123','HGKUY8585U',101),
(702,'123445621432','YUHFT6532H',103),
(703,'852741963456','FGBVH5214O',102);

select * from kyc;
DELETE from kyc where kycid=702;

delete from kyc;

select * from customers;
select firstname,email,phone from customers;

select * from accounts

where Balance>40000;

select customerid,balance from accounts
where balance > 40000;

select accountid;

-- Get all data for all customers


-- Find details of customerid 104
select * from customers
where customerid = 104;

-- Find all customers whose account type is Savings and balance > 20000
SELECT 
    *
FROM
    accounts
WHERE
    accounttype = 'savings'
        AND balance > 20000;
        
select * FROM
    accounts
WHERE
    accounttype = 'savings'
        or balance > 20000;
        
        -- FInd all accounts where account type is NOT SAVINGS
        select * from accounts
        where not accounttype=  "Savings";
        
        select * from accounts
        where accounttype !=  "Savings";
        
        select * from accounts
        where accounttype <>  "Savings";
        
        select * from loans
	where interestrate = 8.5 or interestrate = 9.0;

-- Using IN Operator
     select * from loans
	where interestrate in (8.5,9);
    
    -- Using BETWEEN Operator
    
    select * from loans
    where InterestRate between 7.5 and 8.5;
    
    -- find all customers having balance 40k to 60k
    select * from accounts
    where balance between 20000 and 60000;
    
    select * from accounts
    where balance between 20000 and 60000 and AccountType = 'Savings';
    
    select * from customers;
    
    -- LIKE Operator with % 
    
     select * from customers
     where lastname Like 'J%';
     
       select * from customers
     where lastname Like '%a';
     
       select * from customers
     where firstname Like '%ya';
     
     -- LIKE Operator with __
     
     select * from customers
     where firstname Like 'p____';
     
     select * from customers
     where firstname Like '__hul';
     
     select * from accounts;
     
     -- Sort accounts table as per balance in descending order
     select * from accounts 
     order by balance;
     
     select * from accounts 
     order by balance desc; 
     
     select * from accounts 
     order by balance desc,CustomerID desc; 