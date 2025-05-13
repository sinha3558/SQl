create database bankingsystem;
use bankingsystem;
show databases;

use bankingsystem;

-- Table to store customer information
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- Table to store account information
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(15, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Table to store transaction information
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(50),
    amount DECIMAL(15, 2),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

-- Inserting customer records
INSERT INTO Customers (customer_id, name, address, phone, email)
VALUES 
(1, 'John Doe', '123 Main St, Cityville', '123-456-7890', 'john.doe@example.com'),
(2, 'Jane Smith', '456 Oak Rd, Townsville', '234-567-8901', 'jane.smith@example.com'),
(3, 'Alice Brown', '789 Pine Ave, Villageburg', '345-678-9012', 'alice.brown@example.com'),
(4, 'Bob White', '101 Maple Dr, Hamletton', '456-789-0123', 'bob.white@example.com'),
(5, 'Charlie Green', '202 Cedar Blvd, Hilltop', '567-890-1234', 'charlie.green@example.com'),
(6, 'David Black', '303 Birch Ln, Crossroad', '678-901-2345', 'david.black@example.com'),
(7, 'Emily Blue', '404 Cherry Way, Lakeside', '789-012-3456', 'emily.blue@example.com'),
(8, 'Frank Yellow', '505 Elm St, Riverside', '890-123-4567', 'frank.yellow@example.com'),
(9, 'Grace Red', '606 Pine Dr, Meadowland', '901-234-5678', 'grace.red@example.com'),
(10, 'Hannah Purple', '707 Oak Blvd, Seaside', '012-345-6789', 'hannah.purple@example.com'),
(11, 'Ivy Pink', '808 Willow Ln, Greenfield', '123-234-7890', 'ivy.pink@example.com'),
(12, 'Jack White', '909 Cedar Ave, Baytown', '234-345-8901', 'jack.white@example.com'),
(13, 'Kathy Gray', '1010 Maple St, Hillcrest', '345-456-9012', 'kathy.gray@example.com'),
(14, 'Liam Brown', '1111 Elm Blvd, Northfield', '456-567-0123', 'liam.brown@example.com'),
(15, 'Mona Black', '1212 Oak Lane, Southville', '567-678-1234', 'mona.black@example.com'),
(16, 'Nina Purple', '1313 Birch Ave, Parkwood', '678-789-2345', 'nina.purple@example.com'),
(17, 'Oscar Blue', '1414 Cherry Blvd, Rivertown', '789-890-3456', 'oscar.blue@example.com'),
(18, 'Paul Green', '1515 Pine Blvd, Westpoint', '890-901-4567', 'paul.green@example.com'),
(19, 'Quincy Yellow', '1616 Cedar Lane, Sunnyside', '901-012-5678', 'quincy.yellow@example.com'),
(20, 'Rita Red', '1717 Willow St, Foothill', '012-123-6789', 'rita.red@example.com');

-- Inserting account records
INSERT INTO Accounts (account_id, customer_id, account_type, balance)
VALUES 
(101, 1, 'Checking', 1500.00),
(102, 2, 'Savings', 2500.50),
(103, 3, 'Checking', 1200.75),
(104, 4, 'Savings', 3500.25),
(105, 5, 'Checking', 800.00),
(106, 6, 'Savings', 5200.10),
(107, 7, 'Checking', 1000.00),
(108, 8, 'Savings', 4300.90),
(109, 9, 'Checking', 2900.20),
(110, 10, 'Savings', 11000.50),
(111, 11, 'Checking', 1300.15),
(112, 12, 'Savings', 6000.00),
(113, 13, 'Checking', 950.00),
(114, 14, 'Savings', 4500.75),
(115, 15, 'Checking', 700.20),
(116, 16, 'Savings', 9800.60),
(117, 17, 'Checking', 1250.40),
(118, 18, 'Savings', 4700.80),
(119, 19, 'Checking', 5600.00),
(120, 20, 'Savings', 8000.30);

-- Inserting transaction records
INSERT INTO Transactions (transaction_id, account_id, transaction_date, transaction_type, amount)
VALUES 
(1, 101, '2025-05-01', 'Deposit', 500.00),
(2, 102, '2025-05-02', 'Withdrawal', 100.00),
(3, 103, '2025-05-03', 'Deposit', 300.00),
(4, 104, '2025-05-04', 'Withdrawal', 150.00),
(5, 105, '2025-05-05', 'Deposit', 200.00),
(6, 106, '2025-05-06', 'Withdrawal', 250.00),
(7, 107, '2025-05-07', 'Deposit', 700.00),
(8, 108, '2025-05-08', 'Withdrawal', 300.00),
(9, 109, '2025-05-09', 'Deposit', 1000.00),
(10, 110, '2025-05-10', 'Withdrawal', 500.00),
(11, 111, '2025-05-11', 'Deposit', 400.00),
(12, 112, '2025-05-12', 'Withdrawal', 200.00),
(13, 113, '2025-05-13', 'Deposit', 150.00),
(14, 114, '2025-05-14', 'Withdrawal', 50.00),
(15, 115, '2025-05-15', 'Deposit', 300.00),
(16, 116, '2025-05-16', 'Withdrawal', 600.00),
(17, 117, '2025-05-17', 'Deposit', 400.00),
(18, 118, '2025-05-18', 'Withdrawal', 350.00),
(19, 119, '2025-05-19', 'Deposit', 800.00),
(20, 120, '2025-05-20', 'Withdrawal', 100.00);

select * from Customers;
select * from Accounts;
select * from Transactions;

#List all customers with their account details:

create view tem_table as 
SELECT c.*, a.account_id, a.account_type, a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

select * from tem_table;

# Show customers who have a balance over 5000:

select name,account_type,balance
from
(SELECT c.*, a.account_id, a.account_type, a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
where balance > 5000) as customers_name
order by balance desc;

# Count of account types (Checking vs Savings):

select account_type,count(*) as cnt_of_account_type
from Accounts
group by account_type;

# Customers who do not have an account:


SELECT c.*, a.account_id, a.account_type, a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
where a.account_type is null;

SELECT *
FROM Customers
WHERE customer_id NOT IN (SELECT customer_id FROM Accounts);


# Top 5 customers with highest account balances:

select * from tem_table;

select name,balance
from
(
select name, balance, rank() over( order by balance desc) as rnk
from tem_table) as top_five
where rnk < 6;

# Total deposits and withdrawals for each account:


select * from Customers;
select * from Accounts;
select * from Transactions;


SELECT account_id, 
       SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE 0 END) AS total_deposits,
       SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount ELSE 0 END) AS total_withdrawals
