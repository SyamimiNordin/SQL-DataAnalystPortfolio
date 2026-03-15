

select * from Customers
select * from Orders
select * from Products


-- pairs of customers who live in the same country  -> SELF JOIN

select x.CustomerName, y.CustomerName, x.Country from Customers x
join Customers y on
x.country = y.Country and 
x.CustomerID <> y.CustomerID and -- <> = not equal to -> to remove same id being pair with same id, eg; alice-alice
x.CustomerID < y.CustomerID  -- to remove duplicate pair

-- the customer who haas spent the most on their orders

-- there will be the case where the customer spent the same amount -> DENSE RANK Function
-- we use sub-query

-- Option 1:
select CustomerName 
from (
	select CustomerName, sum(price) [Total Amount Spent], DENSE_RANK() over(order by sum(price) desc) [DR]
	from Customers c
	join Orders o on
	c.CustomerID = o.CustomerID 
	join Products p on 
	o.ProductID = p.ProductID
	group by CustomerName) m  
where DR = 1

-- Option 2:
select top 1 CustomerName, sum(price) [Total Amount Spent] from Customers c
join Orders o on
c.CustomerID = o.CustomerID 
join Products p on 
o.ProductID = p.ProductID
group by CustomerName

--customers who have ordered most type of products

select top 1 CustomerName, count(ProductID) [Number of product type ordered] from Customers c
join Orders o on 
c.CustomerID = o.CustomerID
group by CustomerName

-- OR

select CustomerName from
(select CustomerName, count(ProductID) [Number of product type ordered], DENSE_RANK() over(order by count(ProductID) desc) [DR]
from Customers c
join Orders o on 
c.CustomerID = o.CustomerID
group by CustomerName ) m where DR = 1

--customers who have ordered MORE THAN ONE type of products

select c.CustomerName, count(ProductID) [Number of product type] from Customers c
join Orders o on 
c.CustomerID= o.CustomerID
group by c.CustomerName
having count(productid)>1

-- OR
select c.CustomerName from Customers c
join Orders o on 
c.CustomerID= o.CustomerID
group by c.CustomerName
having count(productid)>1

--List all products and their corresponding orders, using a RIGHT JOIN, including products that have never been ordered

select distinct ProductName, OrderID , p.ProductID 
from Orders o
right join Products p on
o.ProductID = p.ProductID


--all orders placed by customers from the USA

select * from Customers

select OrderID 
from Customers c 
join Orders o on
c.CustomerID = o.CustomerID
where Country = 'USA'

--names of customers who have ordered a product priced above $500

select distinct CustomerName 
from Customers c 
join Orders o on
c.CustomerID = o.CustomerID 
join Products p on 
o.ProductID = p.ProductID
where Price > 500


--customers who have ordered the same product more than once

select * from Customers
select * from Products
select * from Orders

-- we want only the name of customer -> use sub queries
select distinct m.CustomerName 
from (
	select CustomerName, ProductID, count(OrderID)[Count] 
	from Customers c 
	join Orders o on
	c.CustomerID = o.CustomerID
	group by CustomerName, ProductID
	having count(OrderID)> 1
	) m   -- no ouput because no cust order more than once the same product


