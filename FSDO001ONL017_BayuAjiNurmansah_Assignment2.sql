CREATE database db_assignment2

--1
CREATE TABLE tbl_customers(
	customerNumber INT IDENTITY(1,1) PRIMARY KEY,
	customerName VARCHAR(50) NOT NULL,
	contactLastName VARCHAR(30) NOT NULL,
	contactFirstName VARCHAR(30) NOT NULL,
	phone CHAR(12) NOT NULL,
	addressLine1 TEXT NOT NULL,
	addressLine2 TEXT ,
	city VARCHAR(30) NOT NULL,
	state VARCHAR(30) NOT NULL,
	postalCode VARCHAR(20) NOT NULL,
	country VARCHAR(20) NOT NULL,
	salesRepEmployeeNumber INT NOT NULL,
	creditLimit SMALLMONEY NOT NULL
);

INSERT INTO tbl_customers (customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
VALUES
('Bayu Aji Nurmansah', 'Nurmansah','Bayu','0812xxxxyyyy','Sei Tanjung St. Kisaran', 'SM Raja St. Kisaran', 'Kisaran' , 'Sumatera Utara', '21215','Indonesia',1, 1234.56),
('Trump Mike', 'Mike','Trump','0812xxxxyyyy','DI Panjaitan', 'Setia Budi', 'Jakarta' , 'DKI Jakarta', '191920','Indonesia',1, 2234.56),
('Putin Saber', 'Saber','Putin','0812xxxxyyyy','Gatot Subroto', 'Asia Afrika', 'Bandung' , 'Jawa Barat', '181801','Indonesia',1, 3234.56),
('Robert Sauber', 'Sauber','Robert','0812xxxxyyyy','Abdul Hakim', 'Berdikari', 'Medan' , 'Sumatera Utara', '12120198','Indonesia', 1,4234.56),
('Asep Karisep', 'Karisep','Asep','0812xxxxyyyy','Jamin Ginting', 'Pattimura', 'Denpasar' , 'Bali', '5050125','Indonesia',1, 5234.56);

--2
CREATE TABLE tbl_products(
productCode INT IDENTITY(1,1) PRIMARY KEY,
productName VARCHAR(50) NOT NULL,
productLine INT NOT NULL,
productScale FLOAT NOT NULL,
productVendor VARCHAR (30) NOT NULL,
productDescription TEXT NOT NULL,
quantityInStock INT NOT NULL,
buyPrice MONEY NOT NULL,
MSRP MONEY NOT NULL
);

INSERT INTO tbl_products (productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
VALUES
('Deterjen Kilat', 1,50.7,'PT.X','Deterjen kilat cepat', 150, 150000.500, 100.20),
('Baju Ganteng', 2,19.6,'PT.Y','Pakai baju ini auto ganteng', 52, 100000, 70.5),
('Celana Pendek', 2,23.7,'PT.Y','Celanya pendek yang gak mungkin panjang', 17, 95000.200, 90.23),
('Sepatu Mantap', 3,45.2,'PT.A','Sepatu mantap anti bau', 19, 78000, 88.90),
('Dasi Kerja', 4,90.5,'PT.Z','Dasi buat kerja buka apel', 33, 12000, 87.25);

--3
CREATE TABLE tbl_productlines(
productLine INT IDENTITY(1,1) PRIMARY KEY,
textDescription TEXT NOT NULL,
htmlDescription TEXT NOT NULL,
image VARBINARY(max) NOT NULL
);

INSERT INTO tbl_productlines (textDescription, htmlDescription, image)
VALUES
('Deterjen mantap', '3w.deterjen.c0m', 0x4F),
('Pakaian', '3w.Pakaian.c0m', 0x4F),
('Sepatu', '3w.Sepatu.c0m', 0x4F),
('Dasi', '3w.Dasi.c0m', 0x4F),
('Sepeda', '3w.Sepeda.c0m', 0x4F);

--4
CREATE TABLE tbl_orders(
orderNumber INT IDENTITY(1,1) PRIMARY KEY,
orderDate DATETIME NOT NULL,
requiredDate DATE NOT NULL,
shippedDate DATETIME NOT NULL,
[status] NVARCHAR (10) NOT NULL CHECK ([status] IN ('send','not send')) DEFAULT 'not send',
comments TEXT,
customerNumber INT NOT NULL
);

INSERT INTO tbl_orders (orderDate, requiredDate, shippedDate, status, comments, customerNumber)
VALUES
('2021-09-16 07:35:28', '2021-09-25', '2021-09-23 15:20:19' , 'send', 'Package has been sent' , 1),
('2021-09-17 17:25:09', '2021-09-26', '2021-09-24 16:21:20', 'send', 'Package has been sent', 2),
('2021-09-18 16:20:19', '2021-09-27', '2021-09-25 17:22:21', 'send', 'Package has been sent', 3),
('2021-09-19 17:21:20', '2021-09-28', '2021-09-26 18:23:22', 'send', 'Package has been sent', 4),
('2021-09-18 18:22:21', '2021-09-29', '2021-09-27 19:24:23', 'not send', 'Package not sent', 5);

--5
CREATE TABLE tbl_orderdetails(
id_orderDetails INT IDENTITY(1,1) PRIMARY KEY,
orderNumber INT NOT NULL,
productCode INT NOT NULL,
quantityOrdered INT NOT NULL,
priceEach SMALLMONEY NOT NULL,
orderLineNumber INT NOT NULL
);

INSERT INTO tbl_orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES
(1, 2, 10, 10500, 102),
(2, 1, 30, 14500, 152),
(3, 4, 17, 20500, 12),
(4, 3, 12, 11500, 32),
(5, 5, 1, 7500, 52);

--6
CREATE TABLE tbl_payments(
checkNumber INT IDENTITY(1,1) PRIMARY KEY,
customerNumber INT NOT NULL,
paymentDate DATETIME NOT NULL,
amount MONEY NOT NULL
);

INSERT INTO tbl_payments (customerNumber, paymentDate, amount)
VALUES
(3, '2021-10-10 12:00:00', 20000),
(4, '2021-10-11 13:10:00', 10000),
(5, '2021-10-12 14:20:00', 30000),
(6, '2021-10-13 15:30:00', 40000),
(7, '2021-10-14 16:40:00', 50000);

--7
CREATE TABLE tbl_employee(
employeeNumber INT IDENTITY(1,1) PRIMARY KEY,
lastName VARCHAR(30) NOT NULL,
firstName VARCHAR(30) NOT NULL,
[extension] VARCHAR(3) NOT NULL CHECK ([extension] IN ('yes','no')) DEFAULT 'yes',
email VARCHAR(50) NOT NULL,
officeCode INT NOT NULL,
reportsTo INT NOT NULL,
jobTittle NVARCHAR(30)
);

INSERT INTO tbl_employee (lastName, firstName, extension, email, officeCode, reportsTo, jobTittle)
VALUES
('Jobs', 'Steve', 'yes', 'stevejob@email.m0c',1,5,'CTO'),
('Gates', 'Bill', 'yes', 'billgates@email.m0c',1,5,'R&D'),
('Mark', 'Zuckerberg', 'yes', 'mark@email.m0c',1,5,'Asst.CTO'),
('Musk', 'Elon', 'yes', 'elon@email.m0c',1,5,'CFO'),
('Nurmansah', 'Bayu', 'yes', 'bayu@email.m0c',1,5,'CEO');

--8
CREATE TABLE tbl_offices(
	officeCode INT IDENTITY(1,1) PRIMARY KEY,
	city VARCHAR(30) NOT NULL,
	phone CHAR(12) NOT NULL,
	addressLine1 TEXT NOT NULL,
	addressLine2 TEXT,
	state VARCHAR(30) NOT NULL,
	country NVARCHAR(20) NOT NULL,
	postalCode NVARCHAR(20) NOT NULL,
	teritory NVARCHAR(20) NOT NULL
);

INSERT INTO tbl_offices (city, phone, addressLine1, addressLine2, state, country, postalCode, teritory)
VALUES
('Medan', '0812xxxyyyy', 'x st', 'b st' ,'SUMUT' , 'Indonesia', '20' , 'istimewa'),
('Aceh', '0812xxxyyyy', 'x st', 'b st' ,'NAD' , 'Indonesia', '20' , 'istimewa'),
('Bandung', '0812xxxyyyy', 'x st', 'b st' ,'JABAR' , 'Indonesia', '20' , 'istimewa'),
('Jakarta', '0812xxxyyyy', 'x st', 'b st' ,'DKI' , 'Indonesia', '20' , 'istimewa'),
('Yogyakarta', '0812xxxyyyy', 'x st', 'b st' ,'DIY' , 'Indonesia', '20' , 'istimewa');


--1
ALTER TABLE tbl_customers ADD FOREIGN KEY (salesRepEmployeeNumber) REFERENCES tbl_employee(employeeNumber);

--2
ALTER TABLE tbl_products ADD FOREIGN KEY (productLine) REFERENCES tbl_productlines (productLine);

--3
--gak ada, dia gak ada foreign key

--4
ALTER TABLE tbl_orders ADD FOREIGN KEY (customerNumber) REFERENCES tbl_customers (customerNumber);

--5
ALTER TABLE tbl_orderdetails ADD FOREIGN KEY (orderNumber) REFERENCES tbl_orders (orderNumber);
ALTER TABLE tbl_orderdetails ADD FOREIGN KEY (productCode) REFERENCES tbl_products (productCode);

--6
ALTER TABLE tbl_payments ADD FOREIGN KEY (customerNumber) REFERENCES tbl_customers (customerNumber);

--7
ALTER TABLE tbl_employee ADD FOREIGN KEY (officeCode) REFERENCES tbl_offices (officeCode);

--8
--gak ada, dia gak ada foreign key