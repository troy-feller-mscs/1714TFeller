-- 1) All Animals
SELECT Animals.AnimalName, AnimalTypes.Type, People.FirstName + N' ' + People.LastName AS Owner
FROM     Animals INNER JOIN
                  AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id INNER JOIN
                  People ON Animals.Person_Id = People.Id
-- 2) Cash Donations
SELECT People.LastName + N', ' + People.FirstName AS Donor, Donations.DonationDate, Donations.Value
FROM     Donations INNER JOIN
                  People ON Donations.Person_Id = People.Id INNER JOIN
                  DonationTypes ON Donations.DonationType_Id = DonationTypes.Id
WHERE  (DonationTypes.Description = N'cash')
-- 3) Total Donations for each donor
SELECT People.Id, People.FirstName + N' ' + People.LastName AS Donor, SUM(Donations.Value) AS [Total Donations]
FROM     People INNER JOIN
                  Donations ON People.Id = Donations.Person_Id
GROUP BY People.Id, People.FirstName + N' ' + People.LastName
-- 4) Number of dogs for each owner
SELECT People.Id, People.LastName + N', ' + People.FirstName AS Owner, COUNT(Animals.Id) AS [Number of Dogs]
FROM     People INNER JOIN
                  Animals ON People.Id = Animals.Person_Id INNER JOIN
                  AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id
GROUP BY People.Id, People.LastName + N', ' + People.FirstName, AnimalTypes.Type
HAVING (AnimalTypes.Type = N'dog')