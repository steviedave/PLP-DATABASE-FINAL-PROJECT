# 🏥 Clinic Booking System - MySQL Database

## 📚 Project Overview

This project is a **relational database system** for a real-world **Clinic Booking System**, designed using **MySQL**. It supports managing patients, doctors, appointments, payments, and prescriptions, along with doctor specializations.

---

## 🛠️ Features

- Register and manage **patients** and **doctors**
- Book, update, and track **appointments**
- Link doctors with their **specializations**
- Add and view **prescriptions** per appointment
- Manage **payments** made by patients
- Support for **many-to-many** relationships (e.g., multiple doctors per patient)

---

## 🧱 Entity-Relationship Diagram (ERD)
The ERD is available as one of the file commits to the repo named Database ERD. The following section summarizes the retationships between different tables in the ERD.

### Schema Relationships:

- **1:N**: `Doctors` ↔ `Appointments`
- **1:N**: `Patients` ↔ `Appointments`
- **1:N**: `Appointments` ↔ `Prescriptions`
- **1:N**: `Appointments` ↔ `Payments`
- **1:N**: `Specializations` ↔ `Doctors`
- **M:N**: `Patients` ↔ `Doctors` (via `PatientDoctor`)

---

## 🗃️ Database Tables

| Table Name       | Description                                 |
|------------------|---------------------------------------------|
| `Specializations`| Stores medical specialties (e.g., Cardiology)|
| `Doctors`        | Doctor profiles with specialization FK      |
| `Patients`       | Patient records                             |
| `Appointments`   | Doctor-patient meeting logs                 |
| `Prescriptions`  | Medications prescribed during appointments  |
| `Payments`       | Payment details per appointment             |
| `PatientDoctor`  | (Optional) Tracks historical relationships  |

---

## 🧾 SQL File

This repo contains one `.sql` file:

- `clinic-booking-system.sql`:  
  Contains **table creation**, **constraints**, and **sample inserts** for development/testing.

---

## 🚀 Getting Started

1. Clone this repo or download the `.sql` file.
2. Open your MySQL client (e.g., MySQL Workbench).
3. Run the `clinic_booking_system.sql` script.
4. Start querying!

---

## ✅ Sample Queries to get you started

```sql
-- List all appointments for a doctor
SELECT * FROM Appointments WHERE doctor_id = 1;

-- Get all prescriptions for a patient
SELECT P.* FROM Prescriptions P
JOIN Appointments A ON P.appointment_id = A.appointment_id
WHERE A.patient_id = 1;

-- Total payments made by a patient
SELECT SUM(amount) FROM Payments
WHERE appointment_id IN (
    SELECT appointment_id FROM Appointments WHERE patient_id = 1
);
