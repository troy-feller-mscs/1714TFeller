--1)		Building	Count all buildings
SELECT        COUNT(*) AS [Count All Buildings]
FROM            Building

--2)	Building	Count	Buildings in Winona
SELECT        COUNT(*) AS Count
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')

--3)		Apartment	Average rent of all apartments
SELECT        AVG(Rent) AS Average
FROM            Apartment

--4)	Apartment	Total rent	Apartments in building 1
SELECT        SUM(Rent) AS Total
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

--5)	Apartment	Cheapest rent	Building 2
SELECT        MIN(Rent) AS Cheapest
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 2)

--6)	Apartment	Smallest size, avg size, largest size	Building 1
SELECT        MIN(SquareFeet) AS [Smallest Size], AVG(SquareFeet) AS [Average Size], MAX(SquareFeet) AS [Largest Size]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

--7)		LineItem	Cheapest price	Garage
SELECT        MIN(Amount) AS [Cheapest price]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Garage')

--8)	LineItem	Total amount billed	Gas
SELECT        SUM(Amount) AS [Total amount billed]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Gas')

--9)	LineItem	Total rent	October
SELECT        SUM(Amount) AS [Total rent]
FROM            LineItem
GROUP BY Description
HAVING        (Description LIKE N'Rent, October%')