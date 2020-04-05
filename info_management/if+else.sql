USE HowKteam
GO

--SELECT * INTO GV_Copy FROM dbo.GIAOVIEN

-- kiểm tra lương nhập vào có lớn hơn lương trung bình không
/*DECLARE @luongTB FLOAT
SELECT @luongTB = AVG(Luong) FROM dbo.GIAOVIEN
PRINT @luongTB

DECLARE @Luong_moinhap FLOAT = 1000
IF (@Luong_moinhap > @luongTB)
	PRINT N'Lớn Hơn'
ELSE PRINT N'Nhỏ hơn'*/

-- Nhập vào 1 lương nếu con số lớn hơn lương trung bình hiện tại
-- cập nhật luong của tất cả các giáo viên = con số đó. Nếu ngược lại chỉ update phái nữ
DECLARE @luongTB FLOAT
SELECT @luongTB = AVG(Luong) FROM dbo.GIAOVIEN
PRINT @luongTB
DECLARE @Luong_moinhap FLOAT = 900
IF ( @Luong_moinhap > @luongTB)
	BEGIN
	UPDATE dbo.GV_Copy SET LUONG = @Luong_moinhap
	SELECT * FROM dbo.GV_Copy
	END
ELSE 
BEGIN
	UPDATE dbo.GV_Copy SET LUONG = @Luong_moinhap
	where PHAI = N'Nữ'
	SELECT * FROM dbo.GV_Copy
END

--