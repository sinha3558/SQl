create database temtable;
use temtable;
show databases; 

CREATE TABLE Customers (
    CustomerID INT,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

select * from Customers;



alter table Customers
add phone_number VARCHAR(20);

alter table Customers
drop column phone_number;

alter table Customers
add address text;

alter table Customers
drop column address;


alter table Customers
add email2 varchar(20);


alter table Customers
drop column email2;

select * from Customers;


alter table  Customers
add column adress text,
add column phone varchar(25);

alter table Customers
drop column adress,
drop column phone;


alter table Customers
rename column email2 to EmailAdress;



ALTER TABLE Customers
ADD CONSTRAINT unique_email UNIQUE (email);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES 
    (1, 'John Doe', 'john.doe@example.com'),
    (2, 'Jane Smith', 'john.doe@example1.com'),
    (3, 'Alice Johnson', 'alice.johnson@example.com');

truncate table Customers;



select * from Customers;

INSERT INTO Customers (CustomerID, Name, Email)
VALUES 
    (1, 'John Doe', 'john.doe@example.com'),
    (2, 'Jane Smith', 'john.doe@example.com'),
    (3, 'Alice Johnson', 'alice.johnson@example.com');


CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    CustomerID INT  -- This is not a foreign key, just a regular column
);


ALTER TABLE Orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (CustomerID) REFERENCES Customers1(CustomerID);



CREATE TABLE bank (
    bank_id INT,
    bank_name VARCHAR(100),
    location VARCHAR(100),
    established_year INT,
    total_assets DECIMAL(18, 2)
);


drop table bank;

alter table bank
add constraint pk_id primary key (bank_id);

ALTER TABLE bank
ADD CONSTRAINT pk PRIMARY KEY (bank_id);

ALTER TABLE bank
DROP CONSTRAINT pk_id;

ALTER TABLE bank
DROP CONSTRAINT pk;


select *  from bank;

INSERT INTO bank (bank_id, bank_name, location, established_year, total_assets)
VALUES
(1, 'First National Bank', 'New York', 1920, 1500000000.00),
(1, 'Global Trust Bank', 'London', 1985, 950000000.50),
(3, 'Pacific Savings', 'San Francisco', 1975, 1200000000.75),
(4, 'Continental Finance', 'Chicago', 1990, 800000000.00),
(5, 'Eastern Credit Union', 'Delhi', 1960, 600000000.25);


truncate table  bank; 

alter table bank
add constraint uk unique (location),
add constraint pk primary key (bank_id)


alter table bank
drop constraint uk,
drop constraint pk;




CREATE TABLE Customers2 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50)
);





CREATE TABLE Orders1 (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    CustomerID INT  -- Just a reference, not a foreign key
);



#drop table Orders1;

alter table Orders1
add constraint fk foreign key (CustomerID) references Customers2(CustomerID);

select * from Customers2;
select * from Orders1;


