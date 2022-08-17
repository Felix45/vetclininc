CREATE DATABASE clinic;

CREATE TABLE patients(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories(
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR(255) NOT NULL,
  CONSTRAINT fk_patient_constraint FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices(
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL(5, 2),
  generated_at TIMESTAMP NOT NULL,
  payed_time TIMESTAMP NOT NULL,
  medical_history_id INT NOT NULL,
  CONSTRAINT fk_invoice_constraint FOREIGN KEY(medical_history_id) REFERENCES invoices(id)
);

CREATE TABLE treatments(
  id SERIAL PRIMARY KEY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE invoice_items(
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL(5, 2),
  quantity INT NOT NULL,
  total_price DECIMAL(5, 2),
  invoice_id INT NOT NULL,
  treatment_id INT NULL,
  CONSTRAINT fk_invoice_item_constraint FOREIGN KEY(invoice_id) REFERENCES invoices(id),
  CONSTRAINT fk_treatment_constraint FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);