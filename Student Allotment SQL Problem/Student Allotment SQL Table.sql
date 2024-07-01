--Rakshit Gupta
--ID: CT_CSI_SQ_4156

-- Create StudentDetails table first
CREATE TABLE StudentDetails (
    StudentId INT PRIMARY KEY,
    StudentName NVARCHAR(100),
    GPA FLOAT,
    Branch NVARCHAR(50),
    Section NVARCHAR(50)
);

-- Create SubjectDetails table
CREATE TABLE SubjectDetails (
    SubjectId NVARCHAR(50) PRIMARY KEY,
    SubjectName NVARCHAR(100),
    MaxSeats INT,
    RemainingSeats INT
);

-- Create StudentPreference table after StudentDetails and SubjectDetails
CREATE TABLE StudentPreference (
    StudentId INT,
    SubjectId NVARCHAR(50),
    Preference INT,
    PRIMARY KEY (StudentId, SubjectId, Preference),
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId),
    FOREIGN KEY (SubjectId) REFERENCES SubjectDetails(SubjectId)
);

-- Create Allotments table
CREATE TABLE Allotments (
    SubjectId NVARCHAR(50),
    StudentId INT,
    PRIMARY KEY (SubjectId, StudentId),
    FOREIGN KEY (SubjectId) REFERENCES SubjectDetails(SubjectId),
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId)
);

-- Create UnallotedStudents table
CREATE TABLE UnallotedStudents (
    StudentId INT PRIMARY KEY,
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId)
);

-- Insert data into StudentDetails
INSERT INTO StudentDetails (StudentId, StudentName, GPA, Branch, Section) VALUES
(159103036, 'Mohit Agarwal', 8.9, 'CCE', 'A'),
(159103037, 'Rohit Agarwal', 5.2, 'CCE', 'A'),
(159103038, 'Shohit Garg', 7.1, 'CCE', 'B'),
(159103039, 'Mrinal Malhotra', 7.9, 'CCE', 'A'),
(159103040, 'Mehreet Singh', 5.6, 'CCE', 'A'),
(159103041, 'Arjun Tehlan', 9.2, 'CCE', 'B');

-- Insert data into SubjectDetails
INSERT INTO SubjectDetails (SubjectId, SubjectName, MaxSeats, RemainingSeats) VALUES
('PO1491', 'Basics of Political Science', 60, 2),
('PO1492', 'Basics of Accounting', 120, 119),
('PO1493', 'Basics of Financial Markets', 90, 90),
('PO1494', 'Eco philosophy', 60, 50),
('PO1495', 'Automotive Trends', 60, 60);

-- Insert data into StudentPreference
INSERT INTO StudentPreference (StudentId, SubjectId, Preference) VALUES
(159103036, 'PO1491', 1),
(159103036, 'PO1492', 2),
(159103036, 'PO1493', 3),
(159103036, 'PO1494', 4),
(159103036, 'PO1495', 5),
(159103037, 'PO1492', 1),
(159103037, 'PO1493', 2),
(159103037, 'PO1494', 3),
(159103037, 'PO1495', 4),
(159103037, 'PO1491', 5),
(159103038, 'PO1493', 1),
(159103038, 'PO1494', 2),
(159103038, 'PO1495', 3),
(159103038, 'PO1491', 4),
(159103038, 'PO1492', 5),
(159103039, 'PO1494', 1),
(159103039, 'PO1495', 2),
(159103039, 'PO1491', 3),
(159103039, 'PO1492', 4),
(159103039, 'PO1493', 5),
(159103040, 'PO1495', 1),
(159103040, 'PO1491', 2),
(159103040, 'PO1492', 3),
(159103040, 'PO1493', 4),
(159103040, 'PO1494', 5),
(159103041, 'PO1491', 1),
(159103041, 'PO1492', 2),
(159103041, 'PO1493', 3),
(159103041, 'PO1494', 4),
(159103041, 'PO1495', 5);

-- Empty tables for Allotments and UnallotedStudents (initially)
-- No initial data for Allotments and UnallotedStudents
