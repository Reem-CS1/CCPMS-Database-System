# 🗄️ Computing Club Project Management System (CCPMS) Database (MySQL)

A relational database system designed and implemented in MySQL for the Project Management Committee (PMC) to organize members, projects, tasks, and project participation in a centralized system.

📌 Project Overview

This project provides a normalized database schema and a complete set of DDL, DML, and analytical SQL queries for the Project Management Committee. It manages:

- Members: Personal details (First, Middle, Last names), academic majors, and unique identifiers.
- Projects: Project titles, unique IDs, and timeline schedules (Start and End Dates with validation constraints).
- Tasks: Task descriptions, status tracking (pending, in progress, completed), deadlines, and associations with members and projects.
- Works On: Many-to-many relationship mapping between members and their assigned projects.

🗄️ Database Schema & Entities

The relational model consists of the following tables:

- MEMBER (Fname, Mname, Lname, Member_ID [PK], Major)
- PROJECT (Title, Project_ID [PK], StartDate, EndDate)
- TASK (Description, Task_ID [PK], Status, Deadline, Member_ID [FK], Project_ID [FK])
- WORKS_ON (Member_ID [FK], Project_ID [FK])

📐 Database Architecture & Design

1. Entity-Relationship Diagram (ERD)

The ER Diagram defines the conceptual model of the CCPMS, illustrating entity sets (MEMBER, PROJECT, TASK, WORKS_ON) and their relationships along with cardinalities.

<p align="left">
  <img src="Assets/ER Diagram.png" width="45%" />
</p>

2. Relational Schema

The relational schema represents the logical structure after normalization, highlighting Primary Keys (underlined) and Foreign Key mappings across all entities.

<p align="left">
  <img src="Assets/relational schema.png" width="45%" />
</p>

💻 SQL Features Included

- DDL (Data Definition Language): Table creation with PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, and CHECK constraints (such as ensuring end date > start date).
- DML (Data Manipulation Language): Sample data insertions for members, projects, tasks, and work assignments.
- DQL (Queries & Analytics):
  - Basic SELECT queries with WHERE filtering conditions.
  - Aggregation functions (`COUNT`, `GROUP BY`) to track project metrics and member distribution by major.
  - JOIN queries connecting tasks, members, and projects.
  - Subqueries filtering member task assignments.
  - Database VIEW creation (`inprogrress_Tasks`) for real-time active task reporting.

🚀 How to Run the Script

1. Open MySQL Workbench or your preferred MySQL client.
2. Execute the SQL script file to create and populate the database.

---

## 🏫 Academic Context

> **Course:** CS4108 Advanced Programming / Database Systems  
> **Institution:** Umm Al-Qura University (جامعة أم القرى)   

---

## 👥 Team Contributions

| Student Name | Student ID | Assigned Deliverables & Tasks |
| :--- | :--- | :--- |
| **Reem Alzahrani** | 446000386 | Organization Description, Database Creation & Constraints, Basic SELECT Query, Cover Page & TOC. |
| **Retal Alkabawi** | 446001145 | ER Diagram, Data Insertion & Testing, Aggregate Functions, Assigned Responsibilities Documentation. |
| **Lama Alkhteeb** | 446001469 | Scenario Development, SQL Code Documentation, JOIN Operation, Conceptual & Logical Design. |
| **Sahar Alharthi** | 446001215 | Relational Schema, Screenshots & Report Formatting, Subquery & View. |
