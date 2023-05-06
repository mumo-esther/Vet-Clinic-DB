INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES('Agumon','2020-02-03',10.23,'true',0),
             ('Gabumon','2018-11-15',8,'true',2),
             ('Pikachu','2021-01-7',15.04,'false',1),
              ('Devimon','2017-05-12',11,'true',5);


INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts,species) VALUES('Charmander','2020-02-08',11,'false',0,''),
('Plantmon','2018-11-15',-5.7,'true',2,''),
('Squirtle','1993-04-02',-12.13,'false',3,''),
('Angemon','2005-06-12',-45,'true',1,''),
('Boarmon','2005-06-7',20.4,'true',7,''),
('Blossom','1998-10-13',17,'true',3,''),
('Ditto','2022-05-14',22,'true',4,'');


INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34),
('Jennifer Orwell', 19);
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jordi Whittaker', 38);

INSERT INTO species(name) VALUES('pokemon'),
('digimon');

INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES('Charmander','2020-02-08',11,'false',0),
('Plantmon','2018-11-15',-5.7,'true',2),
('Squirtle','1993-04-02',-12.13,'false',3),
('Angemon','2005-06-12',-45,'true',1),
('Boarmon','2005-06-7',20.4,'true',7),
('Blossom','1998-10-13',17,'true',3),
('Ditto','2022-05-14',22,'true',4);

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET species_id = 1 WHERE species_id IS NULL


/* ====== Modifying inserted animals to include owner information (owner_id): */
-- 1) Sam Smith owns Agumon
UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';

--2) Jennifer Orwell owns Gabumon and Pikachu
UPDATE animals SET owners_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';

--3) Bob owns Devimon and Plantmon
UPDATE animals SET owners_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

--4) Melody Pond owns Charmander, Squirtle, and Blossom
UPDATE animals SET owners_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

--5) Dean Winchester owns Angemon and Boarmon
UPDATE animals SET owners_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation )
    VALUES 
        ('William Tatcher', 45, '2000-04-23'),
        ('Maisy Smith', 26, '2019-01-17'),
        ('Stephanie Mendez', 64, '1981-05-04'),
        ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specialization (vets_id, species_id ) 
    VALUES 
        ( 1, 1),
        ( 3, 1),
        ( 3, 2),
        ( 4, 2);

INSERT INTO visits (animals_id, vets_id, date_of_visit ) 
    VALUES 
        ( 8, 1, '2020-05-24'),
        ( 8, 3, '2020-07-22'),
        ( 9, 4, '2021-02-02'),
        ( 10, 2, '2020-01-05'),
        ( 10, 2, '2020-03-08'),
        ( 10, 2, '2020-05-14'),
        ( 11, 3, '2021-05-04'),
        ( 1, 4, '2021-02-24'),
        ( 2, 2, '2019-12-21'),
        ( 2, 1, '2020-08-10'),
        ( 2, 2, '2021-04-07'),
        ( 3, 3, '2019-09-29'),
        ( 4, 4, '2020-10-03'),
        ( 4, 4, '2020-11-04'),
        ( 5, 2, '2019-01-24'),
        ( 5, 2, '2019-05-15'),
        ( 5, 2, '2020-02-27'),
        ( 5, 2, '2020-08-03'),
        ( 6, 3, '2020-05-24'),
        ( 6, 1, '2021-01-11');        