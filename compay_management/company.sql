USE CompanySupplyProduct
GO

--1. show the name , address of the company
SELECT Name, Address FROM dbo.Company

--2. list of identifer, name, telephone,of the companies whose address in London
SELECT CompanyID, Name,Telephone FROM dbo.Company
WHERE Address like '%London%'

--3.show the information of the companies which provide products with coloe = 'red'
SELECT * FROM dbo.Company
WHERE CompanyID IN 
(
	SELECT CompanyID FROM dbo.Supply
	WHERE ProductID IN (SELECT ProductID FROM dbo.Product
						WHERE Color = 'blue'
						)
)

--4.show the identifier of the companies which sell products with color = 'blue'
SELECT dbo.Company.CompanyID FROM dbo.Company,dbo.Supply,dbo.Product
WHERE Company.CompanyID = Supply.CompanyID
AND Supply.ProductID = Product.ProductID
AND Color = 'blue'
GROUP BY Company.CompanyID

--5. information of the companyies which have never sold any product before
SELECT * FROM dbo.Company
WHERE CompanyID NOT IN
(
	SELECT CompanyID FROM dbo.Supply
)


SELECT * FROM  dbo.Company
SELECT * FROM dbo.Product, dbo.Supply
WHERE Product.ProductID = Supply.ProductID
-- đưa ra mã số của hãng cung cấp 1 sp màu đỏ và 1 sp màu xanh
SELECT CompanyID FROM dbo.Company
WHERE CompanyID IN (
	SELECT CompanyID FROM dbo.Supply, dbo.Product
	WHERE Supply.ProductID = Product.ProductID
	AND color = 'Red')
AND CompanyID IN (SELECT CompanyID FROM dbo.Supply, dbo.Product
	WHERE Supply.ProductID = Product.ProductID
	AND color = 'Black')

-- đưa ra công ty cung ứng ít nhất 1 mặt hàng màu đỏ hoặc màu đen
SELECT CompanyID FROM dbo.Company
WHERE CompanyID IN (
	SELECT CompanyID FROM dbo.Supply, dbo.Product
	WHERE Supply.ProductID = Product.ProductID
	AND color = 'Red')
OR CompanyID IN (SELECT CompanyID FROM dbo.Supply, dbo.Product
	WHERE Supply.ProductID = Product.ProductID
	AND color = 'Black')

-- đưa ra mã số của công ty cung ứng tất cả các mặt hàng màu đỏ
