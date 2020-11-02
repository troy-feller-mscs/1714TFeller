  
-- 1) Buildings, apartments, admins
SELECT Buildings.Id, Buildings.BuildingName, Buildings.City, Apartments.ApartmentNum, People.FirstName + N' ' + People.LastName AS Admin
FROM     Buildings INNER JOIN
                  Apartments ON Buildings.Id = Apartments.Building_Id INNER JOIN
                  People ON Apartments.Admin_Id = People.Id
GROUP BY Buildings.Id, Buildings.BuildingName, Buildings.City, Apartments.ApartmentNum, People.FirstName + N' ' + People.LastName
-- 2) Apartments, invoices, line items
SELECT Apartments.Building_Id, Apartments.ApartmentNum, People.LastName + N', ' + People.FirstName AS Tenant, Invoices.Id AS InvoiceId, LineItems.Description, LineItems.Amount
FROM     Apartments INNER JOIN
                  Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
                  LineItems ON Invoices.Id = LineItems.Invoice_Id INNER JOIN
                  People ON Apartments.Tenant_Id = People.Id
GROUP BY Apartments.Building_Id, Apartments.ApartmentNum, People.LastName + N', ' + People.FirstName, Invoices.Id, LineItems.Description, LineItems.Amount
ORDER BY Apartments.Building_Id, Apartments.ApartmentNum DESC, InvoiceId, LineItems.Amount DESC
-- 3) Tenants, invoices, receipts
SELECT People.Id, People.LastName + N', ' + People.FirstName AS Tenant, Invoices.Id AS InvoiceId, Invoices.DueDate, Receipts.ReceiptDate, Receipts.Amount AS [Amount Received]
FROM     Apartments INNER JOIN
                  People ON Apartments.Tenant_Id = People.Id INNER JOIN
                  Receipts INNER JOIN
                  Invoices ON Receipts.Invoice_Id = Invoices.Id ON Apartments.Id = Invoices.Apartment_Id
GROUP BY People.Id, People.LastName + N', ' + People.FirstName, Invoices.Id, Invoices.DueDate, Receipts.ReceiptDate, Receipts.Amount
ORDER BY People.Id DESC