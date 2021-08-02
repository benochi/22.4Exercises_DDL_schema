DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE medical_center
(
  id SERIAL PRIMARY KEY,
  address TEXT NOT NULL,
  phone_number TEXT NOT NULL,
  FOREIGN KEY employee_id REFERENCES doctors(eid)
);

--INSERT INTO medical_center --
--VALUES  ()

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  specialty TEXT NOT NULL,
  shift VARCHAR(15),
  vacation_block INT,
  contact_phone TEXT,
  eid VARCHAR(20)
);

--INSERT INTO doctors(specialty, shift) --
--VALUES  ()

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT,
  FOREIGN KEY condition_id REFERENCES conditions(id)
);

CREATE TABLE doctor_patient
(
  id SERIAL PRIMARY KEY,
  FOREIGN KEY doctor_id REFERENCES doctor(id)
  FOREIGN KEY patient_id REFERENCES patient(id)
  primary? BOOLEAN
);

CREATE TABLE conditions
(
  id SERIAL PRIMARY KEY,
  medical_condition TEXT NOT NULL,
  FOREIGN KEY medication_id REFERENCES medications(id)
);

CREATE TABLE medications
(
  id SERIAL PRIMARY KEY,
  medication_name TEXT NOT NULL,
  does INT,
  cost VARCHAR(20)
);
