--Query a count of the number of cities in CITY having a Population larger than 100,000.
SELECT 
    COUNT(*)
FROM 
    CITY
WHERE 
    POPULATION > 100000;
	
-- Query the total population of all cities in CITY where District is California.	
select sum(population) from 
CITY 
where District = 'California'

--Query the average population of all cities in CITY where District is California.
select avg(population) from 
CITY 
where District = 'California'

--Query the average population for all cities in CITY, rounded down to the nearest integer.
select round(avg(population)) from 
CITY 

--Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
select sum(population) as total_population 
from
CITY 
where countrycode = 'JPN'

--Query the difference between the maximum and minimum populations in CITY.	
select max(population) - min(population)
from
CITY

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboards key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
-- Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
select round(round(avg(salary)) - round(avg(replace(salary,0,'')))) from
EMPLOYEES


--We define an employees total earnings to be their monthly salary x Months worked, and the maximum total earnings to be the maximum total earnings 
--for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the 
--total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
select max(earnings), count(*)
from(
     select salary * months as earnings
     from employee
) as earn_table
WHERE earnings = (SELECT max(salary * months) FROM EMPLOYEE)