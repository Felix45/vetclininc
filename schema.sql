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

------ project 4 vets table ------

CREATE TABLE vets(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INT NOT NULL,
  date_of_graduation date NOT NULL
);

------ project 4 create specialization table ------

CREATE TABLE specializations(
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_species_vets PRIMARY KEY (species_id, vets_id)
);

------ project 4 create visits table ------

CREATE TABLE visits(
  id SERIAL PRIMARY KEY,
  animals_id INT,
  vets_id INT,
  date_of_visit date NOT NULL,
  CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Add an email column to your owners table

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

---- Database performance audit -----

CREATE INDEX idx_visits_animals_id ON visits(animals_id);
CREATE INDEX idx_visits_vets_id ON visits(vets_id);
CREATE INDEX idx_owners_email ON owners(email);