[Rakshit Gupta](https://github.com/Rakshitgupta9/Celebal-Internship)

# SQL Solutions for Assignment - Level C Task

## Tables Required for the activity

### Task 1: Projects
```sql
CREATE TABLE Projects (
    Task_ID INT PRIMARY KEY,
    Start_Date DATE,
    End_Date DATE
);

INSERT INTO Projects (Task_ID, Start_Date, End_Date) VALUES
(1, '2022-01-01', '2022-01-10'),
(2, '2022-01-05', '2022-01-15'),
(3, '2022-01-12', '2022-01-20');
```

### Task 2: Students, Friends, and Packages
```sql
CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Friends (
    ID INT,
    Friend_ID INT,
    PRIMARY KEY (ID, Friend_ID)
);

CREATE TABLE Packages (
    ID INT PRIMARY KEY,
    Salary DECIMAL(10, 2)
);

INSERT INTO Students (ID, Name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Friends (ID, Friend_ID) VALUES
(1, 2),
(1, 3),
(2, 3);

INSERT INTO Packages (ID, Salary) VALUES
(1, 50000),
(2, 60000),
(3, 55000);
```

### Task 3: Functions
```sql
CREATE TABLE Functions (
    X INT,
    Y INT
);

INSERT INTO Functions (X, Y) VALUES
(1, 2),
(2, 1),
(3, 4),
(4, 5),
(5, 3);
```

### Task 4: Contests, Challenges, View_Stats, and Submission_Stats
```sql
CREATE TABLE Contests (
    contest_id INT PRIMARY KEY,
    hacker_id INT,
    name VARCHAR(100)
);

CREATE TABLE Challenges (
    challenge_id INT PRIMARY KEY,
    contest_id INT
);

CREATE TABLE View_Stats (
    challenge_id INT,
    total_views INT,
    total_unique_views INT
);

CREATE TABLE Submission_Stats (
    challenge_id INT,
    total_submissions INT,
    total_accepted_submissions INT
);

INSERT INTO Contests (contest_id, hacker_id, name) VALUES
(1, 1, 'Contest1'),
(2, 2, 'Contest2');

INSERT INTO Challenges (challenge_id, contest_id) VALUES
(1, 1),
(2, 1),
(3, 2);

INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES
(1, 100, 90),
(2, 200, 180);

INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES
(1, 50, 30),
(3, 40, 20);
```

### Task 5: Submissions and Hackers
```sql
CREATE TABLE Submissions (
    submission_id INT PRIMARY KEY,
    submission_date DATE,
    hacker_id INT
);

CREATE TABLE Hackers (
    hacker_id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO Submissions (submission_id, submission_date, hacker_id) VALUES
(1, '2022-01-01', 1),
(2, '2022-01-01', 2),
(3, '2022-01-02', 1),
(4, '2022-01-02', 3),
(5, '2022-01-03', 2);

INSERT INTO Hackers (hacker_id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');
```
[Rakshit Gupta](https://github.com/Rakshitgupta9/Celebal-Internship)
### Task 6: STATION
```sql
CREATE TABLE STATION (
    ID INT PRIMARY KEY,
    LAT_N DECIMAL(8, 4),
    LONG_W DECIMAL(8, 4)
);

INSERT INTO STATION (ID, LAT_N, LONG_W) VALUES
(1, 39.8974, 116.3858),
(2, 34.0522, 118.2437);
```

### Task 7: Prime Numbers
No specific table needed; this task is purely based on generating prime numbers.

### Task 8: Occupations
```sql
CREATE TABLE Occupations (
    Name VARCHAR(100),
    Occupation VARCHAR(100)
);

INSERT INTO Occupations (Name, Occupation) VALUES
('Samantha', 'Doctor'),
('Julia', 'Professor'),
('Maria', 'Singer'),
('Scarlett', 'Actor'),
('James', 'Doctor'),
('John', 'Professor'),
('Edward', 'Singer'),
('Robert', 'Actor');
```

### Task 9: BST
```sql
CREATE TABLE BST (
    N INT PRIMARY KEY,
    P INT
);

INSERT INTO BST (N, P) VALUES
(1, NULL),
(2, 1),
(3, 1),
(4, 2),
(5, 2);
```

### Task 10: Company, Lead_Manager, Senior_Manager, Manager, and Employee
```sql
CREATE TABLE Company (
    company_code INT PRIMARY KEY,
    founder VARCHAR(100)
);

CREATE TABLE Lead_Manager (
    company_code INT,
    lead_manager_code INT
);

CREATE TABLE Senior_Manager (
    company_code INT,
    senior_manager_code INT
);

CREATE TABLE Manager (
    company_code INT,
    manager_code INT
);

CREATE TABLE Employee (
    company_code INT,
    employee_code INT
);

INSERT INTO Company (company_code, founder) VALUES
(1, 'Alice'),
(2, 'Bob');

INSERT INTO Lead_Manager (company_code, lead_manager_code) VALUES
(1, 101),
(2, 102);

INSERT INTO Senior_Manager (company_code, senior_manager_code) VALUES
(1, 201),
(2, 202);

INSERT INTO Manager (company_code, manager_code) VALUES
(1, 301),
(2, 302);

INSERT INTO Employee (company_code, employee_code) VALUES
(1, 401),
(2, 402);
```

### Task 11: Students, Friends, and Packages
Same as Task 2.

### Task 15: Employees
```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, Salary) VALUES
(1, 50000),
(2, 60000),
(3, 55000),
(4, 70000),
(5, 45000),
(6, 80000);
```

### Task 16: TableName
```sql
CREATE TABLE TableName (
    ColumnA INT,
    ColumnB INT
);

INSERT INTO TableName (ColumnA, ColumnB) VALUES
(5, 3),
(7, 2),
(4, 8);
```

### Task 17: Database User Creation
No specific table needed

### Task 18: Employees with BU, Cost, and Weight
```sql
CREATE TABLE Employees (
    BU VARCHAR(100),
    Cost DECIMAL(10, 2),
    Weight DECIMAL(10, 2)
);

INSERT INTO Employees (BU, Cost, Weight) VALUES
('HR', 1000, 1.2),
('Finance', 2000, 1.5),
('IT', 1500, 1.3),
('HR', 1200, 1.4),
('Finance', 2200, 1.6);
```

### Task 19: Employees with Salary
Same as Task 15.

### Task 20: SourceTable and TargetTable
```sql
CREATE TABLE SourceTable (
    KeyColumn INT PRIMARY KEY,
    Column1 VARCHAR(100),
    Column2 VARCHAR(100)
);

CREATE TABLE TargetTable (
    KeyColumn INT PRIMARY KEY,
    Column1 VARCHAR(100),
    Column2 VARCHAR(100)
);

INSERT INTO SourceTable (KeyColumn, Column1, Column2) VALUES
(1, 'A', 'B'),
(2, 'C', 'D'),
(3, 'E', 'F');

INSERT INTO TargetTable (KeyColumn, Column1, Column2) VALUES
(1, 'A', 'B');
```
---
## Some Sample Screenshots
![image](https://github.com/Rakshitgupta9/Celebal-Internship/assets/95240061/9211d753-aad8-44ad-a59e-45ff98840850)

![image](https://github.com/Rakshitgupta9/Celebal-Internship/assets/95240061/3bed2133-26dd-44d7-84fb-69e09a791526)

![image](https://github.com/Rakshitgupta9/Celebal-Internship/assets/95240061/51781315-681e-44db-ab5d-0875a4bd042f)

![image](https://github.com/Rakshitgupta9/Celebal-Internship/assets/95240061/22f5ba6a-c171-4c98-9dfd-9f8f14d29617)

![image](https://github.com/Rakshitgupta9/Celebal-Internship/assets/95240061/79c7f142-ee10-4186-84f5-1d3d3d5489df)

---
### Contact

For any clarifications or assistance regarding this task, please contact:

- **Name:** Rakshit Gupta
- **ID:** CT_CSI_SQ_4156
- **Email:** guptarakshit9858@gmail.com
- **LinkedIn:** [Rakshit Gupta](https://www.linkedin.com/in/rakshit-gupta)
