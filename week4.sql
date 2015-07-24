-- Week 4 SQL Assignment by Srini Illapani
-- ---------------------------------------

-- 1. Create the table. Each row should minimally include the person’s name, the person’s supervisor, and the person’s job title. Using ID columns is encouraged.
-- 2. Populate the table with a few sample rows.

DROP TABLE IF EXISTS si_employees CASCADE;

CREATE TABLE si_employees
(
  e_id int PRIMARY KEY,
  e_name varchar NOT NULL,
  title varchar,
  manager_id int NOT NULL
);

INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 1, 'John Doe', 'CEO', 0);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 2, 'Dave Mathews', 'CFO', 1);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 3, 'Mary Keene', 'CIO', 1);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 4, 'Dan Dodger', 'VP Engineering', 3);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 5, 'Scott King ', 'CMO', 1);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 6, 'Srini Illapani', 'VP Finance', 2);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 7, 'Jon Woo', 'VP Services',3);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 8, 'Stanley Cook', 'VP Accounting', 2);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 9, 'Jennifer Stone', 'VP Marketing', 5);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 10, 'Margaret Cho', 'Marketing Manager', 9);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 11, 'Stacey Lee', 'Executive Assistant', 1);
INSERT INTO si_employees ( e_id, e_name, title, manager_id ) VALUES ( 12, 'Anne Powers', 'Assistant', 2);


-- Query the newly created table with data

SELECT * from si_employees

-- 3. Provide a single SELECT statement that displays the information in the table, showing who reports to whom.
-- 	a. Manager and Employee view

SELECT 	a1.manager_id Manager_ID, a2.e_name AS Manager_Name, a2.Title as Manager_Title,
	a1.e_id Employee_ID, a1.e_name Employee_Name, a1.Title as Employee_Title
FROM   	si_employees a1
	JOIN si_employees a2
	ON a1.manager_id = a2.e_id
	ORDER BY a1.manager_id

-- 	b. Employee and Manager view

SELECT 	a1.e_id Employee_ID, a1.e_name Employee_Name, a1.Title as Employee_Title,
	a1.manager_id Manager_ID, a2.e_name AS Manager_Name, a2.Title as Manager_Title
FROM   	si_employees a1
	JOIN si_employees a2
	ON a1.manager_id = a2.e_id
	ORDER BY a1.manager_id	
	


