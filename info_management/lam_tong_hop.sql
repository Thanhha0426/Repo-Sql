CREATE DATABASE AllSQL
GO

CREATE TABLE Monhoc
(
	maBM CHAR(5) NOT NULL,
	tenBM NVARCHAR(50),
	PRIMARY KEY (maBM)
)
GO

CREATE TABLE giangvien
(
	maGV CHAR(10) NOT NULL,
	tenGV NVARCHAR(50) DEFAULT N'Văn A',
	gtinh NCHAR(5) DEFAULT N'Nam',
	dchi VARCHAR(20) DEFAULT N'Ha Noi',
	maBM CHAR(5),
	PRIMARY KEY (maGV),
	FOREIGN KEY (maBM) REFERENCES dbo.Monhoc (maBM)
)
GO
ALTER TABLE dbo.giangvien ADD Nsinh DATE

CREATE TABLE Sinhvien
(
	maSV CHAR (8) NOT NULL,
	tenSV NVARCHAR(50),
	gtinh NCHAR(5) DEFAULT N'Nam',
	dchi VARCHAR(20),
	Nsinh DATE,
	PRIMARY KEY (maSV)
)
GO

USE AllSQL
go

INSERT INTO dbo.Monhoc
        ( maBM, tenBM )
VALUES  ( 'IT211', -- maBM - char(5)
          N'Nhập môn CNTT và TT'  -- tenBM - nvarchar(50)
          )
INSERT INTO dbo.Monhoc
        ( maBM, tenBM )
VALUES  ( 'IT210', -- maBM - char(5)
          N'	Kiến thức máy tính'  -- tenBM - nvarchar(50)
          )
INSERT INTO dbo.Monhoc
        ( maBM, tenBM )
VALUES  ( 'JP111', -- maBM - char(5)
          N'Tiếng Nhật 1'  -- tenBM - nvarchar(50)
          )
INSERT INTO dbo.Monhoc
        ( maBM, tenBM )
VALUES  ( 'MI101', -- maBM - char(5)
          N'Math I'  -- tenBM - nvarchar(50)
          )
INSERT INTO dbo.Monhoc
        ( maBM, tenBM )
VALUES  ( 'MI102', -- maBM - char(5)
          N'Math II'  -- tenBM - nvarchar(50)
          )
INSERT INTO dbo.Monhoc
        ( maBM, tenBM )
VALUES  ( 'IT321', -- maBM - char(5)
          N'C Programming Language'  -- tenBM - nvarchar(50)
          )
INSERT INTO dbo.Monhoc
        ( maBM, tenBM )
VALUES  ( 'IT324', -- maBM - char(5)
          N'Lập trình C (nâng cao)'  -- tenBM - nvarchar(50)
          )
INSERT INTO dbo.Monhoc
        ( maBM, tenBM )
VALUES  ( 'IT408', -- maBM - char(5)
          N'Kỹ thuật phần mềm'  -- tenBM - nvarchar(50)
          )

--==============================================
INSERT INTO dbo.giangvien
        ( maGV, tenGV, gtinh, dchi, maBM )
VALUES  ( '002',--V - char(10)
          N'Nguyễn Văn Khang',-- tenGV - nvarchar(50)
          N'Nam',--tinh - nchar(5)
		  'Nam Định',--20
          'IT210'-- maBM - char(5)
          )
		  INSERT INTO dbo.giangvien
        ( maGV, tenGV, gtinh, dchi, maBM )
VALUES  ( '003', -- maGV - char(10)
          N'Nguyễn Thi Kim Thoa',-- tenGV - nvarchar(50)
          N'Nữ',--inh - nchar(5)
          'Nam Định',--20)
          'IT211'-- maBM - char(5)
          )
		  INSERT INTO dbo.giangvien
        ( maGV, tenGV, gtinh,  maBM )
VALUES  ( '004',-- maGV - char(10)
          N'Nguyễn Tiến Dũng',-- tenGV - nvarchar(50)
          N'Nam', -- gtinh - nchar(5)
          'JP111'  -- maBM - char(5)
          )
		  INSERT INTO dbo.giangvien
        ( maGV, tenGV, gtinh, maBM )
VALUES  ( '005', -- maGV - char(10)
          N'Phạm Nguyễn Thanh Loan',-- tenGV - nvarchar(50)
          N'Nữ', -- gtinh - nchar(5)
          'MI101'  -- maBM - char(5)
          )
		  INSERT INTO dbo.giangvien
        ( maGV, tenGV, gtinh,  maBM )
VALUES  ( '006', -- maGV - char(10)
          N'Nguyễn Thanh Bình',-- tenGV - nvarchar(50)
          N'Nam', -- gtinh - nchar(5)
          'MI102'  -- maBM - char(5)
          )
		  INSERT INTO dbo.giangvien
        ( maGV, tenGV, gtinh,  maBM )
VALUES  ( '007', -- maGV - char(10)
          N'Vương Lan Nhi',-- tenGV - nvarchar(50)
          N'Nữ', -- gtinh - nchar(5)
          'JP111'  -- maBM - char(5)
          )

--==============================
SELECT * FROM dbo.giangvien
SELECT *FROM dbo.Monhoc
SELECT GV.maGV,GV.tenGV,MH.tenBM FROM dbo.giangvien AS GV, dbo.Monhoc AS MH 
WHERE GV.maBM= MH.maBM