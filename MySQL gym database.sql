CREATE DATABASE leisure; 
USE leisure;

CREATE TABLE Course(
CourseID INT PRIMARY KEY auto_increment,
Level INT,
Sessions INT, 
Instructor VARCHAR (15),
startDate date,
LessonTime time
);

insert into Course (level, Sessions, Instructor, startDate, LessonTime) values 
('1','12','Monika','2023-09-04','16:30:00'),
('2','16','Earl','2023-04-04','17:30:00'),
('3','18','Mae','2023-01-04','16:30:00'),
('4','12','Mark','2023-06-06','17:00:00'),
('5','14','Lucy','2023-08-04','18:00:00'),
('6','18','Leo','2023-09-30','10:00:00'),
('7','16','Susy','2023-11-05','11:00:00');

CREATE TABLE Lessons(
LessonID INT PRIMARY KEY,
CourseID INT, 
MemberID INT, 
foreign key(CourseID) references Course (CourseID)
);
ALTER TABLE Lessons
ADD CONSTRAINT lessons foreign key(MemberID) references Members (MemberID); 

drop table lessons; 

insert into Lessons (LessonID,CourseID,MemberID) values 
(100,1,4),
(200,2,7),
(300,3,1),
(400,4,6),
(500,5,2),
(600,6,5),
(700,7,3); 

CREATE TABLE Members(
MemberID INT PRIMARY KEY,
Firstname VARCHAR (15),
Surname VARCHAR (20),
DOB date,
Address VARCHAR(25),
City VARCHAR (10) 
);

Insert into Members (MemberID, Firstname, Surname, DOB, Address, City) values
(1, 'Aldric', 'Dellar', '2016-01-23', '93 Charing Cross Alley', 'Machala'),
(2, 'Thacher', 'Rowth', '2012-03-23', '87 Glendale Circle', 'Baruun'),
(3, 'Gard', 'Trevethan', '2017-01-26', '91 Glacier Hill', 'Boston'),
(4, 'John', 'Ankers', '2003-05-25', '01 Haas Place', 'London'),
(5, 'Mauricio', 'Thoumasson', '2003-08-06', '2 Fordem Junction', 'Kuhma'),
(6, 'Heidi', 'Kalkofer', '2014-04-14', '22 Blackbird', 'Lilla'),
(7, 'Somerset', 'Vaughton', '2003-03-04', '0 Rutledge Point', 'Niany'); 

update members
set surname = 'caberna'
where memberID = '3';

update members
set surname = 'amary'
where memberID = '7';

update members
set Firstname = 'Ebsomp'
where memberID = '4';

/* (8, 'Hilliary', 'Whymark', '2015/04/23', '6 Drewry Plaza', 'Dimataling'),
(9, 'Tuckie', 'Landal', '2005/12/06', '4506 Warbler Parkway', 'Gemena'),
(10, 'Costa', 'Lindblom', '2001/09/21', '013 Bay Drive', 'Maliiha'),
(11, 'Simon', 'Narramore', '2000/02/01', '46 Melvin Point', 'Besuki'),
(12, 'Sumner', 'Bryant', '2005/04/14', '6 Dwight Road', 'Massy'),
(13, 'Kirby', 'Skuse', '2002/08/23', '0231 Dryden Road', 'Yaroslavskiy'),
(14, 'Loria', 'Boays', '2007/05/06', '1459 Scofield Parkway', 'Vale'),
(15, 'Arlen', 'Limpkin', '2017/10/01', '84227 Harbort Terrace', 'Cibatu'); */ 
7 row(s) affected, 7 warning(s): 4095 Delimiter '/' in position 4 in datetime value '2016/01/23' at row 1 is deprecated. Prefer the standard '-'. 4095 Delimiter '/' in position 4 in datetime value '2012/03/23' at row 2 is deprecated. Prefer the standard '-'. 4095 Delimiter '/' in position 4 in datetime value '2017/01/26' at row 3 is deprecated. Prefer the standard '-'. 4095 Delimiter '/' in position 4 in datetime value '2003/05/25' at row 4 is deprecated. Prefer the standard '-'. 4095 Delimiter '/' in position 4 in datetime value '2003/08/06' at row 5 is deprecated. Prefer the standard '-'. 4095 Delimiter '/' in position 4 in datetime value '2014/04/14' at row 6 is deprecated. Prefer the standard '-'. 4095 Delimiter '/' in position 4 in datetime value '2003/03/04' at row 7 is deprecated. Prefer the standard '-'. Records: 7  Duplicates: 0  Warnings: 7
-- i changes but It gives back 
Error Code: 1062. Duplicate entry '1' for key 'members.PRIMARY' -- so i left it like before even with that warning


 -- --------------------------------------------------------------------------------------------
