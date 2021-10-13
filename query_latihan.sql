--A
CREATE Database db_staff

--B
CREATE table tbl_data_staff(
nik int identity(1,1) primary key,
nama varchar(50),
alamat varchar(200),
handphone varchar(15)
);

--C
INSERT into tbl_data_staff (nik,nama,alamat,handphone) VALUES ('1509','Bayu Aji Nurmansah','Medan','08xxxxx');

--D
INSERT into tbl_data_staff (nik,nama,alamat,handphone) VALUES ('1510','Obama','Jakarta','08xxxxx'), ('1511','Putin','Lampung','08xxxxx'), ('1512','Robert','Aceh','08xxxxx');

--E
ALTER TABLE tbl_data_staff 
ADD joindate date NULL;

INSERT into tbl_data_staff (nama,alamat,handphone,joindate)
Values ('data baru','baru','08xx','2021-10-13');

--F
SELECT TOP 2 * from tbl_data_staff;

--G
SELECT TOP 3 * from tbl_data_staff;

--H
CREATE table staffoutsource(
nik int identity(1,1) primary key,
nama varchar(50),
alamat varchar(200),
handphone varchar(15),
joindate date
);

--I
INSERT into staffoutsource (nama,alamat,handphone,joindate) VALUES 
('A','Jakarta','08xxxxx','2021-10-13'),
('B','Jakarta','08xxxxx','2021-10-14'),
('C','Jakarta','08xxxxx','2021-10-15'),
('D','Jakarta','08xxxxx','2021-10-16'),
('E','Jakarta','08xxxxx','2021-10-17'),
('F','Jakarta','08xxxxx','2021-10-13'),
('G','Jakarta','08xxxxx','2021-10-18'),
('H','Jakarta','08xxxxx','2021-10-19'),
('I','Jakarta','08xxxxx','2021-10-20'),
('J','Jakarta','08xxxxx','2021-10-21');

--J
SELECT a.nik ,a.nama ,a.alamat ,a.handphone ,a.joindate 
FROM tbl_data_staff a JOIN staffoutsource b
ON a.joindate = b.joindate;

--K
SELECT tds.* , s.*
FROM tbl_data_staff as tds 
RIGHT JOIN staffoutsource as s
on s.nik = tds.nik;

--L
SELECT tds.*, s.*
FROM tbl_data_staff as tds 
LEFT JOIN staffoutsource as s
on tds.nik = s.nik;

--M
SELECT * FROM tbl_data_staff tds 
UNION ALL
SELECT * FROM staffoutsource s;