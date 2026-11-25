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

-- DATE FUNCTIONS
select * from customers;

-- NOW FUNCTION

select now();

select current_date();
select curdate();

select current_time();
select curtime();

select CustomerID,FirstName,dateofbirth,
year(dateofbirth),month(dateofbirth),day(dateofbirth)
from customers where customerID = 104;

select CustomerID,FirstName,dateofbirth,
 year(curdate()) - year(dateofbirth) as age
 from customers where customerID = 104;
 
 -- DATEDIFF 
select firstname,dateofbirth,
 round(datediff(curdate(), dateofbirth) / 365,1) as age
 from customers;
 
 select firstname,dateofbirth,
 concat(firstname,"Age is ",round(datediff(curdate(), dateofbirth) / 365,1)) as age
 from customers;
 
 -- DATE_ADD
 select concat(firstname," ",lastname) as fullname,
 accountcreationdate,
 date_add( accountcreationdate, interval 1 year) as KYCRENEWAL
  from customers;
  
  -- DATE_SUBTRACT
  
  select date_sub(curdate(), INTERVAL 7 DAY);
  
  -- AGGREGATE FUNCTIONS
  
  -- CALCULATE THE TOTAL BALANCE MAINTAINED ACROSS ALL CUSTOMER ACCOUNTS
  
  select sum(balance) totalbalance from accounts;
  
  -- CALCULATE THE AVERAGE BALANCE MAINTAINED ACROSS ALL CUSTOMER ACCOUNTS
  
  select avg(balance) averagebalance from accounts;
  
  -- CALCULATE THE HIGHEST BALANCE MAINTAINED ACROSS ALL CUSTOMER ACCOUNTS
  
  select  max(balance) Highest_Balance from accounts;
  
  -- DETERMINE THE TOTAL NUMBER OF CUSTOMER ACCOUNTs
  -- AVAILABLE IN THE SYSTEM
  
  select  count(*) as NoOfAccounts from accounts;
  
     -- GROUP BY
     
   select accounttype,
   count(*) from accounts 
   group by accounttype;
   
    select accounttype, sum(balance) as NoOfAccounts
   from accounts 
   group by accounttype;
   
   -- FIND TOTAL AMOUNT BY TRANSACTION TYPE
   
   select * from transactions;
   
 select transactiontype, sum(amount) as NoOfTransaction
   from transactions 
   group by transactiontype;
   
   --
   --
   --
   --
   
   -- FIND TOTAL ACCOUNTS FOR BRANCH AND ACCOUNT TYPE
   select * from accounts;
   
   select branchid, accounttype, count(*) as NoOfAccounts
   from accounts
   group by branchid, accounttype
   order by NoOfAccounts desc;
   
    -- HAVING CLAUSE
    
    -- FIND TRANSACTION TYPE WHERE TOTAL AMOUNT FOR THAT TRANSACTION TYPE EXCEEDS 20000
    
    select transactiontype, sum(amount) as TotalAmount
   from transactions 
   group by transactiontype
   having sum(amount) > 10000;
   
     select transactiontype, sum(amount) as TotalAmount
   from transactions 
   group by transactiontype
   having sum(amount) > 10000 and transactiontype = "deposit" ;
   
   select * from transactions;
   
   select transactiontype, sum(amount) as TotalAmount;
   
   select * from customers;
   
   -- FIND THE NUMBER OF CUSTOMERS JOINED ACCORDING TO THE YEAR FROM CUSTOMERS TABLE
   
    select year(accountcreationdate) as Years  , count(*) as TotalCustomers
   from customers 
   group by Years;
   
     select year(accountcreationdate) as Years  , count(*) as TotalCustomers
   from customers 
   group by Years
   order by totalcustomers desc;
   
   
   -- FIND TOTAL LOAN AMOUNT AMOUNT FOR ALL THE CUSTOMERS 
    select * from loans;
    
    select customerID, sum(LoanAmount) as TotalLoanAmount
   from loans 
   group by customerID
   order by Customerid ;
   
   -- DISPLAY DISTINCT BRANCHIDs FROM ACCCOUNTS WHERE BALANCE > 30000.
   
   select * from accounts;
   
    select branchId, balance from accounts
 where balance > 30000;
 
 -- DISPLAY ALL SAVINGS ACCOUNTS BELONGING TO BRANCH 1 OR 3.
 
