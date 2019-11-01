SELECT DISTINCT p1.ID, p1.FirstName, p1.LastName, p1.Sex, p1.DateOfBirth 
FROM Person p1, Passenger p2 
WHERE  (YEAR (p1.DateOfBirth)) <= 2001 AND p1.ID = p2.PassengerID AND p1.Occupation LIKE '%Student' AND p1.ID IN 
                    (SELECT t1.PassengerID
                    FROM Take t1
                    WHERE t1.FlightNumber = 11 AND (DAY (t1.Date)) = 20 AND((MONTH (t1.Date)) = 'January'));