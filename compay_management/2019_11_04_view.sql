USE CompanySupplyProduct
GO

CREATE VIEW vCompany AS
SELECT Name,Address, Telephone FROM dbo.Company
go

CREATE VIEW vCompany2 AS
SELECT Name,Address, Telephone FROM dbo.Company
WHERE Address LIKE '%japan%'
GO

CREATE VIEW vComSupPro1(ComName, ProName, Qty) AS
SELECT Company.Name, Product.Name, Quantity
FROM (dbo.Company INNER JOIN dbo.Supply ON Supply.CompanyID = Company.CompanyID) 
INNER JOIN dbo.Product ON Product.ProductID = Supply.ProductID
GO

DROP VIEW dbo.vCompany;
GO

-- nguồn dữ liệu thay đổi view bị thay đổi
-- thay đổi dữ liệu view thì bảng gốc có bị thay đổi
-- view cắt thông tin dữ liệu từ nhiều bảng.
UPDATE dbo.vCompany SET Name = N'Minmap'
WHERE Address LIKE '%seoul%'
SELECT * FROM dbo.vCompany
SELECT* FROM dbo.Company