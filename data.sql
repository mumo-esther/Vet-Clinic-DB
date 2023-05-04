/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, false, 10.23),
       ('Gabumon', '2018-11-15', 2, true, 8),
       ('Pikachu', '2021-01-07', 1, false, 15.04),
       ('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species) 
VALUES 
('Charmander', '2020-02-08', 0, false, -11, ''),
('Plantmon', '2021-11-15', 2, true, -5.7, ''),
('Squirtle', '1993-04-02', 3, false, -12.13, ''),
('Angemon', '2005-06-12', 1, true, -45, ''),
('Boarmon', '2005-06-07', 7, true, 20.4, ''),
('Blossom', '1998-10-13', 3, true, 17, ''),
('Ditto', '2022-05-14', 4, true, 22, '');

CREATE DATABASE vet_clinic;
USE vet_clinic;
CREATE TABLE animals (
	id integer NOT NULL AUTO_INCREMENT,
    name varchar(100),
    date_of_birth date ,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal(5,2),
    PRIMARY KEY (id)
);
ALTER TABLE animals ADD COLUMN species varchar(50) NOT NULL;

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, false, 10.23),
       ('Gabumon', '2018-11-15', 2, true, 8),
       ('Pikachu', '2021-01-07', 1, false, 15.04),
       ('Devimon', '2017-05-12', 5, true, 11);


SELECT * FROM animals LIMIT 3;
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species) 
VALUES 
('Charmander', '2020-02-08', 0, false, -11, ''),
('Plantmon', '2021-11-15', 2, true, -5.7, ''),
('Squirtle', '1993-04-02', 3, false, -12.13, ''),
('Angemon', '2005-06-12', 1, true, -45, ''),
('Boarmon', '2005-06-07', 7, true, 20.4, ''),
('Blossom', '1998-10-13', 3, true, 17, ''),
('Ditto', '2022-05-14', 4, true, 22, '');

SELECT * FROM animals;


START TRANSACTION;
SET SQL_SAFE_UPDATES = 0;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;  -- verify that the change was made
ROLLBACK;
SELECT * FROM animals;  -- verify that the change was rolled back
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM animals;

START TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = '';
COMMIT;
SELECT * FROM animals;
SELECT * FROM animals WHERE species = 'pokemon';

START TRANSACTION;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

START TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp;
UPDATE animals SET weight_kg = -1 * weight_kg;
ROLLBACK TO sp;
UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, AVG(escape_attempts) as avg_escape_attempts
FROM animals
GROUP BY neutered
ORDER BY avg_escape_attempts DESC
LIMIT 1;

SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) as avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


SELECT * FROM animals;

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

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');
-- find owner_ids
SELECT id, full_name FROM owners;
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id)
VALUES 
('Agumon', '2020-02-03', 0, false, 10.23, 2, 1),
('Gabumon', '2018-11-15', 2, true, 8, 2, 2),
('Pikachu', '2021-01-07', 1, false, 15.04, 1, 2),
('Devimon', '2017-05-12', 5, true, 11, 2, 3),
('Charmander', '2020-02-08', 0, false, -11, 1, 4),
('Plantmon', '2021-11-15', 2, true, -5.7, 1, 3),
('Squirtle', '1993-04-02', 3, false, -12.13, 1, 4),
('Angemon', '2005-06-12', 1, true, -45, 2, 5),
('Boarmon', '2005-06-07', 7, true, 20.4, 2, 5),
('Blossom', '1998-10-13', 3, true, 17, 1, 4),
('Ditto', '2022-05-14', 4, true, 22, 1, null);

SELECT * FROM OWNERS;