FROM Transactions
GROUP BY account_id;

SELECT 
    account_id,
    transaction_type,
    SUM(amount) AS total_amount
FROM 
    Transactions
GROUP BY 
    account_id, transaction_type
ORDER BY 
    account_id, transaction_type;



# All transactions on May 10, 2025:

SELECT * FROM Transactions WHERE transaction_date = '2025-05-10';

    
#Customer name and total number of transactions per customer:


select * from Customers;
select * from Accounts;
select * from Transactions;

SELECT c.name, COUNT(t.transaction_id) AS total_transactions
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
GROUP BY c.name;

#Accounts with no transactions:

select * from Customers;
select * from Accounts;
select * from Transactions;

SELECT a.account_id, a.account_type
FROM accounts a
LEFT JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;

# Find the average transaction amount:

SELECT AVG(amount) AS avg_transaction_amount FROM Transactions;

#  Transactions between May 5 and May 15, 2025:

select *  from Transactions
where transaction_date between "2025-05-05" and "2025-05-15";

# Find all customers with phone numbers starting with '123'

select * from Customers;
select * from Accounts;
select * from Transactions;

SELECT * FROM Customers WHERE phone LIKE '123%';


# Most recent transaction per account:

select * from Customers;
select * from Accounts;
select * from Transactions;