/* A. Use the SQL AND, OR and NOT Operators in your query (The WHERE clause can be 
combined with AND, OR, and NOT operators)
A 1. Where courseID is equals to a number below 5 and the instructor of any of the instructors */

SELECT * from course
WHERE courseID <='5' AND instructor='Earl' OR 'Mark'; -- why is not Mark shown?

-- A 2. Where courseID is equals to a number above 5 and the lesson time is in the morning or afternoon. 
Select * from course
WHERE courseID >='5' AND NOT lessonTime >='12:00:00'; -- AS I DO NOT HAVE IN VALUES AFTERNOON AS VARCHAR I added as time to be shown only morning times

/* B. Order by the above results by:
B 1. startDate in “course” table */
SELECT * FROM Course
order by startDate Desc; -- as a plus optional i added desc

-- B 2. MemberID in “members” table 
SELECT * FROM Members
order by MemberID asc; --  as a plus optional i added asc

/* C. UPDATE the following:
C 1. Members table, change the addresses of any three members. */
update members
set address = '3 ham road'
where memberID = '2';

update members
set address = '48 oval road'
where memberID = '5';

update members
set address = '2 symon street'
where memberID = '6';

-- C 2. Course table, change the startDate and lesson time for three of the sessions
-/* ALL of the give back the same error, i do not know what does mean, for instance the first example
Error Code: 1292. Truncated incorrect DOUBLE value: '2023/01/01'
I also tried to change it to '2024-01-01' but still the same error
Error Code: 1292. Truncated incorrect DOUBLE value: '2024-01-01'
 */
update course
set startDate = '2023/01/01' AND lessontime= '16:00:00'
where courseID = '1';

update course
set startDate = '2024/01/03' AND lessontime= '17:00:00'
where courseID = '3';

update course
set startDate = '2024/01/07' AND lessontime= '15:00:00'
where courseID = '7';

/* D. Use the SQL MIN () and MAX () Functions to return the smallest and largest value 
D 1. Of the LessonID column in the “lesson” table */
USE leisure;
SELECT min(LessonID) from lessons;
USE leisure;
Select  max(LessonID) from lessons;

-- D 2. Of the membersID column in the “members” table
USE leisure;
SELECT min(memberID) from MEMBERS; 

USE leisure;
Select max(memberID) from MEMBERS;

/* E. Use the SQL COUNT (), AVG () and SUM () Functions for these:
E 1. Count the total number of members in the “members” table  */
SELECT count(memberID) as 'members total' from members;

/* E 2. Count the total number of sessions in the” members” table
I'm not sure if it's rigth as there's no sessions in table members
I'd need to combined memberid of Members and lessons tables + courseID from lessons table + sessions from course table */
SELECT count(sessions) as 'sessions total' from members; -- help, please
-- another way that i tried but it doesn't work
USE leisure;
SELECT c.Sessions, m.memberid, SUM(t.sessions) AS 'total sessions' FROM course AS c LEFT JOIN courseID as I ON m.memberid = c.courseID;

-- E 3. Find the average session time for all “sessions” in course table
SELECT AVG(sessions) as 'avg session time' from course;

/* F. WILDCARD queries (like operator) 
F a) Find all the people from the “members” table whose last name starts with A. */
select * from members where Surname like 'A%';
-- F- b) Find all the people from the “members” table whose last name ends with A.
select * from members where Surname like '%A';
-- F- c) Find all the people from the “members” table that have "ab" in any position in the last name.
select * from members where Surname like '%ab%';
-- F- d) Find all the people from the “members” table that that have "b" in the second position in their first name.
SELECT * from members where Firstname like '__%b'; -- I don't know why It doesn't work I updated a value memberID nº 4 with a name Ebsomp
-- F- e) Find all the people from the “members” table whose last name starts with "a" and are at least 3 characters in length:
select * from members where Surname like 'a%__'; 
-- F- f) Find all the people from the “members” table whose last name starts with "a" and ends with "y"
select * from members where Surname like 'a%' AND '%y'; -- I don't know why It doesn't work I updated a value memberid nº7 
-- F- g) Find all the people from the “members” table whose last name does not starts with "a" and ends with "y
select * from members where Surname NOT'a%' AND '%y';
