USE HowKteam
GO

SELECT * INTO testwhile FROM dbo.GIAOVIEN
WHERE (0>1)

SELECT * FROM testwhile 
DECLARE @i INT = 1
DECLARE @j INT
SELECT @j = COUNT(*) FROM dbo.GIAOVIEN
WHILE (@i <= @j)
BEGIN
	INSERT dbo.testwhile
	        ( MAGV ,
	          HOTEN ,
	          LUONG ,
	          PHAI ,
	          NGSINH ,
	          DIACHI ,
	          GVQLCM ,
	          MABM
	        )
	VALUES  ( @i , -- MAGV - nchar(3)
	          N'' , -- HOTEN - nvarchar(50)
	          @i + 1000 , -- LUONG - float
	          N'' , -- PHAI - nchar(3)
	          GETDATE() , -- NGSINH - date
	          N'' , -- DIACHI - nchar(50)
	          N'' , -- GVQLCM - nchar(3)
	          N''  -- MABM - nchar(4)
	        )
		SET @i += 1
end