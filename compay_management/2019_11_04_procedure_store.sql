USE CompanySupplyProduct
GO

-- kiểm tra xem có pcompany chưa
IF EXISTS (SELECT name FROM sysobjects 
WHERE NAME = 'pCompany' AND type = 'P')
DROP PROCEDURE pCompany
go

CREATE PROC pCompany 
AS SELECT Name, NumberofEmployee FROM dbo.Company
ORDER BY Name DESC
GO

-- thủ tục xem nội dung
EXEC sp_helptext pCompany

DROP PROCEDURE dbo.pCompany

-- tạo 1 nhóm các thủ tục lưu trữ
CREATE PROC group_sp;1
AS SELECT * FROM dbo.Company
GO
CREATE PROC group_sp;2
AS SELECT Name FROM dbo.Company
GO
CREATE PROC group_sp;3
AS SELECT name, address FROM dbo.Company
GO
EXEC dbo.group_sp;3
EXEC dbo.group_sp;2

-- parameters
CREATE PROCEDURE scores
@score1 smallint,
@score2 smallint,
@score3 smallint,
@score4 smallint,
@score5 smallint,
@myAvg smallint OUTPUT -- thay doi gia tri tra ve.
AS SELECT @myAvg = (@score1 +@score2 + @score3 + @score4 +@score5)/5

DECLARE @Avgscore SMALLINT
EXEC scores 10,9,8,8,10, @Avgstore OUTPUT
PRINT @Avgscore

-- truyền tham số theo thứ tự ngẫu nhiên.
DECLARE @Avgscore SMALLINT
EXEC scores
@score1 = 9, @score2 = 10, @score3 =8, @score4 = 8,@score5 =8, @myAvg = @Avgscore OUTPUT
SELECT 'The Average score is:',@Avgscore

--tra ve gia tri nhu 1 ham
CREATE PROC Myreturn
@t1 smallint , @t2 smallint, @retal smallint
AS SELECT @retal = @t1+ @t2
RETURN @retal

DECLARE @total SMALLINT
EXEC @total = Myreturn 9,9,0
SELECT 'The return value is :', @total
SET @total = 2
SELECT 'The return value is :', @total

-------------------------------------------------
IF EXISTS (SELECT name FROM sysobjects 
WHERE NAME = 'pCompany' AND type = 'P')
DROP PROCEDURE pCompany
go

CREATE PROCEDURE pCompany WITH ENCRYPTION 
AS SELECT Name, NumberofEmployee FROM dbo.Company
ORDER BY Name DESC
GO

EXEC sp_helptext pCompany