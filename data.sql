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





User
Write queries to answer the following:
Who was the last animal seen by William Tatcher?
How many different animals did Stephanie Mendez see?
List all vets and their specialties, including vets with no specialties.
List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
What animal has the most visits to vets?
Who was Maisy Smith's first visit?
Details for most recent visit: animal information, vet information, and date of visit.
How many visits were with a vet that did not specialize in that animal's species?
What specialty should Maisy Smith consider getting? Look for the species she gets the most.
ChatGPT
To answer these questions, we can use the following queries:

Who was the last animal seen by William Tatcher?
vbnet
Copy code
SELECT animals.name
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;
This query joins the animals, visits, and vets tables, and filters by visits made by William Tatcher. It orders the results by the date of visit in descending order, so that the most recent visit comes first, and limits the output to the first row, which is the most recent visit. Finally, it selects the name of the animal seen during that visit.

How many different animals did Stephanie Mendez see?
sql
Copy code
SELECT COUNT(DISTINCT visits.animal_id)
FROM visits
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';
This query joins the visits and vets tables, filters by visits made by Stephanie Mendez, and uses the COUNT DISTINCT function to count the number of unique animal IDs in the resulting set.

List all vets and their specialties, including vets with no specialties.
vbnet
Copy code
SELECT vets.name, specialties.name
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id
ORDER BY vets.name, specialties.name;
This query left joins the vets table with the specializations and species tables to include vets with no specialties. It selects the name of each vet and their corresponding specialty name, if applicable, and orders the results alphabetically by vet name and then by specialty name.

List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
sql
Copy code
SELECT animals.name
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
This query joins the animals, visits, and vets tables, and filters by visits made by Stephanie Mendez between April 1st and August 30th, 2020. It selects the name of the animal seen during each visit.

What animal has the most visits to vets?
vbnet
Copy code
SELECT animals.name, COUNT(visits.id) AS num_visits
FROM animals
JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.id
ORDER BY num_visits DESC
LIMIT 1;

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES 
(1, 1), 
(3, 1), 
(3, 2), 
(4, 2);


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