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
     
     select * from branches;
     select * from customers;
     select * from  accounts;
     select * from kyc;
     select * from loans ;
	select * from transactions;
      
      
     -- BRANCHES  (NULL address / NULL phone; branch 6 has no accounts)
-- ---------------------------------------------------------
INSERT INTO branches (BranchID, BranchName, BranchAddress, BranchPhone) VALUES
(4, 'Nashik Branch',      'College Road, Nashik',      NULL),
(5, 'Chandrapur Branch',  NULL,                        '07172-250100'),
(6, 'Aurangabad Branch',  'Station Road, Aurangabad',  '0240-334455');


-- CUSTOMERS  (NULL lastname / email / Phone / dates)
-- ---------------------------------------------------------
INSERT INTO customers (customerID, FirstName, lastname, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(106, 'Neha',   'Kulkarni', 'neha.k@gmail.com',       '9876543215', '2024-06-10', '1995-03-18'),
(107, 'Vikram', 'Singh',    NULL,                     '9876543216', '2024-07-01', '1994-07-07'),
(108, 'Anjali', NULL,       'anjali@outlook.com',     NULL,         '2024-08-14', '2001-09-12'),
(109, 'Rohan',  'Deshmukh', 'rohan.d@yahoo.com',      '9876543218', NULL,         '1993-02-25'),
(110, 'Pooja',  'Joshi',    'pooja@gmail.com',        '9876543219', '2024-09-30', NULL),
(111, 'Suresh', 'Patil',    NULL,                     NULL,         '2024-10-05', '1990-06-15'),
(112, 'Meera',  'Nair',     'meera.nair@gmail.com',   '9876543221', '2025-01-20', '1999-12-01'),
(113, 'Amit',   'Verma',    'amitv@rediffmail.com',   '9876543222', '2025-02-11', '1998-05-10'),
(115, 'Sanjay', 'Mehta',    'sanjay.m@gmail.com',     NULL,         '2025-04-09', '1988-10-28');

-- lastname omitted on purpose, so the DEFAULT 'NA' is applied
INSERT INTO customers (customerID, FirstName, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(114, 'Kavita', 'kavita@gmail.com', '9876543223', '2025-03-03', '2002-04-17');

-- ACCOUNTS  (NULL AccountType / Balance / CustomerID / BranchID)
-- Customers 114 and 115 intentionally have NO account.
-- ---------------------------------------------------------
INSERT INTO accounts (AccountID, AccountType, Balance, CustomerID, BranchID) VALUES
(1006, 'Savings', 32000.00,  106,  1),
(1007, 'Current', 150000.00, 107,  3),
(1008, 'Savings', NULL,      108,  2),
(1009, NULL,      5000.00,   109,  4),
(1010, 'Savings', 1000.00,   110,  4),
(1011, 'Current', 98000.00,  111,  5),
(1012, 'Savings', 12000.00,  112,  NULL),
(1013, 'Current', 27500.50,  101,  3),
(1014, 'Savings', 60000.00,  NULL, 1),
(1015, 'Savings', 8500.00,   113,  2);


-- KYC  (table was empty; only some customers have KYC)
-- No KYC for 108, 110, 111, 113, 114, 115
-- ---------------------------------------------------------
INSERT INTO kyc (kycid, aadharNo, panNo, customerid) VALUES
(1, '234567890123', 'ABCPS1234A', 101),
(2, '345678901234', 'BCDPJ2345B', 102),
(3, '456789012345', 'CDEPV3456C', 103),
(4, '567890123456', 'DEFPJ4567D', 104),
(5, '678901234567', 'EFGPM5678E', 105),
(6, '789012345678', 'FGHPK6789F', 106),
(7, '890123456789', 'GHIPS7890G', 107),
(8, '901234567890', 'HIJPD8901H', 109),
(9, '112233445566', 'IJKPN9012I', 112);

  -- LOANS  (NULL InterestRate / LoanAmount / EndDate / CustomerID)
-- ---------------------------------------------------------
INSERT INTO loans (LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID) VALUES
(504, 400000.00, 8.25, '2025-01-10', '2030-01-10', 105),
(505, 150000.00, NULL, '2025-02-01', '2027-02-01', 106),
(506, 900000.00, 7.50, '2025-03-05', NULL,         107),
(507, NULL,      9.50, '2025-04-01', '2029-04-01', 109),
(508, 300000.00, 8.50, '2025-05-15', '2030-05-15', 101),
(509, 120000.00, 10.00,'2025-06-01', '2026-06-01', NULL);

-- ---------------------------------------------------------
-- TRANSACTIONS  (NULL Amount / TransactionType / AccountID / TransactionDate)
-- Accounts 1008, 1009, 1012, 1014 have no transactions.
-- ---------------------------------------------------------
INSERT INTO transactions (TransactionID, TransactionDate, Amount, TransactionType, AccountID) VALUES
(6,  '2025-01-18', 1500.00,  'Deposit',    1005),
(7,  '2025-01-20', NULL,     'Deposit',    1006),
(8,  '2025-02-02', 4500.00,  'Withdrawal', 1006),
(9,  '2025-02-05', 20000.00, 'Deposit',    1007),
(10, '2025-02-10', 2500.00,  NULL,         1007),
(11, '2025-02-14', 800.00,   'Transfer',   1001),
(12, '2025-02-20', 12000.00, 'Transfer',   1004),
(13, '2025-03-01', 6000.00,  'Deposit',    NULL),
(14, '2025-03-05', 3500.00,  'Withdrawal', 1010),
(15, NULL,         9000.00,  'Deposit',    1011),
(16, '2025-03-15', 500.00,   'Withdrawal', 1002),
(17, '2025-03-18', 15000.00, 'Deposit',    1013),
(18, '2025-04-01', 2200.00,  'Withdrawal', 1013),
(19, '2025-04-10', 7500.00,  'Deposit',    1001),
(20, '2025-04-12', 1000.00,  'Transfer',   1015);



-- DISTINCT clause
select DISTINCT AccountType from accounts; 
select DISTINCT transactiontype from transactions; 
select DISTINCT customerid,LoanID from loans; 

-- LIMIT clause 
select* from transactions
LIMIT 5;

select* from transactions
order by amount desc 
limit 5;

-- Find top 2 transactions having highest withdrawal amount 
select* from transactions
where transactiontype = "withdrawal"
order by amount desc 
limit 2;

-- OFFSET CLAUSE
select * from customers;
select * from customers
LIMIT 2 OFFSET 5;

-- FIND THE CUSTOMER HAVING 3RD HIGHEST LOAN AMOUNT
select* from LOANS
order by LOANamount desc 
limit 1 OFFSET 2;

select * from loans
where interestrate in (8,5,9,0);

select * from transactions 
where TransactionType not in ("deposit","withdrawal");

-- NULL
select customerID,firstname,lastname,email from customers
where email IS NULL;

select customerID,firstname,lastname,email from customers
where email IS NULL;

select customerID,firstname,lastname,email from customers
where lastname IS NULL and phone is null;

-- IS NOT NULL

select customerID,firstname,lastname,email from customers
where email is not null;

-- CASE STATEMENTS

select * from loans;
select loanid,loanamount,customerID,
case
when loanamount >= 500000 then "High value loan"
when loanamount >= 200000 then "Medium value loan"
else "Low value loan"
end as loancategory
from loans;

-- 13/11/2026

-- Categorize the deposits in the transactions in the 
-- 
-- 
-- 
-- 
-- 

select transactions amount; 
cas e
when transactiontype = "deposit" and amount >= 10000 THEN "High amount"


-- String Functions

-- UPPER() FUNCTION

select upper ("hello");

select upper(firstname) AS Firstname , phone , email from customers;

-- LOWER() FUNCTION

select * from customers;
select lower (firstname) AS Firstname , lower(lastname) Lastname from customers;

-- LENGTH() FUNCTION
select length("NAGPUR") AS "NoOfCharacters"; -- GIVES O/P IN NUMBER OF BYTES
select length("नागपुर") ; -- GIVES O/P IN NUMBER OF BYTES
select char_length("NAGPUR"); -- GIVES O/P IN NUMBER OF CHARACTERS
select char_length("नागपुर"); -- GIVES O/P IN NUMBER OF CHARACTERS

-- CONCAT FUNCTIONS

select  concat("Hello"," ","World") as ConcatenatedString;
select concat(firstname, " ", lastname) as fullname, phone,email from customers;

-- SUBSTRING() OR SUBSTR() FUNCTION 

select substr("Hello World India",7,5) as extractedstring;

select customerid, concat(substr(firstname1,1),"-"lastname) as fullname, 
phone , email from customers ;

-- TRIM() FUNCTION
select length("    Hello World    ");
select length(trim("    Hello World   "));
select length(trim(substring("Hello World",6)));

-- REPLACE() FUNCTION

select replace();

-- MATHEMATICAL FUNCTIONS

-- ROUND FUNCTION
select * from accounts;

select avg(Balance) from accounts
where accounttype = "Savings";

select round(avg(Balance),2) as AvgBalance from accounts
where accounttype = "Savings";


-- EX OF ROUND()
select round(3.6);
select round(3.3);
select round(3.5);

-- CEIL() OR CEILING() FUNCTION
select ceiling(avg(Balance)) from accounts
where accounttype = "Savings";

-- FLOOR FUNCTION
select floor(avg(Balance)) from accounts
where accounttype = "Savings";

-- ABSOLUTE() FUNCTION -- IT REMOVES THE signal
select abs(-3656);
select abs(-1.365);
select abs(6.464);

-- MOD() FUNCTION -- IT RETURNS THE REMAINDER VALUE
select (7/3);
select mod(7,3);

-- POWER()
select power(2,3);
select power(1.5,3);

-- SQRT()
select sqrt(123);
select sqrt(144); 
