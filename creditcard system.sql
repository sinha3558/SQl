create database creditcardstore;
use creditcardstore;
show databases;

use creditcardstore;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255)
);


INSERT INTO Customers (customer_id, name, email, phone, address) VALUES
(1, 'Amit Sharma', 'amit.sharma@example.com', '9876543210', 'Mumbai, Maharashtra'),
(2, 'Priya Mehra', 'priya.mehra@example.com', '9123456789', 'Delhi'),
(3, 'Ravi Kumar', 'ravi.kumar@example.com', '9876512345', 'Chennai, Tamil Nadu'),
(4, 'Anita Joshi', 'anita.joshi@example.com', '9988776655', 'Bangalore, Karnataka'),
(5, 'Karan Patel', 'karan.patel@example.com', '8899776655', 'Ahmedabad, Gujarat'),
(6, 'Sneha Reddy', 'sneha.reddy@example.com', '9001234567', 'Hyderabad, Telangana'),
(7, 'Vikram Singh', 'vikram.singh@example.com', '8796543210', 'Jaipur, Rajasthan'),
(8, 'Neha Desai', 'neha.desai@example.com', '9102837465', 'Pune, Maharashtra'),
(9, 'Arjun Nair', 'arjun.nair@example.com', '9812345678', 'Kochi, Kerala'),
(10, 'Isha Kapoor', 'isha.kapoor@example.com', '9988991122', 'Chandigarh'),
(11, 'Siddharth Verma', 'siddharth.verma@example.com', '9990011223', 'Lucknow, Uttar Pradesh'),
(12, 'Pooja Sinha', 'pooja.sinha@example.com', '9823456781', 'Patna, Bihar'),
(13, 'Manish Dutta', 'manish.dutta@example.com', '9811122233', 'Kolkata, West Bengal'),
(14, 'Divya Agarwal', 'divya.agarwal@example.com', '9123345566', 'Nagpur, Maharashtra'),
(15, 'Rahul Yadav', 'rahul.yadav@example.com', '9877766554', 'Gwalior, Madhya Pradesh'),
(16, 'Kavita Bansal', 'kavita.bansal@example.com', '9786564433', 'Amritsar, Punjab'),
(17, 'Nikhil Rane', 'nikhil.rane@example.com', '9087765432', 'Goa'),
(18, 'Meena Jain', 'meena.jain@example.com', '9877070707', 'Bhopal, Madhya Pradesh'),
(19, 'Tushar Gupta', 'tushar.gupta@example.com', '9999988888', 'Noida, Uttar Pradesh'),
(20, 'Ritika Saxena', 'ritika.saxena@example.com', '9765432109', 'Gurgaon, Haryana'),
(21, 'Harshad Deshmukh', 'harshad.d@example.com', '9876000011', 'Nashik, Maharashtra'),
(22, 'Lavanya Krishnan', 'lavanya.k@example.com', '9000001122', 'Coimbatore, Tamil Nadu'),
(23, 'Yusuf Shaikh', 'yusuf.shaikh@example.com', '9898989898', 'Surat, Gujarat'),
(24, 'Radhika Iyer', 'radhika.iyer@example.com', '9822221111', 'Thiruvananthapuram, Kerala'),
(25, 'Ajay Dubey', 'ajay.dubey@example.com', '9844443322', 'Kanpur, Uttar Pradesh'),
(26, 'Mansi Thakur', 'mansi.thakur@example.com', '9812233445', 'Shimla, Himachal Pradesh'),
(27, 'Zoya Qureshi', 'zoya.qureshi@example.com', '9977886655', 'Srinagar, Jammu and Kashmir'),
(28, 'Deepak Joshi', 'deepak.joshi@example.com', '9090909090', 'Udaipur, Rajasthan'),
(29, 'Bhavna Rathore', 'bhavna.r@example.com', '9567890123', 'Indore, Madhya Pradesh'),
(30, 'Ramesh Pillai', 'ramesh.pillai@example.com', '9443322110', 'Madurai, Tamil Nadu');

select *  from Customers;

