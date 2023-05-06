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