select * from accounts
 where  accounttype = "savings"and  (BranchID = "1" or branchid = "3"); 
 
 -- GROUP BY WITH WHERE AND HAVING 
 
 -- FIND THE AVERAGE BALANCE OF CURRENT ACCOUNT FOR EACH BRANCH. DISPLAY  ONLY BRANCHES WHERE THE AVERAGE BALNCE EXCEEDS RS 40000. 
 
 select * from accounts;
   select branchId, accounttype, avg(balance) as AvgBalance from accounts
 where accounttype = "CURRENT"
 group by branchid;
 
 select * from customers;
 select * from accounts;
 
 -- 18/11/2026
 
 -- JOINS 
 -- A JOIN COMBINES RELATED ROWS FROM DIFFERENT TABLES BASED ON A COMMON COLUMN
 
 -- 1. INNER JOIN
-- MATCHES ROWS THAT EXIST IN BOTH TABLES

 -- FIND ALL CUSTOMERS WHO HAVE ACCOUNTS AND SHOW THEIR BALANCE.
 
 select c.CustomerID,c.firstname,c.lastname,a.AccountType,a.balance 
 from customers c 
 inner join accounts a 
 on c.CustomerID  = a.CustomerID;
 
  select *
 from customers c 
 inner join accounts a 
 on c.CustomerID  = a.CustomerID;
 
 -- FIND ALL CUSTOMERS WHO HAVE LOANS
 -- OUTPUT SHOULD CONTAIN CUSTOMERID,FIRSTNAME,LASTNAME,PHONE,LOANAMOUNT
 
 select * from loans;
 
 select c.CustomerID,c.firstname,c.lastname,c.phone,l.loanamount
 from customers c 
 inner join loans l # BY DEFAULT SQL USES INNER JOIN IF JOIN NAME OR JOIN TYPE IS NOT MENTIONED IN THE QUERY
 on c.CustomerID  = l.CustomerID;
 
 -- 19/11/2026
 
 -- 20/11/2026
 
 -- 23/11/2026
 
 -- SCALAR SUBQUERY
 -- A SCALAR SUBQUERY RETURNS EXACTLY ONE ROW AND COLUMN.
 
 select customerid, accountid, accounttype, balance
 from accounts
 where balance > (select avg(balance) from accounts where accounttype = "Savings")
 && Accounttype ="Savings";
 

 
 select c.customerid,c.firstname, a.accountid,a.accounttype,a.balance
 from accounts a
 left join customera c
 on a.CustomerID = c.CustomerID
 where balance > (select avg(balance) from accounts where accounttype = "Savings")
 && Accounttype ="Savings";
 
  -- 24/11/2026
  
  -- FIND THE ACCOUNT(S) HAVING THE HIGHEST BALANCE
  
 SELECT 
    customerid, accounttype, balance
FROM
    accounts
WHERE
    balance = (SELECT 
            MAX(Balance)
        FROM
            accounts);
 
-- FIND CUSTOMERS WHOSE YEAR OF BIRTH IS EARLIER THAN THE AVERAGE YEAR OF BIRTH
-- OF ALL CUSTOMERS

SELECT 
    customerid, firstname, lastname, dateofbirth
FROM
    customers
