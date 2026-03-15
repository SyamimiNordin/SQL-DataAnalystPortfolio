
-- Creating the Employees table

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);


-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);


-- Inserting data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'IT');

insert into Departments
values(104, 'Business')

insert into Employees (EmployeeID, FirstName, LastName)
values(6, 'Kim', 'Mingyu')

select * from Employees
select * from Departments

--list the names of employees along with the names of the departments 

select FirstName, LastName, DepartmentName
from Employees e 
join Departments d on
e.DepartmentID = d.DepartmentID

--list all the departments and the employees, including departments with no employees.

select DepartmentName, FirstName, LastName 
from Employees e
right join Departments d on
e.DepartmentID = d.DepartmentID


--the names of employees who do not belong to any department (i.e., no matching department ID).


SELECT E.FirstName, E.LastName 
FROM Employees E
LEFT JOIN Departments D
ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentID IS NULL;


--names of employees who work in the same department as 'Jane Doe'.


--Option 1:
select FirstName, LastName from Employees
where DepartmentID = (
                       select DepartmentID 
                       from Employees 
                       where FirstName = 'jane' and LastName = 'Doe'
                       )
and not (FirstName='Jane' AND LastName = 'Doe')


--Option 2:
select e1.FirstName, e1.LastName 
from Employees e1
join Employees e2 on
e1.DepartmentID = e2.DepartmentID
where e2.FirstName ='Jane' and e2.LastName = 'Doe'
and  e1.EmployeeID <> e2.EmployeeID  -- to delete jane doe , because jane doe is jane doe


--find the department with the highest total salary paid to its employees.


--Option 1:
select DepartmentName 
from Employees e
join Departments d on
e.DepartmentID = d.DepartmentID
where Salary = (select max(Salary) from Employees)

-- Option 2:
SELECT TOP 1 D.DepartmentName
FROM Departments D
JOIN Employees E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName
ORDER BY SUM(E.Salary) DESC;