CREATE TABLE Cards (
    card_id INT PRIMARY KEY,
    customer_id INT,
    card_number VARCHAR(20),  -- Adjust size as needed for masked card numbers (e.g., 'XXXX-XXXX-XXXX-1234')
    card_type VARCHAR(50),    -- E.g., 'Credit', 'Debit'
    status VARCHAR(20),       -- E.g., 'Active', 'Blocked', 'Expired'
    issued_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


INSERT INTO Cards (card_id, customer_id, card_number, card_type, status, issued_date)
VALUES
(1, 1, '4321-5678-9012-1023', 'Credit', 'Active', '2022-01-10'),
(2, 2, '5210-3345-7885-8541', 'Debit', 'Blocked', '2021-03-15'),
(3, 3, '4532-9988-1245-2378', 'Credit', 'Active', '2023-07-01'),
(4, 4, '6011-2345-8765-4892', 'Debit', 'Expired', '2019-08-19'),
(5, 5, '4111-1111-1111-1947', 'Credit', 'Active', '2022-12-12'),
(6, 6, '5105-1051-0510-8321', 'Debit', 'Blocked', '2021-04-22'),
(7, 7, '4000-1234-5678-7230', 'Credit', 'Active', '2023-02-17'),
(8, 8, '6011-0009-9013-9845', 'Debit', 'Expired', '2020-10-05'),
(9, 9, '4556-7375-8689-5472', 'Credit', 'Active', '2022-11-11'),
(10, 10, '5187-2727-2727-6584', 'Debit', 'Blocked', '2021-09-29'),
(11, 11, '4119-2828-3838-3021', 'Credit', 'Active', '2023-05-07'),
(12, 12, '5500-0055-5500-7614', 'Debit', 'Expired', '2020-06-16'),
(13, 13, '4539-1234-5678-4387', 'Credit', 'Blocked', '2022-03-23'),
(14, 14, '6011-4321-9876-6248', 'Debit', 'Active', '2021-12-01'),
(15, 15, '4000-0000-0000-9183', 'Credit', 'Active', '2023-01-30'),
(16, 16, '5300-0012-3456-1154', 'Debit', 'Blocked', '2020-02-14'),
(17, 17, '4112-3412-3412-3492', 'Credit', 'Active', '2022-04-04'),
(18, 18, '6011-7777-7777-7720', 'Debit', 'Expired', '2019-12-25'),
(19, 19, '4222-2222-2222-8841', 'Credit', 'Blocked', '2021-07-07'),
(20, 20, '5018-0000-0000-9357', 'Debit', 'Active', '2023-03-03'),
(21, 21, '4532-6543-2109-6012', 'Credit', 'Active', '2023-06-12'),
(22, 22, '6304-5678-9012-2784', 'Debit', 'Expired', '2020-11-30'),
(23, 23, '4115-6789-0123-3971', 'Credit', 'Blocked', '2021-08-21'),
(24, 24, '5502-1234-5678-4423', 'Debit', 'Active', '2023-04-15'),
(25, 25, '4567-8912-3456-5089', 'Credit', 'Active', '2022-05-18'),
(26, 26, '6011-5566-7788-6901', 'Debit', 'Blocked', '2020-01-05'),
(27, 27, '4111-8765-4321-7342', 'Credit', 'Expired', '2019-11-11'),
(28, 28, '5100-6789-1234-8596', 'Debit', 'Active', '2021-06-06'),
(29, 29, '4005-5555-5555-9267', 'Credit', 'Blocked', '2022-08-30'),
(30, 30, '5500-0001-2345-1573', 'Debit', 'Active', '2023-09-09');

select *  from Cards;

CREATE TABLE Merchants (
    merchant_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    location VARCHAR(100)
);

INSERT INTO Merchants (merchant_id, name, category, location) VALUES
(1, 'Shree Electronics', 'Electronics', 'Mumbai, Maharashtra'),
(2, 'Fashion Hub', 'Apparel', 'Delhi, Delhi'),
(3, 'Royal Foods', 'Groceries', 'Bangalore, Karnataka'),
(4, 'Tech Solutions', 'Technology', 'Hyderabad, Telangana'),
(5, 'Spice Corner', 'Restaurant', 'Chennai, Tamil Nadu'),
(6, 'The Bookworm', 'Books', 'Kolkata, West Bengal'),
(7, 'Gourmet Delights', 'Restaurant', 'Pune, Maharashtra'),
(8, 'Mobile World', 'Electronics', 'Ahmedabad, Gujarat'),
(9, 'Classic Cars', 'Automobiles', 'Chandigarh, Chandigarh'),
(10, 'Home Comforts', 'Furniture', 'Jaipur, Rajasthan'),
(11, 'Green Grocer', 'Groceries', 'Lucknow, Uttar Pradesh'),
(12, 'Jewels & Gems', 'Jewelry', 'Surat, Gujarat'),
(13, 'City Cafe', 'Cafe', 'Bengaluru, Karnataka'),
(14, 'Fitness Zone', 'Sports & Fitness', 'New Delhi, Delhi'),
(15, 'Super Mart', 'Groceries', 'Indore, Madhya Pradesh'),
(16, 'Elegant Apparel', 'Apparel', 'Chandigarh, Chandigarh'),
(17, 'Gadget World', 'Electronics', 'Mumbai, Maharashtra'),
(18, 'Tea Time', 'Cafe', 'Kochi, Kerala'),
(19, 'Cineplex', 'Entertainment', 'Goa, Goa'),
(20, 'Artistry', 'Art & Crafts', 'Delhi, Delhi'),
(21, 'Luxe Collection', 'Fashion', 'Hyderabad, Telangana'),
(22, 'Himalayan Outdoors', 'Sports & Fitness', 'Shimla, Himachal Pradesh'),
(23, 'Bengal Beauty', 'Beauty Products', 'Kolkata, West Bengal'),
(24, 'TechGear', 'Electronics', 'Bhubaneswar, Odisha'),
(25, 'Ayurveda Store', 'Health & Wellness', 'Ahmedabad, Gujarat'),
(26, 'Modern Home', 'Furniture', 'Pune, Maharashtra'),
(27, 'Sunshine Florists', 'Flowers', 'Chennai, Tamil Nadu'),
(28, 'The Fitness Club', 'Sports & Fitness', 'Mumbai, Maharashtra'),
(29, 'Cultural Crafts', 'Art & Crafts', 'Bhopal, Madhya Pradesh'),
(30, 'The Furniture Store', 'Furniture', 'Gurgaon, Haryana');

select *  from Merchants;

# 

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,       -- Primary key for the transaction
    card_id INT,                          -- Foreign key for the card
    merchant_id INT,                      -- Foreign key for the merchant
    transaction_date DATETIME,            -- Date and time of the transaction
    amount DECIMAL(10, 2),                 -- Amount of the transaction (precision and scale can be adjusted)
    currency VARCHAR(3),                  -- Currency code (e.g., USD, EUR)
    status VARCHAR(20),                   -- Status of the transaction (e.g., Completed, Pending)
    location VARCHAR(255),                -- Location where the transaction occurred
    FOREIGN KEY (card_id) REFERENCES Cards(card_id),   -- Assuming there is a Cards table
    FOREIGN KEY (merchant_id) REFERENCES Merchants(merchant_id) -- Assuming there is a Merchants table
);

