SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET default_tablespace = '';

SET default_with_oids = false;

DROP TABLE IF EXISTS order_detail;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
	CustomerID smallint PRIMARY KEY,
	CompanyName varchar(40) NOT NULL,
	ContactName varchar(20) NOT NULL,
	ContactTitle varchar(20),
	Address varchar(60),
	City varchar(15),
	Region varchar(15),
	PostalCode varchar(10),
	Country varchar(15),
	Phone varchar(25),
	Fax varchar(25)
);

CREATE TABLE orders (
	OrderID integer PRIMARY KEY,
	CustomerID integer references customer(CustomerID),
	EmployeeID integer NOT NULL,
	OrderDate date,
	RequiredDate date,
	ShippedDate date,
	ShipVia integer,
	Freight money,
	ShipName varchar(40),
	ShipAddress varchar(60),
	ShipCity varchar(15),
	ShipRegion varchar(15),
	ShipPostalCode varchar(10),
	ShipCountry varchar(15)
);

CREATE TABLE product (
	ProductID integer PRIMARY KEY,
	ProductName varchar(30),
	SupplierID integer,
	CategoryID integer,
	QuantityPerUnit varchar(20),
	UnitPrice money,
	UnitsInStock integer,
	UnitsOnOrder integer,
	ReorderLevel integer,
	Discontinued integer
);

CREATE TABLE order_detail (
	OrderID integer references orders(OrderID),
	ProductID integer references product(ProductID),
	UnitPrice money,
	Quantity integer,
	Discount real
);

INSERT INTO customer VALUES(1, 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '030-0076545');
INSERT INTO customer VALUES(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO customer VALUES(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL);

INSERT INTO product VALUES (1, 'Chai', 8, 1, '10 boxes x 30 bags', 18, 39, 0, 10, 1);
INSERT INTO product VALUES (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 1);
INSERT INTO product VALUES (4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, 0);
INSERT INTO product VALUES (6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, 0);

INSERT INTO orders VALUES (10759, 2, 3, '1997-11-28', '1997-12-26', '1997-12-12', 3, 11.9899998, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES (10952, 3, 1, '1998-03-16', '1998-04-27', '1998-03-24', 1, 40.4199982, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (10856, 1, 3, '1998-01-28', '1998-02-25', '1998-02-10', 2, 58.4300003, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico');

INSERT INTO order_detail VALUES (10759, 1, 32, 10, 0);
INSERT INTO order_detail VALUES (10952, 6, 25, 16, 0.0500000007);
INSERT INTO order_detail VALUES (10952, 2, 45.5999985, 2, 0);
INSERT INTO order_detail VALUES (10856, 4, 14, 20, 0);
