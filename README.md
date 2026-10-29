# 🗄️ Computing Club Project Management System (CCPMS) Database (MySQL)

A relational database designed and implemented in **MySQL** for the Project Management Committee (PMC) to organize members, projects, tasks, and project participation in a centralized system.

## 📌 Project Overview

The database improves tracking, coordination, and decision-making by storing project timelines, task assignments, and member involvement. It manages:

- **Members:** personal details (first, middle, last name), academic major, and a unique identifier.
- **Projects:** title, unique ID, and a timeline (start and end dates) with validation constraints.
- **Tasks:** description, status (pending / in progress / completed), deadline, and links to the assigned member and project.
- **Works On:** a many-to-many relationship between members and the projects they participate in.
 
---

## 🗄️ Database Schema

| Table | Columns | Keys & Constraints |
|---|---|---|
| `membeer` | `Fname`, `Mname`, `Lname`, `memberid`, `major` | PK: `memberid` · `Fname`, `Lname` NOT NULL |
| `project` | `title`, `projectid`, `startdate`, `enddate` | PK: `projectid` · `title` UNIQUE · CHECK `enddate > startdate` |
| `task` | `descriptionn`, `taskid`, `statuss`, `deadline`, `memberid`, `projectid` | PK: `taskid` · FK → `membeer`, `project` · `statuss` NOT NULL (ENUM) |
| `workson` | `memberid`, `projectid` | FK → `membeer`, `project` |

---

## 📐 Database Design

### Entity-Relationship Diagram (ERD)

The ER diagram defines the conceptual model: entity sets (MEMBER, PROJECT, TASK), the WORKS_ON, HAS, and ASSIGNED_TO relationships, and their cardinalities.

<p align="left">
  <img src="Assets/ER Diagram.png" alt="ER Diagram" width="400">
</p>

### Relational Schema

The logical structure after mapping the ERD, with primary keys underlined and foreign key mappings across all entities.

<p align="left">
  <img src="Assets/relational schema.png" alt="relational schema.png" width="400">
</p>

---

## 💻 SQL Features Included

- **DDL:** `CREATE DATABASE`, `CREATE TABLE`, and `ALTER TABLE` with `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, and `CHECK` constraints (e.g., end date must be after start date).
- **DML:** sample inserts for 8 members, 5 projects, 10 tasks, and 12 work assignments.
- **DQL:**
  - Basic `SELECT` with a `WHERE` filter.
  - Aggregation with `COUNT` and `GROUP BY`.
  - `JOIN` across tasks, members, and projects.
  - Subquery using `IN`.
  - A `VIEW` (`inprogrress_Tasks`) for active-task reporting.

---

## 🚀 How to Run the Script

1. Open MySQL Workbench and connect to your server.
2. Open the script file (`CCPMS.sql`) via **File → Open SQL Script**.
3. Click the ⚡ **Execute** button.

---

## 🏫 Academic Context

> **Note:** This project was developed as a course project , covering conceptual design (ERD), logical design (relational schema), implementation (DDL/DML), and querying (DQL).
  
---

## 👥 Team Contributions

| Student Name | Assigned Deliverables & Tasks |
| :--- | :--- |
| **Reem Alzahrani** | Organization Description, Database Creation & Constraints, Basic SELECT Query, Cover Page & TOC. |
| **Retal Alkabawi** | ER Diagram, Data Insertion & Testing, Aggregate Functions, Assigned Responsibilities Documentation. |
| **Lama Alkhteeb** | Scenario Development, SQL Code Documentation, JOIN Operation, Conceptual & Logical Design. |
| **Sahar Alharthi** | Relational Schema, Screenshots & Report Formatting, Subquery & View. |