WHERE
    YEAR(DateOfBirth) < (SELECT 
            AVG(YEAR(DateOfBirth))
        FROM
            customers);
  
 --  MULTIPLE ROW SUBQUERY
 
 -- MULTIPLE ROW SUBQUERY RETURN MULTIPLE ROWS AND USUALLY A SINGLE COLUMN.
 
 -- FIND ALL CUSTOMERS WHO HAVE TAKEN ATLEAST ONE LOAN
 
 select * from loans;
 
 select c.customerid,c.firstname,l.loanamount
 from customers c
 join loans l
 on c.customerid = l.customerID;    -- USING JOIN 
 
 select customerid,firstname from customers
 where customerid in 
(select customerid from loans);

-- FIND ALL CUSTOMERS WHO HAVE ATLEAST ONE SAVINGS ACCOUNT.

select * from accounts; 

select customerid,firstname from customers where customerid in
(select customerid from accounts where accounttype = "Savings");

select * from accounts; 

-- UPDATE CUSTOMERID TO 114

update accounts set customerid = 114
where accountid = 1014;

-- UPDATE ACCOUNT TYPE OF ACCOUNT ID 1009 TO CURRENT.

update accounts set accounttype = "Current"
where accountid = 1009;

-- UPDATE BALANCE TO 0 FOR ACCOUNT ID 1008.

update accounts set Balance = 0
where accountid = 1008;

-- UPDATE BRANCH ID TO 5 FOR ACCOUNTID 1012.

UPDATE ACCOUNTS SET BRANCHID = 5
WHERE ACCOUNTID = 1012;

select * from accounts;
select * from branches;
select * from customers;

-- ADD ACCOUNT CREATION DATE FOR CUSTOMER ID 109.

update customers set accountcreationdate = "2026-01-12"
where customerid = 109;

select * from loans;

update loans set loanamount = 200000
where loanid = 507;

update loans set customerid = 104
where loanid = 509;

select * from transactions;

update transactions set amount = 6500
where transactionid = 7;

update transactions set transactiontype = "Withdrawal"
where transactionid = 10;

update transactions set accountid = 1006
where transactionid = 13;

-- FIND ALL CUSTOMERS WHO HAVE AN ACCOUNT IN BRANCHID = 1.

select customerid,firstname,lastname from customers
where customerID in
(select customerid from accounts where Branchid = 1);

-- 25/11/2026.

-- FIND ALL ACCOUNTS WHOSE BALANCE IS GREATER THAN ANY ACCOUNT IN BRANCH = 1.

select accountid,accounttype,balance,customerid
from accounts
where balance > ANY (
select balance from accounts where branchid = 1
);

select accountid,accounttype,balance,customerid
from accounts
where balance > ALL (
select balance from accounts where branchid = 1
);

-- FIND THE BRANCH WITH THE HIGHEST AVERAGE ACCOUNT BALANCE

select branchid,avg(balance) from
accounts
group by Branchid
order by avgbalance desc
limit 1;

select * from branches;


select branchid,avg(balance) as avgbal from accounts
group by branchid
having avgbal > (
select max(avgbalance) from
(select avg(balance) as avgbalance from accounts 
group by branchid) as t);

select branchid,avg(balance) as avgbal from accounts
group by branchid
having avgbal >= (
select max(avgbalance) from
(select avg(balance) as avgbalance from accounts 
group by branchid) as t);


-- CORRELATED SUBQUERY.
-- A CORRELTED SUBQUERY REFERENCES ONE OR MORE COLUMNS FROM THE OUTER QUERY.
-- IT CANNOT EXECUTE INDEPENDENTLY AND RUNS ONCE FOR EACH ROW OF THE OUTER QUERY.

-- QUE :-  FIND ACCOUNTS WHOSE BALANCE IS GREATER THAN THE AVERAGE BALANCE OF THEIR RESPECTIVE BRANCH

select a.accountid,a.branchid
from accounts a
where a.balance > (
select avg(balance)
from accounts
where branchid = a.branchid
);

-- FIND EMPLOYEES WHOSE SALARY IS GREATER THAN THE AVERAGE SALARY OF THE RESPECTIVE DEPARTMENTS.

select * from employees;

-- find customers who have  more than one account.