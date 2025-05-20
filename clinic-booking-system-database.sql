-- CLINIC BOOKING SYSTEM DATABASE
-- Author: Stephen David Oduor

-- Droping tables if they already exist for safe reruns
DROP TABLE IF EXISTS Payments, Prescriptions, Appointments, PatientDoctor, Patients, Doctors, Specializations;

-- 1. Creating Specializations' Table
CREATE TABLE Specializations (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Creating Doctors' Table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    specialization_id INT,
    FOREIGN KEY (specialization_id) REFERENCES Specializations(specialization_id)
);


-- 3. Creating Patients' Table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL
);

-- 4. Appointments Table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- 5. Prescriptions Table
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    medication TEXT NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    duration VARCHAR(100),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- 6. Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('Cash', 'Card', 'Insurance') NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- 7. Many-to-Many - Patient-Doctor relationship
CREATE TABLE PatientDoctor (
    patient_id INT,
    doctor_id INT,
    relationship_start DATE,
    PRIMARY KEY (patient_id, doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Sample INSERTS to database
INSERT INTO Specializations (name) VALUES ('Cardiology'), ('Dermatology'), ('Pediatrics');
INSERT INTO Doctors (first_name, last_name, email, phone, specialization_id) VALUES ('Stephen', 'Oduor', 'steveoduor289@gmail.com', '+254745960656', 1);
INSERT INTO Patients (first_name, last_name, email, phone, date_of_birth) VALUES ('John', 'Mallowa', 'johnmallowa@gmail.com', '+254767675454', '1990-05-15');
INSERT INTO Appointments (patient_id, doctor_id, appointment_date) VALUES (1, 1, '2025-06-01 10:00:00');
