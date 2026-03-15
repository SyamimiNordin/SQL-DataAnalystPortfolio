

CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    Department VARCHAR(50),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

--records
INSERT INTO EmployeeSales (SaleID, EmployeeID, Department, SaleAmount, SaleDate)
VALUES 
(1, 101, 'Electronics', 500.00, '2023-08-01'),
(2, 102, 'Electronics', 300.00, '2023-08-03'),
(3, 101, 'Furniture', 150.00, '2023-08-02'),
(4, 103, 'Electronics', 250.00, '2023-08-04'),
(5, 104, 'Furniture', 200.00, '2023-08-02'),
(6, 101, 'Furniture', 450.00, '2023-08-05'),
(7, 102, 'Electronics', 700.00, '2023-08-05'),
(8, 103, 'Furniture', 100.00, '2023-08-06');


-- total sales amount for each department in the EmployeeSales table.

select distinct 
Department, 
SUM(Saleamount) [Total Sale] from EmployeeSales
group by Department

--the number of sales made by each employee.

select EmployeeID, count(SaleID)[Number of Sales] 
from EmployeeSales
group by EmployeeID

--the average sale amount for each department.

select Department, avg(saleamount) [Avg Sale Amount] 
from EmployeeSales
GROUP BY Department


--total sales amount for each employee,where the employees who have made more than one sale.

select EmployeeID, sum(saleamount) [Amount of Sales] 
from EmployeeSales
group by EmployeeID
having count(saleID) > 1

--total sales for each month in 2023.

select month(saledate) [Month], sum(saleamount) [Total Sale] 
from EmployeeSales
where year(SaleDate) = 2023
group by month(saledate)