INSERT INTO Transactions (transaction_id, card_id, merchant_id, transaction_date, amount, currency, status, location)
VALUES
(1, 1, 1, '2025-05-15 10:00:00', 1000.50, 'INR', 'Completed', 'Mumbai'),
(2, 2, 2, '2025-05-15 11:00:00', 1500.75, 'INR', 'Pending', 'Delhi'),
(3, 3, 3, '2025-05-15 12:30:00', 200.25, 'INR', 'Completed', 'Bengaluru'),
(4, 4, 4, '2025-05-15 13:45:00', 800.40, 'INR', 'Completed', 'Kolkata'),
(5, 5, 5, '2025-05-15 14:15:00', 500.60, 'INR', 'Pending', 'Chennai'),
(6, 6, 6, '2025-05-15 15:00:00', 1200.85, 'INR', 'Completed', 'Hyderabad'),
(7, 7, 7, '2025-05-15 15:30:00', 300.90, 'INR', 'Completed', 'Pune'),
(8, 8, 8, '2025-05-15 16:00:00', 2500.00, 'INR', 'Completed', 'Ahmedabad'),
(9, 9, 9, '2025-05-15 16:45:00', 900.35, 'INR', 'Completed', 'Jaipur'),
(10,10, 10, '2025-05-15 17:10:00', 1500.25, 'INR', 'Pending', 'Lucknow'),
(11, 11, 11, '2025-05-15 17:30:00', 1300.50, 'INR', 'Completed', 'Kochi'),
(12, 12, 12, '2025-05-15 18:00:00', 550.75, 'INR', 'Pending', 'Chandigarh'),
(13, 13, 13, '2025-05-15 18:30:00', 950.80, 'INR', 'Completed', 'Bhopal'),
(14, 14, 14, '2025-05-15 19:00:00', 700.95, 'INR', 'Completed', 'Indore'),
(15, 15, 15, '2025-05-15 19:30:00', 1100.60, 'INR', 'Pending', 'Surat'),
(16, 16, 16, '2025-05-15 20:00:00', 750.40, 'INR', 'Completed', 'Visakhapatnam'),
(17, 17, 17, '2025-05-15 20:30:00', 650.25, 'INR', 'Completed', 'Nagpur'),
(18, 18, 18, '2025-05-15 21:00:00', 1900.10, 'INR', 'Pending', 'Vadodara'),
(19, 19, 19, '2025-05-15 21:30:00', 1100.30, 'INR', 'Completed', 'Madurai'),
(20, 20, 20, '2025-05-15 22:00:00', 400.50, 'INR', 'Completed', 'Pune'),
(21, 21, 21, '2025-05-15 22:30:00', 300.00, 'INR', 'Pending', 'Chennai'),
(22, 22, 22, '2025-05-15 23:00:00', 1200.75, 'INR', 'Completed', 'Gurgaon'),
(23, 23, 23, '2025-05-15 23:30:00', 1000.00, 'INR', 'Completed', 'Noida'),
(24, 24, 24, '2025-05-16 00:00:00', 1500.50, 'INR', 'Pending', 'Faridabad'),
(25, 25, 25, '2025-05-16 00:30:00', 850.90, 'INR', 'Completed', 'Navi Mumbai'),
(26, 26, 26, '2025-05-16 01:00:00', 450.20, 'INR', 'Completed', 'Patna'),
(27, 27, 27, '2025-05-16 01:30:00', 700.00, 'INR', 'Completed', 'Kolkata'),
(28, 28, 28, '2025-05-16 02:00:00', 1300.00, 'INR', 'Pending', 'Delhi'),
(29, 29, 29, '2025-05-16 02:30:00', 900.40, 'INR', 'Completed', 'Kanpur'),
(30, 30, 30, '2025-05-16 03:00:00', 1600.90, 'INR', 'Completed', 'Ranchi');

