SELECT *FROM tbl_Company;
SELECT *FROM tbl_Employee;
SELECT *FROM tbl_Works;
SELECT *FROM tbl_Manages;


--question 2
--1
SELECT employee_name FROM tbl_Works
WHERE company_name = 'First Bank Corporation'

--2
SELECT employee_name,city FROM tbl_Employee 
WHERE employee_name IN 
(SELECT employee_name FROM tbl_Works 
WHERE company_name = 'Small Bank Corporation');

--3
SELECT *FROM tbl_Employee
WHERE employee_name IN
(SELECT employee_name FROM tbl_Works
WHERE company_name = 'Small Bank Corporation' AND salary>80000);

--4
SELECT employee_name FROM tbl_Employee
WHERE city IN (SELECT city FROM tbl_Company WHERE company_name IN
(SELECT company_name FROM tbl_Works WHERE tbl_Works.employee_name = tbl_Employee.employee_name))

--5
SELECT employee_name FROM tbl_Manages WHERE
manager_street IN (SELECT street FROM tbl_Employee WHERE tbl_Employee.employee_name = tbl_Manages.employee_name)
AND manager_city IN
(SELECT city FROM tbl_Employee WHERE tbl_Employee.employee_name = tbl_Manages.employee_name)

--6
SELECT employee_name FROM tbl_Works
WHERE company_name != 'Small Bank Corporation'

--7
SELECT employee_name FROM tbl_Works
WHERE salary > (SELECT MAX(SALARY) FROM tbl_Works
WHERE company_name = 'First Bank Corporation')

--8
SELECT company_name FROM tbl_Company
WHERE city = (SELECT city FROM tbl_Company
WHERE company_name = 'Small Bank Corporation')

--9
SELECT employee_name FROM tbl_Works
WHERE salary > Any (select AVG(salary) FROM tbl_Works group by (company_name))

--10
SELECT company_name FROM tbl_Works GROUP BY (company_name)
HAVING COUNT(employee_name) >= ALL
(SELECT COUNT(employee_name) FROM tbl_Works GROUP BY(company_name))

--11
SELECT company_name FROM tbl_Works WHERE salary <= ALL(SELECT salary FROM  tbl_Works)

--12
SELECT company_name FROM tbl_Works GROUP BY (company_name)
HAVING AVG(salary) > (SELECT AVG(salary) FROM tbl_Works WHERE company_name = 'First Bank Corporation');
