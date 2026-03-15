
--find the names of employees whose first names start with the letter 'J'.

select FirstName, LastName 
from Employees
where FirstName like 'j%'

--find the names of employees whose last names end with the letter 'n'.

select FirstName, LastName 
from Employees
where LastName like '%n'

--find the email addresses of employees that contain the word "john".

select Email 
from Employees
where Email like '%john%'

--names of employees whose first names have exactly 5 characters.

select FirstName,LastName 
from Employees
where FirstName like '_____'

--names of employees whose last names contain the letter 'a' as the second character.

select FirstName, LastName 
from Employees
where LastName like '_a%'