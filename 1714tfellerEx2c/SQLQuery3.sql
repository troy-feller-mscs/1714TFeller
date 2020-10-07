--2C.1	Building		State, City, count buildings		State, City	
SELECT        State, City, COUNT(BuildingId) AS [Count buildings]
FROM            Building
GROUP BY State, City

--2C.2	Building		City, count buildings		City		MN
SELECT        City, COUNT(BuildingId) AS [Count Building]
FROM            Building
GROUP BY State, City
HAVING        (State = N'MN')

--2C.3	Building, Apartment			BuildingId, BuildingName,average rent			BuildingId, BuildingName
SELECT        Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS [Average Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName

--2C.4	Building, Apartment			City, BuildingName, total rent			City, BuildingName			MN
SELECT        Building.City, Building.BuildingName, SUM(Apartment.Rent) AS [Total rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City, Building.BuildingName, Building.State
HAVING        (Building.State = N'MN')

--2C.5	Building, Apartment			Cheapest rent			City	
SELECT        Building.City, MIN(Apartment.Rent) AS [Cheapest rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City

--2C.6	Building, Apartment			BuildingName, Smallest size, avg size, largest size			BuildingName			Available in Winona
SELECT        Building.BuildingName, MIN(Apartment.SquareFeet) AS [Smallest Size], AVG(Apartment.SquareFeet) AS [Avg Size], MAX(Apartment.SquareFeet) AS Largest
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingName, Building.City, Apartment.TenantId
HAVING        (Building.City = N'Winona') AND (Apartment.TenantId IS NULL)

--2C.7	Invoice, LineItem			InvoiceId, cheapest price			InvoiceId			Garage during Sep 2018
SELECT MIN(LineItem.Amount) AS [Cheapest Garage]
FROM     Invoice INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY LineItem.Description, Invoice.InvoiceDate
HAVING (LineItem.Description = N'Garage') AND (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))

--2C.8	Invoice, LineItem			InvoiceId, total amount billed			InvoiceId			Sep 2018
SELECT Invoice.InvoiceId, SUM(LineItem.Amount) AS [Total]
FROM     Invoice INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate
HAVING (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-09-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-09-30 00:00:00', 102))