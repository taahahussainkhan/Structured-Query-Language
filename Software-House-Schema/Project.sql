DROP DATABASE SoftwareHouse;
CREATE DATABASE SoftwareHouse;
USE SoftwareHouse;
SET SQL_SAFE_UPDATES = 0;
#-----------------------------------------% Table Creation %
CREATE TABLE Client (
  ClientID INT NOT NULL ,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Phone VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  PRIMARY KEY (ClientID)
);

CREATE TABLE Employee (
  EmployeeID INT NOT NULL ,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Phone VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  HireDate DATE NOT NULL,
  Salary INT NOT NULL,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE Project (
  ProjectID INT NOT NULL ,
  Title VARCHAR(255) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  PRIMARY KEY (ProjectID)
);

CREATE TABLE Task (
  TaskID INT NOT NULL ,
  Description VARCHAR(255) NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  PRIMARY KEY (TaskID)
);

CREATE TABLE Service (
  ServiceID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  PRIMARY KEY (ServiceID)
);

CREATE TABLE Contract (
  ContractID INT NOT NULL ,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  TermsAndConditions VARCHAR(255) NOT NULL,
  PRIMARY KEY (ContractID)
);

CREATE TABLE Payment (
  PaymentID INT NOT NULL ,
  Amount INT NOT NULL,
  PaymentDate DATE NOT NULL,
  PRIMARY KEY (PaymentID)
);

#-----------------------------------------% Adding Foreign Keys %

ALTER TABLE Project
ADD ClientID INT,
ADD FOREIGN KEY (ClientID) 
REFERENCES Client (ClientID)
ON DELETE CASCADE
ON UPDATE CASCADE;


ALTER TABLE Task
ADD ProjectID INT,
ADD FOREIGN KEY (ProjectID) 
REFERENCES Project (ProjectID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Task
ADD EmployeeID INT,
ADD FOREIGN KEY (EmployeeID) 
REFERENCES Employee (EmployeeID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Contract
ADD ServiceID INT,
ADD FOREIGN KEY (ServiceID) 
REFERENCES Service (ServiceID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Contract
ADD ClientID INT,
ADD FOREIGN KEY (ClientID) 
REFERENCES Client (ClientID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Contract
ADD EmployeeID INT,
ADD FOREIGN KEY (EmployeeID) 
REFERENCES Employee (EmployeeID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Payment
ADD ContractID INT,
ADD FOREIGN KEY (ContractID) 
REFERENCES Contract (ContractID)
ON DELETE CASCADE
ON UPDATE CASCADE;

#-----------------------------------------% Inserting Data %

# Client
INSERT INTO Client (ClientID, FirstName, LastName, Email, Phone, Address) 
VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', '123-456-7890', '123 Main Street'),
(2, 'Jane', 'Smith', 'janesmith@gmail.com', '555-667-8901', '456 Elm Street'),
(3, 'Michael', 'Jones', 'michaeljones@gmail.com', '789-012-3456', '789 Oak Street'),
(4, 'Sarah', 'Williams', 'sarahwilliams@gmail.com', '901-234-5678', '101 Maple Street'),
(5, 'David', 'Brown', 'davidbrown@gmail.com', '234-567-8901', '234 Pine Street'),
(6, 'Emily', 'Green', 'emilygreen@gmail.com', '567-890-1234', '345 Elm Street'),
(7, 'Peter', 'White', 'peterwhite@gmail.com', '890-123-4567', '456 Oak Street'),
(8, 'Susan', 'Black', 'susanblack@gmail.com', '012-345-6789', '567 Maple Street'),
(9, 'Thomas', 'Gray', 'thomasgray@gmail.com', '345-678-9012', '789 Oak Street'),
(10, 'Nancy', 'Pink', 'nancypink@gmail.com', '678-901-2345', '101 Maple Street');



# Employee

INSERT INTO Employee (EmployeeID, FirstName, LastName, Email, Phone, Address, HireDate, Salary)
VALUES (1, "John", "Doe", "johndoe@example.com", "555-555-1212", "21 Oslo St", "2022-02-01", 52000),
       (2, "Jane", "Doe", "janedoe@example.com", "555-555-1212", "23 Greenfield Rd", "2021-04-01", 55000),
       (3, "Bob", "Smith", "bobsmith@example.com", "555-555-1212", "143 Main St", "2009-01-01", 80000),
       (4, "Sue", "Johnson", "suejohnson@example.com", "555-555-1212", "113 Main Rd", "2021-11-01", 60000),
       (5, "Mike", "Brown", "mikebrown@example.com", "555-555-1212", "21 Main Victoria Rd", "2007-11-01", 90000),
       (6, "Mary", "Jones", "maryjones@example.com", "555-555-1212", "87 Victoria St", "2018-10-01", 10000),
       (7, "Tom", "Wilson", "tomwilson@example.com", "555-555-1212", "122 Main Rd", "2023-08-01", 30000),
       (8, "Lisa", "Davis", "lisadavis@example.com","555-555-1212","123 Victoria Road","2021/03/01 ","40000"),
       (9,"Bill","Miller","billmiller@example.com","555.555.1212","139 Main St","2012/08/01","50000"),
       (10,"Karen","Taylor","karentaylor@example.com","555.555.1212","256 Victoria St","2020/05/01","20000");
       


# Project

INSERT INTO Project (ProjectID, Title, Description, StartDate, EndDate, ClientID) VALUES
(1, 'Inventory Manager', 'Develop a new software application to manage inventory.', '2023-01-01', '2023-03-01', 1),
(2, 'Website Developement', 'Design and build a new website to promote products and services.', '2023-02-01', '2023-04-01', 2),
(3, 'Marketing Compaign', 'Implement a new marketing campaign using print, online, and social media.', '2023-03-01', '2023-05-01', 3),
(4, 'Market Research', 'Conduct market research to understand target market and needs.', '2023-04-01', '2023-06-01', 4),
(5, 'White Paper', 'Write a white paper to educate customers about new technology.', '2023-05-01', '2023-07-01', 5),
(6, 'Training Program', 'Create a new training program to train employees on new software application.', '2023-06-01', '2023-08-01', 6),
(7, 'Product', 'Develop a new product to solve a specific problem.', '2023-07-01', '2023-09-01', 7),
(8, 'Customer Support', 'Provide customer support via phone, email, and chat.', '2023-08-01', '2023-10-01', 8),
(9, 'Management', 'Manage a project to develop new software application.', '2023-09-01', '2023-11-01', 9),
(10, 'Website', 'Deliver a project on time and within budget to develop new website.', '2023-10-01', '2023-12-01', 10);

# Task 

INSERT INTO Task (TaskID, Description, StartDate, EndDate, ProjectID, EmployeeID) VALUES
(1, 'Develop the user interface.', '2023-01-01', '2023-03-01', 1, 1),
(2, 'Develop the database.', '2023-02-01', '2023-04-01', 1, 2),
(3, 'Implement the user stories.', '2023-03-01', '2023-05-01', 1, 3),
(4, 'Write the unit tests.', '2023-04-01', '2023-06-01', 1, 4),
(5, 'Integrate the modules.', '2023-05-01', '2023-07-01', 1, 5),
(6, 'Deploy the application.', '2023-06-01', '2023-08-01', 1, 6),
(7, 'Test the application.', '2023-07-01', '2023-09-01', 1, 7),
(8, 'Fix bugs.', '2023-08-01', '2023-10-01', 1, 8),
(9, 'Release the application.', '2023-09-01', '2023-11-01', 1, 9),
(10, 'Provide support to users.', '2023-10-01', '2023-12-01', 1, 10);

# Service

INSERT INTO Service (ServiceID, Name, Description) VALUES
(1, 'Software Development', 'We develop custom software applications to meet your business needs.'),
(2, 'Website Design and Development', 'We design and develop beautiful and functional websites that will help you grow your business.'),
(3, 'Marketing', 'We help you reach your target audience with effective marketing campaigns.'),
(4, 'Consulting', 'We provide expert advice and guidance on a variety of business-related topics.'),
(5, 'Training', 'We offer a variety of training programs to help you and your employees develop the skills you need to succeed.'),
(6, 'Support', 'We provide 24/7 support to ensure that your software applications and websites are always up and running.'),
(7, 'Security', 'We help you protect your data from unauthorized access.'),
(8, 'Cloud Computing', 'We help you move your business to the cloud so you can save money and improve efficiency.'),
(9, 'Data Analytics', 'We help you make sense of your data so you can make better business decisions.'),
(10, 'Mobile App Development', 'We develop mobile apps that will help you reach your target audience on their mobile devices.');


# Contract

INSERT INTO Contract (ContractID, ServiceID, ClientID, EmployeeID, StartDate, EndDate, TermsAndConditions) VALUES
(1, 1, 1, 1, '2023-01-01', '2023-03-01', 'This is the contract terms and conditions for Inventory Manager Project.'),
(2, 2, 2, 2, '2023-02-01', '2023-04-01', 'This is the contract terms and conditions for Website Developement.'),
(3, 3, 3, 3, '2023-03-01', '2023-05-01', 'This is the contract terms and conditions for Marketing Compaign.'),
(4, 4, 4, 4, '2023-04-01', '2023-06-01', 'This is the contract terms and conditions for Market Research.'),
(5, 5, 5, 5, '2023-05-01', '2023-07-01', 'This is the contract terms and conditions for White Paper.'),
(6, 6, 6, 6, '2023-06-01', '2023-08-01', 'This is the contract terms and conditions for Training Program.'),
(7, 7, 7, 7, '2023-07-01', '2023-09-01', 'This is the contract terms and conditions for Product.'),
(8, 8, 8, 8, '2023-08-01', '2023-10-01', 'This is the contract terms and conditions for Customer Support.'),
(9, 9, 9, 9, '2023-09-01', '2023-11-01', 'This is the contract terms and conditions for Management.'),
(10, 10, 10, 10, '2023-10-01', '2023-12-01', 'This is the contract terms and conditions for Website.');


# Payment

INSERT INTO Payment (PaymentID, ContractID, Amount, PaymentDate) VALUES
(1, 1, 1000, '2023-01-01'),
(2, 2, 2000, '2023-02-01'),
(3, 3, 3000, '2023-03-01'),
(4, 4, 4000, '2023-04-01'),
(5, 5, 5000, '2023-05-01'),
(6, 6, 6000, '2023-06-01'),
(7, 7, 7000, '2023-07-01'),
(8, 8, 8000, '2023-08-01'),
(9, 9, 9000, '2023-09-01'),
(10, 10, 10000, '2023-10-01');


#-----------------------------------------% Updation %

# Client

UPDATE Client 
SET FirstName = 'James' 
WHERE ClientID = 1;

UPDATE Client 
SET Phone = '545-545-1216' 
WHERE ClientID = 5;

UPDATE Client 
SET Address = '781 Oak Street' 
WHERE ClientID = 2;

UPDATE Client 
SET Phone = '555-555-1314' 
WHERE ClientID = 3;

UPDATE Client 
SET FirstName = 'Jack' 
WHERE ClientID = 7;

# Employee

# Update the employee's name.

UPDATE Employee
SET FirstName = 'John',
LastName = 'Doe'
WHERE EmployeeID = 1;

UPDATE Employee
SET Salary = 200500
WHERE EmployeeID = 2;

UPDATE Employee
SET Address = '21 Brookfield St'
WHERE EmployeeID = 8;

UPDATE Employee
SET Salary = 100000
WHERE EmployeeID = 3;

UPDATE Employee
SET LastName = 'David'
WHERE EmployeeID = 4;


#Project

UPDATE Project
SET Title = "Inventory Management System"
WHERE ProjectID = 1;

UPDATE Project
SET StartDate = "2010-04-01"
WHERE ProjectID = 8;

UPDATE Project
SET Description = "Only Build a new website to promote products and services."
WHERE ProjectID = 2;

UPDATE Project
SET StartDate = "2023-06-01"
WHERE ProjectID = 3;

UPDATE Project
SET Title = "Inventory Management System"
WHERE ProjectID = 9;

# Task

UPDATE task
SET EndDate = "2023-12-01"
WHERE TaskID = 8;

UPDATE task
SET EndDate = "2019-02-03"
WHERE TaskID = 5;

UPDATE task
SET Description = "Developing backend."
WHERE TaskID = 2;

UPDATE task
SET EndDate = "2023-09-01"
WHERE TaskID = 3;

UPDATE task
SET Description = "Testing"
WHERE TaskID = 7;

# Service

UPDATE Service 
SET Name = 'Software Developement Service' 
WHERE ServiceID = 1;

UPDATE Service 
SET Description = 'New Description' 
WHERE ServiceID = 2;

UPDATE Service 
SET Name = 'Cyber Security'
WHERE ServiceID = 7;

UPDATE Service 
SET Name = 'Testing'
WHERE ServiceID = 3;

UPDATE Service 
SET Name = 'Software Developement Service' 
WHERE ServiceID = 6;

# Contract

UPDATE Contract
SET EndDate = '2023-03-01'
WHERE StartDate = '2023-01-01';

UPDATE Contract
SET TermsAndConditions = 'This is the new contract terms and conditions for Service 1.'
WHERE ServiceID = 1;

UPDATE Contract
SET EmployeeID = 2
WHERE ClientID = 2;

UPDATE Contract
SET EndDate = '2023-03-01'
WHERE ContractID = 3;

UPDATE Contract
SET EndDate = '2023-03-01'
WHERE ServiceID = 3;

# Payment

UPDATE Payment
SET Amount = 2000
WHERE ContractID = 1;

UPDATE Payment
SET PaymentDate = '2023-03-01'
WHERE PaymentID = 5;

UPDATE Payment
SET PaymentDate = '2023-06-01'
WHERE Amount > 5000;

UPDATE Payment
SET PaymentDate = '2022-08-01'
WHERE Amount < 8000;

UPDATE Payment
SET Amount = 22000
WHERE ContractID = 8;



#-----------------------------------------% SELECT %

SELECT * FROM Employee WHERE HireDate > '2022-01-01';

SELECT Title, StartDate FROM Project;

SELECT * FROM Employee WHERE Salary > 50000;



SELECT * FROM Client WHERE Email LIKE '%@gmail.com';


SELECT * FROM Employee WHERE Salary < 50000;


#-----------------------------------------% JOINS %

SELECT Task.*, Project.*, Client.*, Employee.*
FROM Task
JOIN Project ON Task.ProjectID = Project.ProjectID
JOIN Client ON Project.ClientID = Client.ClientID
JOIN Employee ON Task.EmployeeID = Employee.EmployeeID;


SELECT Client.*, Project.*
FROM Client
JOIN Project ON Client.ClientID = Project.ClientID;


SELECT Task.*, Project.*, Employee.*
FROM Task
INNER JOIN Project ON Task.ProjectID = Project.ProjectID
INNER JOIN Employee ON Task.EmployeeID = Employee.EmployeeID;



SELECT 
Client.*, Project.*
FROM Client
LEFT JOIN Project 
ON Client.ClientID = Project.ClientID;


SELECT 
Client.*, Project.*
FROM Client
RIGHT JOIN Project 
ON Client.ClientID = Project.ClientID;

#-----------------------------------------% CASES %

SELECT
  Title,
  CASE
    WHEN EndDate > CURDATE() THEN 'Active'
    ELSE 'Completed'
  END AS Status
FROM Project;

SELECT
  CONCAT(FirstName, ' ', LastName) AS FullName,
  CASE
    WHEN Phone <> '' THEN 'Individual'
    WHEN Email <> '' THEN 'Company'
    ELSE 'Unknown'
  END AS Category
FROM Client;


SELECT
  Description,
  CASE
    WHEN DATEDIFF(EndDate, CURDATE()) <= 3 THEN 'Urgent'
    ELSE 'Normal'
  END AS Priority
FROM Task;


SELECT
  CONCAT(FirstName, ' ', LastName) AS FullName,
  CASE
    WHEN YEAR(HireDate) < 2020 THEN 'Senior'
    ELSE 'Junior'
  END AS ExperienceLevel
FROM Employee;


SELECT
  Title,
  CASE
    WHEN (SELECT COUNT(*) FROM Task WHERE Task.ProjectID = Project.ProjectID) > 5 THEN 'High'
    ELSE 'Low'
  END AS TaskComplexity
FROM Project;

#-----------------------------------------% VIEWS %



CREATE VIEW ActiveContracts AS
SELECT 
c.ContractID, 
c.StartDate, 
c.EndDate, 
cl.FirstName AS ClientFirstName, 
cl.LastName AS ClientLastName, 
e.FirstName AS EmployeeFirstName, 
e.LastName AS EmployeeLastName
FROM Contract c
JOIN Client cl 
ON c.ClientID = cl.ClientID
JOIN Employee e 
ON c.EmployeeID = e.EmployeeID
WHERE c.EndDate > CURDATE();
SELECT * FROM ActiveContracts;


CREATE VIEW ProjectDetails AS
SELECT ProjectID, Title, StartDate, EndDate
FROM Project;
SELECT * FROM ProjectDetails;


CREATE VIEW EmployeeTasks AS
SELECT e.EmployeeID, 
e.FirstName, 
e.LastName, e.Email, 
e.Phone, 
e.Address, 
t.TaskID, 
t.Description, 
t.StartDate, 
t.EndDate
FROM Employee e
JOIN Task t 
ON e.EmployeeID = t.EmployeeID;
SELECT * FROM EmployeeTasks;



CREATE VIEW PaymentDetails AS
SELECT PaymentID, Amount, PaymentDate
FROM Payment;
SELECT * FROM PaymentDetails;

CREATE VIEW ContractTerms AS
SELECT ContractID, StartDate, EndDate, TermsAndConditions
FROM Contract;
SELECT * FROM ContractTerms;


#-----------------------------------------% PROCEDURES %

DELIMITER //
CREATE PROCEDURE InsertClient (
    IN clientID INT,
    IN firstName VARCHAR(255),
    IN lastName VARCHAR(255),
    IN email VARCHAR(255),
    IN phone VARCHAR(255),
    IN address VARCHAR(255)
)
BEGIN
    INSERT INTO Client (ClientID, FirstName, LastName, Email, Phone, Address)
    VALUES (clientID, firstName, lastName, email, phone, address);
END //
DELIMITER ;
CALL InsertClient(12, 'John', 'Doe', 'johndoe@example.com', '1234567890', '123 Main St');
SELECT * FROM CLIENT;



DELIMITER //
CREATE PROCEDURE GetEmployeeTasks (
    IN employeeID INT
)
BEGIN
    SELECT TaskID, Description, StartDate, EndDate
    FROM Task
    WHERE EmployeeID = employeeID;
END //
DELIMITER ;

CALL GetEmployeeTasks(123);


DELIMITER //
CREATE PROCEDURE GetTaskByID (
    IN taskID INT
)
BEGIN
    SELECT *
    FROM Task
    WHERE TaskID = taskID;
END //
DELIMITER ;
CALL GetTaskByID(1);



DELIMITER //
CREATE PROCEDURE InsertProject (
    IN projectID INT,
    IN title VARCHAR(255),
    IN description VARCHAR(255),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    INSERT INTO Project (ProjectID, Title, Description, StartDate, EndDate)
    VALUES (projectID, title, description, startDate, endDate);
END //
DELIMITER ;
CALL InsertProject(16, 'New Project', 'This is a new project', '2023-01-01', '2023-12-31');
SELECT * FROM PROJECT;



DELIMITER //
CREATE PROCEDURE InsertService (
    IN name VARCHAR(255),
    IN description VARCHAR(255)
)
BEGIN
    INSERT INTO Service (Name, Description)
    VALUES (name, description);
END //
DELIMITER ;

CALL InsertService('Web Development', 'Creating and maintaining websites');
SELECT * FROM SERVICE;

#-----------------------------------------% AGGREGATE FUNCTIONS %

SELECT SUM(Amount) AS TotalRevenue
FROM Payment;


SELECT AVG(DATEDIFF(EndDate, StartDate)) AS AverageTaskDuration
FROM Task;

SELECT MIN(StartDate) AS MinProjectStartDate
FROM Project;

SELECT COUNT(*) AS ActiveContracts
FROM Contract
WHERE EndDate > CURDATE();

SELECT YEAR(StartDate) AS Year, COUNT(*) AS TotalProjects
FROM Project
GROUP BY YEAR(StartDate);


SELECT YEAR(StartDate) AS Year, COUNT(*) AS TotalProjects
FROM Project
GROUP BY YEAR(StartDate);



#-----------------------------% CO-RELATED QUERIES %

SELECT ClientID, FirstName, LastName
FROM Client
WHERE ClientID IN (
    SELECT DISTINCT ClientID
    FROM Project
);


SELECT p.ProjectID, p.Title, (
    SELECT AVG(e.Salary) FROM Employee e WHERE e.EmployeeID = t.EmployeeID
) AS AverageSalary
FROM Project p
INNER JOIN Task t ON p.ProjectID = t.ProjectID;


SELECT s.ServiceID, s.Name, s.Description
FROM Service s
WHERE NOT EXISTS (
    SELECT * FROM Contract c WHERE c.ServiceID = s.ServiceID
);


SELECT c.ContractID, c.StartDate, c.EndDate, (
    SELECT SUM(p.Amount) FROM Payment AS p WHERE p.ContractID = c.ContractID
) AS TotalAmountPaid
FROM Contract AS c;



SELECT e.FirstName, e.LastName
FROM Employee AS e
WHERE (
    SELECT COUNT(DISTINCT t.ProjectID) FROM Task AS t WHERE t.EmployeeID = e.EmployeeID
) > 1;

#-----------------------------% NESTED QUERIES %


SELECT *
FROM Project
WHERE ProjectID IN (
  SELECT ContractID
  FROM Payment
  WHERE Amount > 5000
);






