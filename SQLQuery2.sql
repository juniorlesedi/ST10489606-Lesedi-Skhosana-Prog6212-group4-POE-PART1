use RaceDay;
INSERTING VALUES TO EVENT_ORGANISER TABLE

INSERT INTO Event_Organiser
(organiserID, name, email, phone, organisation_name, user_type, password_hash) - declaring which column to populate inside the table Event_Organiser
VALUES 
(1, 'Thabo Mokoena', 'thabo@gmail.com', '0825550101', 'RaceDay Gauteng', 'Organiser', 'hash123'),
(2, 'Lerato Dlamini', 'lerato@gmail.com', '0835550102', 'RaceDay KZN', 'Organiser', 'hash456');




INSERTING VALUES TO PARTICIPANT TABLE
  
INSERT INTO Participant
(participantID, name, email, phone, dateofbirth, gender, nationality, emergency_contact) - declaring which column to populate in the table
VALUES
(1, 'Sipho Nkosi', 'sipho@gmail.com', '0715550103', '1999-04-12', 'Male', 'South African', 'Nomsa Nkosi'),
(2, 'Amahle Ndlovu', 'amahle@gmail.com', '0725550105', '2001-09-25', 'Female', 'South African', 'Sibusiso Ndlovu');

INSERTING VALUES INTO EVENT TABLE

INSERT INTO Event
(eventID, organiserID, name, description, event_date, location, Distance_km, event_type, status) - declaring which columns to populate in the table
VALUES
(1, 1, 'Johannesburg City Run', 'A 10km city running event', '2026-10-18', 'Johannesburg', 10.00, 'Run', 'Upcoming'),

(2, 1, 'Soweto Community Walk', 'A family community walk', '2026-11-08', 'Soweto', 8.00, 'Walk', 'Upcoming'),

(3, 2, 'Durban Coastal Cycle', 'A coastal cycling event', '2026-11-22', 'Durban', 40.00, 'Cycle', 'Upcoming');

INSERTING VALUES INTO CATEGORY TABLE
-- =========================================
-- 3 CATEGORIES FOR EACH EVENT              - a comment to specify and separate the events into 3 categories 
-- =========================================

INSERT INTO Category
(categoryID, eventID, name, agegroup, gender, distancekm, max_participants) - declaring which column to populate in the table 
VALUES

-- Johannesburg City Run
(1, 1, 'Junior Run', 'Under 18', 'Mixed', 5.00, 200),
(2, 1, 'Open Run', '18-39', 'Mixed', 10.00, 500),         - category number 1 for ( Johannesburg City Run)
(3, 1, 'Veteran Run', '40+', 'Mixed', 10.00, 250),

-- Soweto Community Walk
(4, 2, 'Junior Walk', 'Under 18', 'Mixed', 4.00, 150),
(5, 2, 'Open Walk', '18-39', 'Mixed', 8.00, 300),        - category number 2 for (Soweto Community Walk)
(6, 2, 'Veteran Walk', '40+', 'Mixed', 8.00, 150),

-- Durban Coastal Cycle
(7, 3, 'Junior Cycle', 'Under 18', 'Mixed', 20.00, 100),
(8, 3, 'Open Cycle', '18-39', 'Mixed', 40.00, 400),      - category number 3 for (Durban Coastal Cycle)
(9, 3, 'Veteran Cycle', '40+', 'Mixed', 40.00, 200);

INSERTING VALUES INTO REGISTRATION TABLE
INSERT INTO Registration
(registrationID, participantID, eventID, categoryID, registrationdate, status, paymentstatus, entryfee)
VALUES

(1, 1, 1, 2, '2026-09-03', 'Confirmed', 'Paid', 250),

(2, 1, 2, 5, '2026-09-03', 'Confirmed', 'Paid', 120),

(3, 2, 1, 2, '2026-09-03', 'Confirmed', 'Unpaid', 250),

(4, 2, 3, 8, '2026-09-03', 'Pending', 'Unpaid', 450);


INSERTING VALUES INTO RESULTS TABLE 
  
INSERT INTO Result
(resultID, registrationID, participantID, eventID, categoryID, finish_time, position, split_times) - declaring which column should be populated 
VALUES
(1, 1, 1, 1, 2, '00:52:35', 1, '5km - 00:25:40; 10km - 00:52:35');

INSERTING VALUES INTO ROUTE TABLE
INSERT INTO Route
(routeID, eventID, categoryID, elevation_gain, map_url, description) - declaring which column  should be populated 
VALUES
(1, 1, 2, 145.50, 'https://jhb.com/johannesburg-route', '10km city route'),

(2, 2, 5, 82.00, 'https://jhb.com/soweto-route', '8km community walking route'),

(3, 3, 8, 210.00, 'https://kzn.com/durban-route', '40km coastal cycling route');


