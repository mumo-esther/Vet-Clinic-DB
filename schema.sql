/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;
USE vet_clinic;
CREATE TABLE animals (
	id integer NOT NULL,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL AUTO_INCREMENT,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg integer NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD COLUMN species varchar(50) NOT NULL;

CREATE TABLE owners (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    age INTEGER
);

CREATE TABLE species (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

ALTER TABLE animals
    DROP COLUMN species,
    ADD COLUMN species_id INTEGER,
    ADD COLUMN owner_id INTEGER,
    MODIFY COLUMN id INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE animals
    ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id)
        REFERENCES species(id),
    ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id)
        REFERENCES owners(id);

CREATE TABLE vets (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  vet_id INTEGER,
  species_id INTEGER,
  FOREIGN KEY (vet_id) REFERENCES vets (id),
  FOREIGN KEY (species_id) REFERENCES species (id)
);

CREATE TABLE visits (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  vet_id INTEGER,
  animal_id INTEGER,
  visit_date DATE,
  FOREIGN KEY (vet_id) REFERENCES vets (id),
  FOREIGN KEY (animal_id) REFERENCES animals (id)
);

