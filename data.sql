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

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES
(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'),
(3, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(6, 2, '2019-12-21'),
(6, 1, '2020-08-10'),
(6, 2, '2021-04-07'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');
