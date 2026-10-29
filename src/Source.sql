/* 
 * Project: Computing Club Project Management System (CCPMS)
 * Major: Computer Science
 * Course: Introduction to Database Systems (DS2201)
 * Group Members: Reem Alzahrani, Retal Alkabawi, Lama Alkhteeb, Sahar Alharthi
 */

create database CCPMS;
show databases;
use CCPMS;

create table membeer (
Fname varchar(60),
Mname varchar(60),
Lname varchar(60),
memberid int primary key,
major varchar(60)
);
alter table membeer
modify column Fname varchar(60) not null;

alter table membeer
modify column Lname varchar(60) not null;
describe membeer;

create table project (
title varchar(60),
projectid int primary key,
startdate datetime,
enddate datetime
);
alter table project
add check (enddate > startdate);

alter table project
add unique(title);
describe project;


create table task (
descriptionn varchar(100),
taskid int primary key,
statuss enum('pending', 'in progrress', 'complated'),
deadline datetime,
memberid int,
projectid int
);
alter table task 
add foreign key(memberid) references
membeer(memberid);
alter table task
add foreign key(projectid) references
project(projectid);
alter table task
modify column statuss enum('pending', 'in progrress', 'complated')  not null;
describe task;

create table workson (
memberid int,
projectid int
);

alter table workson
add foreign key(projectid) references
project(projectid);

alter table workson
add foreign key(memberid) references
membeer(memberid);

describe membeer;
describe project;
describe task;


INSERT INTO membeer VALUES
('Leen', 'Ali', 'Alahmari', 1, 'CS'),
('Faisal', 'Ahmed', 'Almansour', 2, 'CE'),
('Noura', 'Fahad', 'Alharbi', 3, 'CS'),
('Layan', 'Saad', 'Alotaibi', 4, 'SE'),
('Sara', 'Mohammed', 'Alqahtani', 5, 'SE'),
('Huda', 'Khalid', 'Alshammari', 6, 'CS'),
('Rayan', 'Abdullah', 'Almutairi', 7, 'AI'),
('Yara', 'Saleh', 'Alshareef', 8, 'HCI');

SELECT * FROM membeer;

INSERT INTO project VALUES
('Thaqqaf Initiative', 101, '2026-01-10', '2026-02-01'),
('Beacon of Knowledge', 102, '2026-02-15', '2026-03-10'),
('Forest Initiative', 103, '2026-03-01', '2026-03-20'),
('Life++ Initiative', 104, '2026-03-05', '2026-04-01'),
('Figma Prototyping Workshop', 105, '2026-04-10', '2026-04-25');

SELECT * FROM project;

INSERT INTO task VALUES
('Training Schedule', 501, 'complated', '2026-01-15', 1, 101),
('Prepare Training Materials', 502, 'complated', '2026-01-25', 2, 101),

('Research Framework', 503, 'in progrress', '2026-02-28', 3, 102),
('Data Collection', 504, 'pending', '2026-03-05', 4, 102),

('Project Proposal', 505, 'complated', '2026-03-05', 5, 103),
('UI Design Concepts', 506, 'in progrress', '2026-03-15', 6, 103),

('Member Workshops', 507, 'complated', '2026-03-15', 7, 104),
('Workshop Feedback', 508, 'pending', '2026-03-28', 8, 104),

('Figma Assets Preparation', 509, 'in progrress', '2026-04-15', 1, 105),
('Prototype Development', 510, 'pending', '2026-04-20', 2, 105);

SELECT * FROM task;


INSERT INTO workson VALUES
(1,101),(2,101),(3,101),
(4,102),(5,102),(6,102),
(7,103),(8,103),
(1,104),(2,104),
(3,105),(4,105);

SELECT * FROM workson;

/*One basic SELECT query that specifies certain columns and uses a WHERE condition. */
SELECT title, startdate FROM project
WHERE startdate < '2026-03-01';

/*Two Aggregate Functions */
SELECT COUNT(*) AS total_projects
FROM project;

SELECT major, COUNT(*) AS total_member 
FROM membeer 
GROUP BY major;

/*ONE Join opreation between tables. */
SELECT membeer.Fname AS Member_Name, task.taskid AS Task_ID,  
project.title AS Project_Name, task.statuss AS Task_Status
FROM task 
JOIN membeer ON task.memberid = membeer.memberid
JOIN project ON task.projectid = project.projectid;

/*ONE Subquery*/
SELECT Fname, Lname
FROM membeer 
WHERE memberid IN (SELECT memberid FROM task);

/*One View*/
CREATE VIEW inprogrress_Tasks AS
SELECT taskid, descriptionn, statuss FROM task
WHERE statuss = 'in progrress';

SELECT * FROM inprogrress_Tasks;
