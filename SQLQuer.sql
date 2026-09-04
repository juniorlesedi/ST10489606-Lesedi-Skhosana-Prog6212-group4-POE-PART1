Event table
CREATE TABLE Event_Organiser
(
    organiserID INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(50) NOT NULL,
    organisation_name VARCHAR(50) NOT NULL,
    user_type VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
Go
event table

CREATE TABLE Event
(
    eventID INT PRIMARY KEY NOT NULL,
    organiserID INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    location VARCHAR(50) NOT NULL,
    Distance_km DECIMAL(5,2) NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (organiserID)
    REFERENCES Event_Organiser(organiserID)
);
Go

    declaration of participant table
    
CREATE TABLE Participant
(
    participantID INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(50) NOT NULL,
    dateofbirth DATE NOT NULL,
    gender VARCHAR(50) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    emergency_contact VARCHAR(100) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
Go

    Declararion of Category table
CREATE TABLE Category
(
    categoryID INT PRIMARY KEY NOT NULL,
    eventID INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    agegroup VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    distancekm DECIMAL(5,2) NOT NULL,
    max_participants INT NOT NULL,

    FOREIGN KEY (eventID)
    REFERENCES Event(eventID)
);
Go

declaration of registration table

CREATE TABLE Registration
(
    registrationID INT PRIMARY KEY NOT NULL,
    participantID INT NOT NULL,
    eventID INT NOT NULL,
    categoryID INT NOT NULL,
    registrationdate DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    paymentstatus VARCHAR(20) NOT NULL,
    entryfee INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (participantID)
    REFERENCES Participant(participantID),

    FOREIGN KEY (eventID)
    REFERENCES Event(eventID),

    FOREIGN KEY (categoryID)
    REFERENCES Category(categoryID)
);
Go
Declaration of result table
    
CREATE TABLE Result
(
    resultID INT PRIMARY KEY NOT NULL,
    registrationID INT NOT NULL,
    participantID INT NOT NULL,
    eventID INT NOT NULL,
    categoryID INT NOT NULL,
    finish_time TIME NOT NULL,
    position INT NOT NULL,
    split_times VARCHAR(500) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (registrationID)
    REFERENCES Registration(registrationID),

    FOREIGN KEY (participantID)
    REFERENCES Participant(participantID),

    FOREIGN KEY (eventID)
    REFERENCES Event(eventID),

    FOREIGN KEY (categoryID)
    REFERENCES Category(categoryID)
);
Go

declaration of route table
    
CREATE TABLE Route
(
    routeID INT PRIMARY KEY NOT NULL,
    eventID INT NOT NULL,
    categoryID INT NOT NULL,
    elevation_gain DECIMAL(6,2) NOT NULL,
    map_url VARCHAR(255) NOT NULL,
    description VARCHAR(100) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (eventID)
    REFERENCES Event(eventID),

    FOREIGN KEY (categoryID)
    REFERENCES Category(categoryID)
);
Go
    
Declaration of Weatherinformation
    
CREATE TABLE WeatherInformation
(
    weatherID INT PRIMARY KEY NOT NULL,
    eventID INT NOT NULL,
    date DATE NOT NULL,
    temperature DECIMAL(4,1) NOT NULL,
    weather_condition VARCHAR(50) NOT NULL,
    wind_speed DECIMAL(4,1) NOT NULL,
    humidity INT NOT NULL,
    source_url VARCHAR(255) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (eventID)
    REFERENCES Event(eventID)
);
Go
