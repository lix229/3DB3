connect to CS3DB3;

CREATE TABLE person (
    firstName char(30),
    lastName char(30),
    occupation char(30),
    dateOfBirth varchar(30),
    contactNumber int,
    personID int NOT NULL PRIMARY KEY,
    sex char(30)
    
);


CREATE TABLE city (
    -- Creating city
    population int,
    country char(30),
    area varchar(30),
    name char(30) NOT NULL PRIMARY KEY
);

CREATE TABLE airline (
    -- Creating airline
    planeNum int,
    carrierID char(30) NOT NULL PRIMARY KEY,
    name char(30) 
);

CREATE TABLE airport (
    -- Creating airport
    airportCode char(30) NOT NULL PRIMARY KEY,
    name char(30),
    location varchar(30),
    cityName char(30) REFERENCES city(name)
    -- Referencing cityName to an astribute of city called name.
);


CREATE TABLE pilot (
    -- Creating pilot
    pilotId int NOT NULL PRIMARY KEY REFERENCES person(personID),
    -- Referencing pilotID to an astribute of person called personID.
    salary varchar(30),
    yearsOfService int,
    airlineCode char(30) REFERENCES airline(carrierID)
    -- Referencing airlineCode to an astribute of airline called carrierID. 
); 

CREATE TABLE passenger (
    -- Creating passenger
    passengerID int NOT NULL PRIMARY KEY REFERENCES person(personID),
    -- Referencing passengerID to an astribute of person called personID.
    flightNum int,
    airportName char(30) REFERENCES airport(airportCode),
    -- Referencing airportName to an astribute of airport called airportCode.
    passengerClass varchar(10) CHECK (
        passengerClass = 'Silver' or
        passengerClass = 'Gold' or
        passengerClass = 'Diamond'
    ) not null
); 

CREATE TABLE flightAttendance (
    -- Creating flightAttendance
    flightAttendanceID int NOT NULL PRIMARY KEY REFERENCES person(personID),
    -- Referencing flightAttendanceID to an astribute of person called personID.
    salary varchar(30),
    yearsOfService int,
    rank varchar(30),
    airlineCode char(30),
    FOREIGN KEY(airlineCode) REFERENCES airline(carrierID)
);

CREATE TABLE plane (
    -- Creating plane
    manuf char(30),
    tailNum int NOT NULL PRIMARY KEY,
    numberOfSeat int,
    modelNumber varchar(30),
    operationYear int,
    airlineCode char(30) REFERENCES airline(carrierID)
    -- Referencing airlineCode to an astribute of airline called carrierID.
);

CREATE TABLE flight (
    -- Creating flight
    flightDistance int,
    actualArrivalTime time,
    actualDepartureTime time,
    scheduleArrivalTime time,
    scheduleDepartureTime time,
    flightDate date,
    planeNum int REFERENCES plane(tailNum),
    -- Referencing planeNum to an astribute of plane called tailNum.
    flightNum int NOT NULL PRIMARY KEY
    
);

CREATE TABLE flightTicket (
    -- Creating flightTicket
    class char(30),
    passengerType char(30),
    flightNum int REFERENCES flight(flightNum),
    -- Referencing flightNum to an astribute of flight called flightNum.
    ticketPrice int
);

CREATE TABLE flightRoute (
    -- Creating
    flightNum int,
    depAirport char(30) REFERENCES airport(airportCode),
    -- Referencing depAirport to an astribute of airport called airportCode.
    desAirpot char(30) REFERENCES airport(airportCode)
    -- Referencing desAirpot to an astribute of airport called airportCode.
);


