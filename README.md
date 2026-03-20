# Concert Management System: Database Design & Implementation

## Project Overview
This project involves the end-to-end design and implementation of a relational database tailored for a concert production company. The system is engineered to manage complex logistics, including artist contracts, venue management, tiered ticket sales by zones, and musician accommodations.

The primary goal of this database is to provide the production team with actionable insights regarding revenue streams, venue occupancy rates, and logistical efficiency through advanced querying and database automation.

## Technical Stack
* **Language:** SQL (MySQL)
* **Modeling:** Entity-Relationship (E-R) Diagram & Relational Mapping
* **Documentation:** Comprehensive technical report

## Key Database Features
The repository contains a robust SQL script featuring:
* **Schema Design (DDL):** Full schema creation with optimized data types and integrity constraints (Primary Keys, Foreign Keys, and CHECK constraints).
* **Data Management (DML):** A comprehensive set of seed data to test and verify all relational links and business logic.
* **Advanced Querying:** Complex Joins and Aggregations to solve business questions (e.g., total revenue by city, artist career tracking, and real-time capacity analysis).
* **Database Objects:**
    * **Views:** Pre-defined virtual tables for critical data access like "Upcoming Concerts" and "Income Leaderboard."
    * **Triggers:** Implementation of business rules, such as preventing overbooking (Inventory Control) and automated data recovery/audit logs for deleted venue records.

## Repository Structure
* `concert_management.sql`: The complete source code to replicate the database environment.
* `concert_management_system.pdf`: Full technical documentation including the E-R diagram, relational model, and detailed breakdown of the project requirements.

## Usage
1. Clone the repository.
2. Execute the `.sql` script in your preferred Database Management System (DBMS).
3. Explore the pre-defined **Views** and **Queries** at the end of the script to see the data in action.

<img width="2041" height="1188" alt="image" src="https://github.com/user-attachments/assets/2404a795-e243-4160-af6b-2f261ae07dc2" />
---
*Project developed as part of the Applied Data Science degree (UCM).*