select *  from Transactions;

#List all customers with their card details

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

select c1.name as name,c2.card_number as cardnumber_,
c2.card_type as cardtype_,
c2.status as status_
from Customers c1
join Cards c2
on c1.customer_id = c2.customer_id

# Find customers who have more than one card

SELECT customer_id
FROM Cards
GROUP BY customer_id
HAVING COUNT(*) > 1;

# Find customers who have never made a transaction

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

select c.customer_id from Customers c
join Cards c1 on c.customer_id = c1.customer_id
join Transactions t on t.card_id = c1.card_id
where t.transaction_id is null;

# Get list of active cards issued in the last 6 months

SELECT status,issued_date
FROM Cards
WHERE status = 'Active'
  AND issued_date >= CURDATE() - INTERVAL 6 MONTH;

# Count of cards per card type

select card_type,count(*) as numberofcard
from Cards
group by card_type;

# Top 10 highest value transactions

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

SELECT *
FROM Transactions
ORDER BY amount DESC
LIMIT 10;

# Daily transaction volume and total amount

SELECT transaction_date, COUNT(*) AS transaction_count, SUM(amount) AS total_amount
FROM Transactions
GROUP BY transaction_date
ORDER BY transaction_date;

# Transactions by currency

SELECT currency, COUNT(*) AS transaction_count, SUM(amount) AS total_amount
FROM Transactions
GROUP BY currency;

# Failed transactions (status = 'pending')

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

SELECT *
FROM Transactions
WHERE status = 'Pending';

# Monthly transaction trend


SELECT month(transaction_date) AS month, COUNT(*) AS total_transactions, SUM(amount) AS total_amount
FROM Transactions
GROUP BY month
ORDER BY month;

# Top 5 merchants by transaction amount

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

select  * from Transactions
order by amount desc
limit 5;

# 2nd way

SELECT m.name , SUM(t.amount) AS total_sales
FROM Merchants m
JOIN Transactions t ON m.merchant_id = t.merchant_id
GROUP BY m.name
ORDER BY total_sales DESC
LIMIT 5;

# 3rd way

