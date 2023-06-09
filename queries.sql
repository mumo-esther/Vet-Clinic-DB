/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

START TRANSACTION;
SET SQL_SAFE_UPDATES = 0;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;  -- verify that the change was made
ROLLBACK;
SELECT * FROM animals;  -- verify that the change was rolled back
SET SQL_SAFE_UPDATES = 0;


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

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT name
FROM animals
WHERE species_id = 1;

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT name, COUNT(*) as count
FROM animals
GROUP BY name;
SELECT * FROM species;

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' AND animals.species_id = 2;

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
LEFT JOIN escapes ON animals.id = escapes.animal_id
WHERE owners.name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(*) as count
FROM owners
JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY count DESC
LIMIT 1;

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
SELECT * FROM OWNERS;

