SELECT a2.carrier, a2.name
FROM Airline a2, (SELECT a1.carrier, SUM(c1.Fare) as airlineRev
	        	    FROM Airline a1, Operate o1, Class c1
	                WHERE a1.carrier = o1.Carrier AND o1.FlightNumber = c1.FlightNumber)
GROUP BY a1.carrier;
