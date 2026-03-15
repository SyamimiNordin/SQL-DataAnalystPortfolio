
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


-- employees who have a salary higher than the average salary of all employees.

SELECT *
FROM Employees

select FirstName, LastName , Salary 
from Employees
where Salary > (
        Select avg(salary) 
        from Employees
        )

--list of employees names and their departments whose who were hired after the oldest employee in the company.

select FirstName,LastName, HireDate 
from Employees
where HireDate > (select min(HireDate) from Employees)

select * from Employees

--details of the employee(s) with the highest salary.

select * 
from Employees
where salary = (select max(salary) from Employees)

-- names of employees who work in the same department as 'John Smith'.

select FirstName, LastName from Employees
where DepartmentID = (
                    select DepartmentID from Employees
                    where FirstName= 'John' and LastName = 'Smith'
                    )

-- names of employees who do not belong to the department with the highest average salary.

select * 
from Employees
where not DepartmentID = (
                        select top 1 DepartmentID 
                        from Employees
                        group by DepartmentID
                        order by avg(salary) desc
                        )