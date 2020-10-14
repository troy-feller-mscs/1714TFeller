-- 2E.1 Building name and location; BuildingName, Address, City+State+Zip; Winona, MN 
SELECT BuildingName, Address, City + N', ' + State + N' ' + Zip AS Location
FROM     Building
WHERE  (City = N'Winona')
-- 2E.2	Apartment estimated rent; BuildingName, ApartmentNum, SquareFeet * 0.9 plus 100.00 per bathroom; Red Wing, MN 
SELECT Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms AS [Estimated Rent]
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE  (Building.City = N'Red Wing')
-- 2E.3 Estimated vs actual rent; BuildingName, ApartmentNum, Rent, EstimatedRent, Rent - EstimatedRent; Red Wing, MN
SELECT Building.BuildingName, Apartment.ApartmentNum, 
Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms AS [Estimated Rent]
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE  (Building.City = N'Red Wing')
-- 2E.4 Invoice total; BuildingId, ApartmentNum, Tenant FirstName+LastName, InvoiceDate, total LineItem.Amount
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(DISTINCT LineItem.Amount) AS [Invoice total]
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                  Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate
-- 2E.5 Invoice total and receipt; BuildingId, ApartmentNum, Tenant FirstName+LastName, InvoiceDate, total LineItem.Amount, 
-- Receipt.Amount
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + ' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(DISTINCT LineItem.Amount) AS [Invoice total], Receipt.Amount AS [Receipt amount]
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                  Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                  Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName +  ' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount
-- 2E.6 Invoice total vs received; BuildingId, ApartmentNum, Tenant FirstName+LastName, InvoiceDate, total LineItem.Amount, 
-- Receipt.Amount, total LineItem.Amount - Receipt.Amount; Received less than total Invoice.Amount
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(DISTINCT LineItem.Amount) AS InvoiceTotal, Receipt.Amount AS Received, 
                  SUM(DISTINCT LineItem.Amount) - Receipt.Amount AS Difference
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                  Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                  Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount
HAVING SUM(DISTINCT LineItem.Amount) - Receipt.Amount > 0

-- 2E.7 Late payments; BuildingId, ApartmentNum, tenant FirstName+LastName, days late, PersonId, tenant FirstName +; days late > 0
SELECT Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.DueDate, Receipt.ReceiptDate, DATEDIFF(dd, Invoice.DueDate, Receipt.ReceiptDate) AS [Days Late]
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                  Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
WHERE  (DATEDIFF(dd, Invoice.DueDate, Receipt.ReceiptDate) > 0)
-- 2E.8 Next InvoiceDate; LastName, most recent InvoiceDate, most recent InvoiceDate + 1 month 
SELECT Person.PersonId, Person.FirstName + N' ' + Person.LastName AS Tenant, MAX(Invoice.InvoiceDate) AS [Most Recent Invoice],  DATEADD(month, 1, MAX(Invoice.InvoiceDate)) AS [Next Invoice Date]
FROM     Person INNER JOIN
                  Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
GROUP BY Person.PersonId, Person.FirstName + N' ' + Person.LastName