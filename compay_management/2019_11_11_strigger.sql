USE CompanySupplyProduct
GO

-- thực hiện tự động thay đổi dữ liệu du lieu
-- k thể chạy thủ công
--k thể đc tạo trên các bảng tạo hay bảng hệ thống.
-- có thể áp dụng vào view
-- dữ liệu ms đc in ssert sẽ nằm trong bản inserted, dữ liệu ms đc xóa ra khỏi bảng: deleted
--> chỉ có giá trị trong trigger, trigger end 2 bảng biến mất
-- lệnh định nghĩa hệ thống -> k định nghĩa trigger

IF EXISTS(SELECT name FROM sysobjects
WHERE NAME = 'Addcompany' AND type = 'TR')
DROP TRIGGER Addcompany
GO

CREATE TRIGGER Addcompany
ON dbo.Company
FOR INSERT
AS 
PRINT 'The company table has just been insert data.'
go

INSERT INTO dbo.Company
        ( Name ,
          NumberofEmployee ,
          Address ,
          Telephone ,
          EstablishmentDay
        )
VALUES  ( 'haahahah' , -- Name - varchar(40)
          321 , -- NumberofEmployee - int
          'hanoi' , -- Address - varchar(50)
          '254687' , -- Telephone - char(15)
          GETDATE()  -- EstablishmentDay - date
        ) 

CREATE TABLE deletedcompany(
	companyID INT NOT null,
	name VARCHAR(40),
	numberofemployee INT,
	address VARCHAR(50),
	telephone CHAR (15),
	establishmentDay DATE,
	PRIMARY KEY(companyID)
)
GO

CREATE TRIGGER tg_deletecompany
ON dbo.Company
FOR DELETE
AS
INSERT INTO deletedcompany SELECT * FROM Deleted

DELETE FROM dbo.Company
WHERE CompanyID = 18

SELECT * FROM dbo.deletedcompany
GO 

-- creat and update trigger
CREATE TRIGGER tg_Checkprice
ON product
FOR UPDATE 
AS
DECLARE @old_price DECIMAL(10,2) , @new_price DECIMAL(10,2)
SELECT @old_price = Price FROM Deleted
PRINT 'Old price ='
PRINT CONVERT(VARCHAR(6),@old_price)
SELECT @new_price = Price FROM inserted
PRINT 'New price ='
PRINT CONVERT(VARCHAR(6), @new_price)
IF (@new_price > (@old_price*1.10))
BEGIN
	PRINT 'New price increated over 10%, not updated'
	ROLLBACK -- quay lại trjang thái trc update
END
ELSE
PRINT 'New price is accepted!'

UPDATE dbo.Product SET Price = 400
WHERE ProductID = 5
go
SELECT * FROM dbo.Product

