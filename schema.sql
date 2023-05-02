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