select account_id,latest_date
from
(SELECT 
  account_id, 
  latest_date,
  RANK() OVER (ORDER BY latest_date) AS rankop
FROM (
    SELECT 
      account_id, 
      MAX(transaction_date) AS latest_date
    FROM Transactions
    GROUP BY account_id
) AS latest_dates) as lates_transcation
where rankop < 2;


# Find all savings accounts with balance greater than 5000:

select * from Customers;
select * from Accounts;
select * from Transactions;

select * 
from Accounts
where account_type = "Savings" and balance > 5000;

#Get all transactions that are withdrawals:


select * from Transactions
where transaction_type = "Withdrawal";

#Show customers who have checking accounts:

select c.name
from Customers c
join Accounts a
on c.customer_id = a.customer_id
where account_type = "Checking";

# Count total number of customers:

select * from Customers;
select * from Accounts;
select * from Transactions;

select count(*) as cnt_number
from Customers;

# Find the total balance of all savings accounts:

select account_type,sum(balance) as total_balance
from Accounts
where account_type = "Checking"
group by account_type

# Show transactions done after May 10, 2025:

select * from Transactions
where transaction_date > "2025-05-10";

# Get average balance of all accounts:

select avg(total_balance) as avg_balance
from
(select account_type,sum(balance) as total_balance
from Accounts
group by account_type) as avg_balance;

# List customers with balance below 1000:

select c.name
from Customers c
join Accounts a
on c.customer_id = a.customer_id
where balance < 1000;

# 2nd method

select name
from
(select name,balance
from
(select c.name,a.balance
from Customers c
join Accounts a
on c.customer_id = a.customer_id) as customer_list
where balance < 1000) as name_list;


# Total amount of all deposits:

select * from Customers;
select * from Accounts;
select * from Transactions;

select transaction_type,sum(amount) as total_amount
from Transactions
where transaction_type = "Deposit"
group by transaction_type;

# Find customer(s) with the highest account balance:

select * from Customers;
select * from Accounts;
select * from Transactions;

select name,balance
from
(select name,balance,
rank() over(order by balance desc) as rnkopp
from
(select c.name,a.balance
from Customers c
join Accounts a
on c.customer_id = a.customer_id) as name_) as customer_name
 where rnkopp = 1;

SELECT c.name, a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
WHERE a.balance = (SELECT MAX(balance) FROM Accounts);


select c.name,a.balance
from Customers c
join Accounts a
on c.customer_id = a.customer_id
order by balance desc
limit 1;

#  List each customer's total transaction amount:


select * from Customers;
select * from Accounts;
select * from Transactions;

select c.name,sum(t.amount) as total_transaction_amount
from Customers c
join Accounts a
on c.customer_id = a.customer_id
JOIN Transactions t On a.account_id = t.account_id
group by c.name;


SELECT c.name, SUM(t.amount) AS total_transactions
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
GROUP BY c.name;

# Get the number of transactions per account:

SELECT account_id, COUNT(*) AS num_transactions
FROM Transactions
GROUP BY account_id;

# Find customers who made a transaction on May 12, 2025:

select * from Customers;
select * from Accounts;
select * from Transactions;

SELECT c.name,transaction_date
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
where transaction_date = "2025-05-12";

# List customers who have more than 1000 in balance and have made a deposit:

select name
from
(SELECT c.name,a.balance,t.transaction_type
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
where a.balance > 1000 and transaction_type = "Deposit") as customer_name;


# Find customers whose name starts with 'J':

select * from Customers;
select * from Accounts;
select * from Transactions;

select * from Customers
where name like "j%";

# List customers with '@example.com' email domain:

SELECT * FROM Customers
WHERE email LIKE '%@example.com';

# Find all accounts with even account IDs:

