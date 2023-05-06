CREATE TABLE animals (
    id INT AUTO_INCREMENT,
    name varchar(100),
    date_of_birth date NOT Null,
    escape_attempts integer,
    neutered boolean NOT NULL,
    weight_kg decimal NOT NULL,
    species_id INT,
    owners_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY (owners_id) REFERENCES owners(id)
);


CREATE TABLE species (
    id INT AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE owners (
    id INT AUTO_INCREMENT,
    full_name varchar(100) NOT NULL,
    age int NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE animals ALTER COLUMN species_id INT;

ALTER TABLE animals ADD 

CREATE TABLE vets ( 
    id INT AUTO_INCREMENT,
    name varchar(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id) 
);

CREATE TABLE specialization (
    vets_id INT,
    species_id INT,
    PRIMARY KEY(vets_id,species_id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id)
);

CREATE TABLE visits (
    animals_id INT,
    vets_id INT,
    date_of_visit DATE,
    PRIMARY KEY(animals_id,vets_id,date_of_visit),
    FOREIGN KEY(animals_id) REFERENCES animals(id),
    FOREIGN KEY(vets_id) REFERENCES vets(id)
);