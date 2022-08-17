CREATE DATABASE clinic;

CREATE TABLE patients(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories(
  id SERIAL PRIMARY KEY,
  admitted_at TIME NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR(255) NOT NULL,
  CONSTRAINT fk_patient_constraint FOREIGN KEY(patient_id) REFERENCES patients(id)
);