SELECT * FROM Accounts
WHERE MOD(account_id, 2) = 0;

# 

SELECT * FROM Accounts
WHERE account_id % 2 = 0;

# # Find all accounts with odd account IDs:


SELECT * FROM Accounts
WHERE MOD(account_id, 2) = 1;

SELECT * FROM Accounts
WHERE account_id % 2 != 0;

#  Find customers who have not made any transactions:

SELECT c.name
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
where transaction_id is null;

# Top 3 customers by balance:

select * from Customers;
select * from Accounts;
select * from Transactions;

SELECT c.name,a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
order by balance desc
limit 3;

# Average deposit amount per account:

SELECT account_id, AVG(amount) AS avg_deposit
FROM Transactions
WHERE transaction_type = 'Deposit'
GROUP BY account_id;

# Total withdrawals per customer:

SELECT c.name, SUM(t.amount) AS total_withdrawal
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'Withdrawal'
GROUP BY c.name
order by total_withdrawal desc;


# Find customers who made both deposits and withdrawals:


select * from Customers;
select * from Accounts;
select * from Transactions;

select name
from
(select name,transaction_type,COUNT(transaction_type) as Type_count
from
(SELECT c.name,t.transaction_type
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id) as customer_table
where transaction_type in ("Deposit","Withdrawal")
group by name,transaction_type
having COUNT(transaction_type) = 2) as name_;

# 2nd 

SELECT c.name,SUM(CASE WHEN t.transaction_type = 'Deposit' THEN 1 ELSE 0 END) as Deposit_type,
SUM(CASE WHEN t.transaction_type = 'Withdrawal' THEN 1 ELSE 0 END) as Withdrawal_type 
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_type IN ('Deposit', 'Withdrawal')
GROUP BY c.name
having Deposit_type = 2 and withdrawal_type =2;


# Average transaction amount per transaction type

select * from Customers;
select * from Accounts;
select * from Transactions;

select transaction_type,avg(amount) as Average_transaction_amount
from Transactions
group by transaction_type;

# 2nd way

SELECT transaction_type, AVG(amount) AS avg_amount
FROM Transactions
GROUP BY transaction_type;

# Highest transaction amount and its details

select * from Transactions
order by amount desc
limit 1;

SELECT * FROM Transactions
WHERE amount = (SELECT MAX(amount) FROM Transactions);


# List all transactions with customer names


SELECT c.name, t.*
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id;

# List each customer's total number of accounts
select * from Customers;
select * from Accounts;
select * from Transactions;


select name,count(*) as number_of_account
from
(select c.name,a.account_type
from Customers c
join Accounts a
on a.customer_id = c.customer_id) as account_count
group by name;

# Find the customer with the highest account balance

select c.name,a.balance
from Customers c
join Accounts a
on a.customer_id = c.customer_id
order by a.balance desc
limit 1;

# Find accounts with more than one transaction

select * from Customers;
select * from Accounts;
select * from Transactions;

SELECT account_id, COUNT(*) AS transaction_count
FROM Transactions
GROUP BY account_id
HAVING COUNT(*) > 1;

SELECT a.account_id,t.transaction_id,count(*) as transaction_count
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
group by a.account_id,t.transaction_id
having transaction_count > 1;

#List the latest transaction for each account

select * from Customers;
select * from Accounts;
select * from Transactions;


SELECT t.*
FROM Transactions t
JOIN (
    SELECT account_id, MAX(transaction_date) AS latest_date
    FROM Transactions
    GROUP BY account_id
) latest ON t.account_id = latest.account_id AND t.transaction_date = latest.latest_date;


SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY transaction_date DESC) AS rn
    FROM transactions
) t
WHERE rn = 1;

# Top 5 customers by total deposits

SELECT c.name, SUM(t.amount) AS total_deposit
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'Deposit'
GROUP BY c.name
ORDER BY total_deposit DESC
LIMIT 5;



 













#









