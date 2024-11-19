-- Admin Table
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    Name VARCHAR(50),
    Username VARCHAR(50),
    Password VARCHAR(50),
    ContactInfo VARCHAR(100)
);

-- Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Role ENUM('Pilot', 'Engineer', 'Ground Staff'),
    AirlineID INT,
    GateID INT,
    ContactInfo VARCHAR(100),
    FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID),
    FOREIGN KEY (GateID) REFERENCES Gate(GateID)
);

-- Airline Table
CREATE TABLE Airline (
    AirlineID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    ContactInfo VARCHAR(100)
);

-- Flight Table
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    AirlineID INT,
    Source VARCHAR(50),
    Destination VARCHAR(50),
    Date DATE,
    Time TIME,
    GateID INT,
    PilotID INT,
    Status ENUM('Scheduled', 'Delayed', 'Departed'),
    FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID),
    FOREIGN KEY (GateID) REFERENCES Gate(GateID),
    FOREIGN KEY (PilotID) REFERENCES Pilot(PilotID)
);

-- Pilot Table
CREATE TABLE Pilot (
    PilotID INT PRIMARY KEY,
    Name VARCHAR(50),
    LicenseNo VARCHAR(50),
    ExperienceYears INT,
    AirlineID INT,
    FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID)
);

-- Passenger Table
CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    Name VARCHAR(50),
    NID VARCHAR(20),
    ContactInfo VARCHAR(100),
    FlightID INT,
    TicketID INT,
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

-- Gate Table
CREATE TABLE Gate (
    GateID INT PRIMARY KEY,
    Location VARCHAR(100),
    Purpose ENUM('Employee', 'Flight', 'Public', 'Parcel'),
    AssignedTo VARCHAR(100)
);

-- Public User Table
CREATE TABLE PublicUser (
    UserID INT PRIMARY KEY,
    Name VARCHAR(50),
    NID VARCHAR(20),
    RelationToPassenger VARCHAR(50),
    ReasonForVisit VARCHAR(100),
    GateID INT,
    FOREIGN KEY (GateID) REFERENCES Gate(GateID)
);

-- Parcel Table
CREATE TABLE Parcel (
    ParcelID INT PRIMARY KEY,
    ReceiverName VARCHAR(50),
    NID VARCHAR(20),
    ContactInfo VARCHAR(100),
    GateID INT,
    Reason VARCHAR(100),
    FOREIGN KEY (GateID) REFERENCES Gate(GateID)
);