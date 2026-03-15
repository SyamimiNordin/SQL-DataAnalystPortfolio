-- SET OF QUESTIONS 2


--select employees who work in the 'IT' department and have a salary greater than 75,000?

select * from Employees 
where Department ='IT' and salary >75000

--employees who work in the 'HR' department or have a salary less than 60,000?

select * from Employees
where Department = 'HR' or salary<60000

--employees who do not work in the 'Finance' department?

select * from Employees
where not department = 'Finance'

--OR

select * from Employees
where Department not in ('Finance')

--employees whose salary is between 60,000 and 70,000 and who work in the 'Finance' department?

select * from Employees
WHERE salary between 60000 and 70000 and department = 'Finance'

--employees who work in the 'IT' department and do not have a salary greater than 80,000?

select * from Employees
where Department='Finance' and salary <= 80000

--OR

select * from employees
where Department in ('Finance') and not salary > 80000

--employees who work in the 'HR' or 'Finance' departments and have a salary greater than 65,000?

select * from Employees
where (department = 'HR' or  department = 'Finance') and salary >= 65000

--OR

select * from Employees
where department in ('HR','Finance' )and salary >= 65000


--employees whose last name starts with 'D' and do not work in the 'HR' department?

select * from Employees
where lastname like 'd%' and not department = 'HR'

--OR

select * from Employees
where lastname like 'd%' and department not in ('HR')

-- employees who do not work in the 'IT' department and have a salary greater than 70,000?

select * from Employees
where department not in ('IT') and salary >  70000

--OR

select * from Employees
where not department ='IT' and salary >  70000

--employees who work in the 'IT' department and either have a salary greater 
--   than 75,000 or have the first name 'Laura'?

select * from Employees
where department in ('IT') and (salary > 75000 or FirstName='Laura')


--employees who do not work in the 'HR' or 'IT' departments?

select * from Employees
where department not in ('HR', 'IT')

