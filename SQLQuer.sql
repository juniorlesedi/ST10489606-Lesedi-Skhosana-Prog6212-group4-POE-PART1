Event table
CREATE TABLE Event_Organiser
(
    organiserID INT PRIMARY KEY NOT NULL,   -THIS IS A PRIMARY KEY OF THE TABLE
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
    eventID INT PRIMARY KEY NOT NULL, - THIS IS THE PRIMARY KEY OF THE TABLE 
    organiserID INT NOT NULL, -FOREIGN KEY OF THE TABLE
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    location VARCHAR(50) NOT NULL,
    Distance_km DECIMAL(5,2) NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (organiserID)
    REFERENCES Event_Organiser(organiserID) - REFERENCE OF THE FOREIGN KEY
);
Go

    declaration of participant table
    
CREATE TABLE Participant
(
    participantID INT PRIMARY KEY NOT NULL,  -PRIMARY KEY OF THE TABLE
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
    categoryID INT PRIMARY KEY NOT NULL, - PRIMARY KEY OF THE TABLE
    eventID INT NOT NULL, - FOREIGN KEY OF THE TABLE
    name VARCHAR(50) NOT NULL,
    agegroup VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    distancekm DECIMAL(5,2) NOT NULL,
    max_participants INT NOT NULL,

    FOREIGN KEY (eventID)
    REFERENCES Event(eventID) - REFERENCE OF THE FOREIGN KEY
);
Go

declaration of registration table

CREATE TABLE Registration
(
    registrationID INT PRIMARY KEY NOT NULL, - PRIMARY KEY OF THE TABLE 
    participantID INT NOT NULL,- FOREIGN KEY NUMBER 1  OF THE TABLE 
    eventID INT NOT NULL, - FOREIGN KEY NUMBER 2 OF THE TABLE
    categoryID INT NOT NULL, - FOREIGN KEY NUMBER 3 OF THE TABLE 
    registrationdate DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    paymentstatus VARCHAR(20) NOT NULL,
    entryfee INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (participantID)
    REFERENCES Participant(participantID), -REFERENCE OF FOREIGN KEY NUMBER 1

    FOREIGN KEY (eventID)
    REFERENCES Event(eventID), - REFERENCE OF FOREIGN KEY NUMBER 2

    FOREIGN KEY (categoryID)
    REFERENCES Category(categoryID)- REFERENCE OF FOREIGN KEY NUMBER 3
);
Go
Declaration of result table
    
CREATE TABLE Result
(
    resultID INT PRIMARY KEY NOT NULL, - PRIMARY KEY OF THE TABLE
    registrationID INT NOT NULL, - REFERENCE OF FOREIGN KEY NUMBER 1
    participantID INT NOT NULL,- REFERENCE OF FOREIGN KEY NUMBER 2
    eventID INT NOT NULL,- REFERENCE OF FOREIGN KEY NUMBER 3
    categoryID INT NOT NULL,- REFERENCE OF FOREIGN KEY NUMBER 4 
    finish_time TIME NOT NULL,
    position INT NOT NULL,
    split_times VARCHAR(500) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (registrationID)
    REFERENCES Registration(registrationID), - REFERENCE OF FOREIGN KEY NUMBER 1

    FOREIGN KEY (participantID)
    REFERENCES Participant(participantID), - REFERENCE OF FOREIGN KEY NUMBER 2

    FOREIGN KEY (eventID)
    REFERENCES Event(eventID), - REFERENCE OF FOREIGN KEY NUMBER 3

    FOREIGN KEY (categoryID)
    REFERENCES Category(categoryID) - REFERENCE OF FOREIGN KEY NUMBER 4
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
    weatherID INT PRIMARY KEY NOT NULL, primary key of the table
    eventID INT NOT NULL, - foreign key of the table
    date DATE NOT NULL,
    temperature DECIMAL(4,1) NOT NULL,
    weather_condition VARCHAR(50) NOT NULL,
    wind_speed DECIMAL(4,1) NOT NULL,
    humidity INT NOT NULL,
    source_url VARCHAR(255) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (eventID)
    REFERENCES Event(eventID) - reference of the foreign key
);
Go
