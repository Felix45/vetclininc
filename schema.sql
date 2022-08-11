/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals(
  id INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  date_of_birth date NOT NULL,
  escape_attempts INT NOT NULL,
  neutered boolean NOT NULL,
  weight_kg decimal NOT NULL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

-- Project 3 --

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  age INT NOT NULL
);

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owners_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_owners FOREIGN KEY (owners_id) REFERENCES owners(id);