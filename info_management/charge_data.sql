use SQLQuerry2
go 

--alter table hocsinh add nam bit
--alter table hocsinh add diachi nvarchar(10)
--alter table hocsinh add diemTK float

-- chèn dư liệu vào bảng
--  kieu so -> số bình thường
-- kiểu lí tự or ngày cần có N''
-- nếu là unicode cần có N'' phía trước
INSERT dbo.hocsinh
        ( maHS ,
          tenHS ,
          ngaysinh ,
          lop ,
          nam ,
          diachi ,
          diemTK
        )
VALUES  ( N'214' , -- maHS - nvarchar(10)
          N'Nam' , -- tenHS - nvarchar(100)
          '19990426' , -- ngaysinh - date
          N'12A10' , -- lop - nvarchar(10)
          1 , -- nam - bit
          N'Hai Boi' , -- diachi - nvarchar(10)
          7.8  -- diemTK - float
        )

-- updated 1 cột
UPDATE dbo.hocsinh SET diemTK = 9

-- update có điều kiện
UPDATE dbo.hocsinh SET lop = '12A1' WHERE maHS < 264 OR nam = 0
-- update ... set... where ... and

-- xóa toàn bộ
DELETE dbo.hocsinh

-- xóa coa điều kiện
DELETE dbo.hocsinh WHERE tenHS = 'Nam'