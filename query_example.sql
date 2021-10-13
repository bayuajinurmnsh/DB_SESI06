id_siswa INT IDENTITY(1,1) PRIMARY KEY,
nama VARCHAR(50),
alamat VARCHAR(100),
tanggal_lahir DATE,
jenis_kelamin char(1)
);

ALTER table tbl_siswa alter column jenis_kelamin varchar(10)

INSERT INTO tbl_siswa (nama,alamat,tanggal_lahir,jenis_kelamin)VALUES('BEJO','SURABAYA','2010-10-06','PRIA');INSERT INTO tbl_siswa (nama,alamat,tanggal_lahir,jenis_kelamin)VALUES('ANI','MALANG','2010-10-06','WANITA');

select ts.id_siswa, ts.nama from tbl_siswa ts;

select * from tbl_siswa ts ;

UPDATE tbl_siswa set nama ='sujiwo bejo' WHERE id_siswa =4;

SELECT * from tbl_siswa WHERE tanggal_lahir BETWEEN '2010-10-06' and '2010-10-14'

select * FROM tbl_siswa WHERE nama LIKE 'su%'

DELETE FROM tbl_siswa WHERE id_siswa =5;

