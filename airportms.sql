CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(50)
);

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Name VARCHAR(50),
    Occupation VARCHAR(50),
    AirportID VARCHAR(20),
    GateNumber INT,
    IDType ENUM('EmployeeID', 'NID'),
    EntranceStatus BOOLEAN,
    AdminID INT,
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

CREATE TABLE Gate (
    GateID INT PRIMARY KEY,
    GateNumber INT,
    Location VARCHAR(100),
    Purpose ENUM('Employee', 'Public', 'Parcel Only'),
    OccupationType VARCHAR(50)
);

CREATE TABLE EntranceLog (
    LogID INT PRIMARY KEY,
    UserID INT,
    GateID INT,
    EntryTime DATETIME,
    ExitTime DATETIME,
    ReasonForEntry VARCHAR(200),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (GateID) REFERENCES Gate(GateID)
);

CREATE TABLE FamilyMember (
    FamilyMemberID INT PRIMARY KEY,
    NID VARCHAR(20),
    Name VARCHAR(50),
    BoardingMemberID INT,
    FOREIGN KEY (BoardingMemberID) REFERENCES User(UserID)
);

CREATE TABLE ParcelReceiver (
    ReceiverID INT PRIMARY KEY,
    NID VARCHAR(20),
    Name VARCHAR(50),
    GateID INT,
    FOREIGN KEY (GateID) REFERENCES Gate(GateID)
);

CREATE TABLE ManualTicket (
    TicketID INT PRIMARY KEY,
    GateID INT,
    UserID INT,
    IssueTime DATETIME,
    FOREIGN KEY (GateID) REFERENCES Gate(GateID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
