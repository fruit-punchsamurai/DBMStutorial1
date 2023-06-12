SELECT *FROM tbl_Company;
SELECT *FROM tbl_Employee;
SELECT *FROM tbl_Manages;
SELECT *FROM tbl_Works;

--1
UPDATE tbl_Employee
SET city = 'Newtown'
WHERE employee_name = 'Jones'

--2
UPDATE tbl_Works
SET salary = salary * 1.1
WHERE company_name = 'First Bank Corporation'

--3
UPDATE tbl_Works
SET manager_salary = manager_salary * 1.1
WHERE company_name = 'First Bank Corporation'

--4
UPDATE tbl_Works
SET manager_salary = 
CASE
	WHEN manager_salary * 1.1 <=100000 THEN manager_salary *1.1
	ELSE manager_salary * 1.03
END;
WHERE manager_company = 'Small Bank Corporation'

--5