select merchants_products,amount
from
(select merchants_products,amount,row_number()
over(order by amount desc) as rnkop
from
(SELECT m.name as merchants_products,t.amount
FROM Merchants m
JOIN Transactions t ON m.merchant_id = t.merchant_id) as amount_table) as top_five
where rnkop < 6;

# Most frequently used merchant per card

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

select marchants,card_type,count(*) as numberofcard
from
(select m.name as marchants,c.card_type 
from Merchants m
join Transactions t
on m.merchant_id = t.merchant_id
join cards c on c.card_id = t.card_id) as card_type1
GROUP BY marchants, card_type;

# Merchant categories with highest transaction count

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

SELECT m.category, COUNT(*) AS transaction_count
FROM Merchants m
JOIN Transactions t ON m.merchant_id = t.merchant_id
GROUP BY m.category
ORDER BY transaction_count DESC;

select category,count(*) as numberofcategory
from
(SELECT m.category
FROM Merchants m
JOIN Transactions t ON m.merchant_id = t.merchant_id) as marchant_category
group by category
order by numberofcategory desc

# Total transactions per merchant location

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

SELECT M.location AS merchant_location,COUNT(*) AS total_transactions
FROM Transactions T
JOIN Merchants M ON T.merchant_id = M.merchant_id
GROUP BY  M.location
ORDER BY total_transactions DESC;

# Inactive merchants (no transactions)

SELECT m.*
FROM Merchants m
LEFT JOIN Transactions t ON m.merchant_id = t.merchant_id
WHERE t.transaction_id IS NULL;

# Top customers by total transaction amount

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

select name,sum(amount) as total_amount
from 
(select c.name as name,t.amount as amount
from Customers c 
join Cards c1
on c.customer_id = c1.customer_id
join Transactions t on t.card_id = c1.card_id) as customer_
group by name
order by total_amount desc
limit 1;

# Cards used in more than 3 different merchant locations

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

SELECT t.card_id, m.location,COUNT(*) AS unique_locations
FROM Transactions t
JOIN  Merchants m ON t.merchant_id = m.merchant_id
GROUP BY t.card_id,m.location
HAVING COUNT(DISTINCT m.location) > 3;


# Detect duplicate transactions (same card, amount, date)


select card_id,count(*) as nummberoftransaction
from Transactions
group by card_id 
having count(*) > 1;

# Average transaction amount per card type

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

select card_type,avg(amount) as avg_amount
from
(select c.card_type,t.amount 
from Cards c
join Transactions t
on c.card_id = t.card_id) as avg_transaction_amount
group by card_type;

#2nd way

select c.card_type,avg(t.amount ) as avg_amount
from Cards c
join Transactions t
on c.card_id = t.card_id
group by c.card_type


# Transaction count trend by card status

SELECT cd.status,DATE_FORMAT(t.transaction_date, '%Y-%m') AS month,COUNT(*) AS count
FROM Cards cd
JOIN Transactions t ON cd.card_id = t.card_id
GROUP BY cd.status, month
ORDER BY month;

# Check for cards with no associated customer (data issue)

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

SELECT *
FROM Cards
WHERE customer_id NOT IN (SELECT customer_id FROM Customers);

# 2nd way

SELECT c.*
FROM Cards c
LEFT JOIN Customers cu ON c.customer_id = cu.customer_id
WHERE cu.customer_id IS NULL;

# Transaction counts by card and merchant

SELECT card_id, merchant_id, COUNT(*) AS tx_count
FROM Transactions
GROUP BY card_id, merchant_id;


# Cards that have expired or are inactive

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

SELECT *
FROM Cards
WHERE status = 'Blocked'

# Customer with most pending transactions
select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

select customer_id,name,status
from
(SELECT c.customer_id, c.name,t.status as status
FROM Customers c
JOIN Cards cd ON c.customer_id = cd.customer_id
join Transactions t on cd.card_id = t.card_id) as cust_table
where status = "pending"
group by customer_id,name;

#  Merchant with most unique customers

select *  from Customers;
select *  from Cards;
select *  from Merchants;
select *  from Transactions;

SELECT t.merchant_id, COUNT(DISTINCT cd.customer_id) AS unique_customers
FROM Transactions t
JOIN Cards cd ON t.card_id = cd.card_id
GROUP BY t.merchant_id
ORDER BY unique_customers DESC;








