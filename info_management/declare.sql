USE HowKteam
GO

-- xuất ra số lượng giáo viên của từng giáo viên
DECLARE @maGV NCHAR(3) --= N'001'
SELECT @maGV = MAGV FROM dbo.GIAOVIEN WHERE MAGV IN (SELECT MAGV FROM dbo.NGUOITHAN) AND MAGV = N'001'
SELECT * FROM dbo.NGUOITHAN
WHERE MAGV = @maGV

DECLARE @maGV1 NCHAR(3) = N'001'
SELECT * FROM dbo.NGUOITHAN WHERE MAGV = @maGV1

SELECT GIAOVIEN.MAGV,HOTEN ,COUNT(*) FROM dbo.GIAOVIEN, dbo.NGUOITHAN
where GIAOVIEN.MAGV = NGUOITHAN.MAGV
GROUP BY GIAOVIEN.MAGV,HOTEN

--xuất ra tên giáo viên có lương thấp nhất
DECLARE @luongMin FLOAT
SELECT @luongMin = MIN(LUONG) FROM dbo.GIAOVIEN
--SELECT * FROM dbo.GIAOVIEN WHERE LUONG = @luongMin
PRINT @luongMin

SELECT * FROM dbo.GIAOVIEN
WHERE LUONG = (SELECT MIN(LUONG) FROM dbo.GIAOVIEN)

-- lấy ra tuổi của giáo viên mã 001
DECLARE @MaGV_age NCHAR(3) = N'001'
SELECT YEAR(GETDATE())- YEAR(NGSINH) FROM dbo.GIAOVIEN WHERE  MAGV = @MaGV_age

-- set dữ liệu cho biến
DECLARE @i INT -- khởi tạo kiểu dữ liệu
DECLARE @j INT = 0 -- khởi tạo giá trị mặc định

SET @i =@i+1
SET @i += 1
SET @j += @i
