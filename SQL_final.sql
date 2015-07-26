-- Week 5 SQL Final Project by Srini Illapani
-- ------------------------------------------

-- Requirements:
	-- An organization grants key-card access to rooms based on groups that key-card holders belong to. You may assume that users below to only one group. 
	-- Your job is to design the database that supports the key-card system.

	-- There are six users, and four groups. Modesto and Ayine are in group “I.T.” Christopher and Cheong Woo are in group “Sales”. There are four rooms: “101”, “102”,
	-- “Auditorium A”, and “Auditorium B”. Saulat is in group “Administration.” Group “Operations” currently doesn’t have any users assigned. I.T. should be able to 
	-- access Rooms 101 and 102. Sales should be able to access Rooms 102 and Auditorium A. Administration does not have access to any rooms. Heidy is a new employee,
	-- who has not yet been assigned to any group.

-- Questions:
	-- write SELECT statements that provide the following information:
	-- 1. All groups, and the users in each group. A group should appear even if there are no users assigned to the group.
	-- 2. All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them.
	-- 3. A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted alphabetically by user, then by group, then by room.


-- Solution:

	-- 1. Create table each for users, groups and rooms. Create necessary columns and insert the data based on the requirements.
	
DROP TABLE IF EXISTS si_users CASCADE;
DROP TABLE IF EXISTS si_groups CASCADE;
DROP TABLE IF EXISTS si_rooms CASCADE;


CREATE TABLE si_users
(
  u_id int PRIMARY KEY,
  u_name varchar NOT NULL
);

INSERT INTO si_users ( u_id, u_name ) VALUES ( 1, 'Modesto');
INSERT INTO si_users ( u_id, u_name ) VALUES ( 2, 'Ayine');
INSERT INTO si_users ( u_id, u_name ) VALUES ( 3, 'Christopher');
INSERT INTO si_users ( u_id, u_name ) VALUES ( 4, 'Cheng Woo');
INSERT INTO si_users ( u_id, u_name ) VALUES ( 5, 'Saulat');
INSERT INTO si_users ( u_id, u_name ) VALUES ( 6, 'Heidy');


CREATE TABLE si_groups
(
  g_id int PRIMARY KEY,
  g_name varchar NOT NULL,
  u_id int NULL REFERENCES si_users
);
INSERT INTO si_groups ( g_id, g_name, u_id ) VALUES ( 1, 'I.T', 1);
INSERT INTO si_groups ( g_id, g_name, u_id ) VALUES ( 2, 'I.T', 2);
INSERT INTO si_groups ( g_id, g_name, u_id ) VALUES ( 3, 'Sales', 3);
INSERT INTO si_groups ( g_id, g_name, u_id ) VALUES ( 4, 'Sales', 4);
INSERT INTO si_groups ( g_id, g_name, u_id ) VALUES ( 5, 'Administration', 5);
INSERT INTO si_groups ( g_id, g_name, u_id ) VALUES ( 6, 'Operations', NULL);


CREATE TABLE si_rooms
(
  r_id int PRIMARY KEY,
  r_name varchar NOT NULL,
  g_id int NULL REFERENCES si_groups
);
INSERT INTO si_rooms ( r_id, r_name, g_id ) VALUES ( 1, '101', 1);
INSERT INTO si_rooms ( r_id, r_name, g_id ) VALUES ( 2, '102', 2);
INSERT INTO si_rooms ( r_id, r_name, g_id ) VALUES ( 3, '102', 3);
INSERT INTO si_rooms ( r_id, r_name, g_id ) VALUES ( 4, 'Auditorium A', 4);
INSERT INTO si_rooms ( r_id, r_name, g_id ) VALUES ( 5, 'Auditorium B', NULL);

-- 1. All groups, and the users in each group. A group should appear even if there are no users assigned to the group.
SELECT  b.g_id, b.g_name, a.u_id, a.u_name
	FROM si_users a RIGHT JOIN si_groups b
	ON a.u_id = b.u_id;	

-- 2. All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them.

SELECT  b.r_id, b.r_name, a.g_id, a.g_name
	FROM si_groups a RIGHT JOIN si_rooms b
	ON a.g_id = b.g_id;

-- 3. A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted alphabetically by user, then by group, then by room.

SELECT  a.u_id as userid, a.u_name as employee_name, b.g_name as group_name, c.r_name as room_name
	FROM si_users a LEFT JOIN si_groups b ON a.u_id = b.u_id 
	FULL OUTER JOIN si_rooms c ON b.g_id = c.g_id
	ORDER BY a.u_name, b.g_name, c.r_name;

	-- The list of users who have assigned groups and rooms

SELECT  a.u_id as userid, a.u_name as employee_name, b.g_name as group_name, c.r_name as room_name
	FROM si_users a INNER JOIN si_groups b ON a.u_id = b.u_id 
	INNER JOIN si_rooms c ON b.g_id = c.g_id
	ORDER BY a.u_name, b.g_name, c.r_name;



