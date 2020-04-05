use SQLQuerry2
go

DROP 

Create table hocsinh
(
	maHS nvarchar(10),
	tenHS nvarchar(100),
	ngaysinh date
)
go

--them vao 1 cot
alter table hocsinh add lop nvarchar(10)

--xoa du lieu bang
truncate table hocsinh

-- xoa toan bo bang
drop hocsinh
go

CREATE DATABASE name
GO
DROP DATABASE name
