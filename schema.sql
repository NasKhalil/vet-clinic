/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer PRIMARY KEY NOT NULL UNIQUE,
    animal_name varchar(100),
    date_of_birth date NOT NULL,
    escape_attempts integer,
    neutered boolean NOT NULL,
    weight_per_kg decimal NOT NULL
);

/* update table, add new column "species" */

ALTER TABLE animals ADD COLUMN species varchar(50);

/* Create owners table */
CREATE TABLE owners (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 full_name VARCHAR(50),
 age INT
);

/* Create species table */
CREATE TABLE species (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR(50)
);

-- Alter Animals Table
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_name FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_name2 FOREIGN KEY(owner_id) REFERENCES owners(id);


/* Create Vets Table */
CREATE TABLE vets(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR(50),
 age INT,
 date_of_graduation DATE
);

/* Create Specializations Table */
CREATE TABLE specializations (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 vets_id INT,
 species_id INT,
 CONSTRAINT vet_fk FOREIGN KEY(vets_id) REFERENCES vets(id),
 CONSTRAINT species_fk FOREIGN KEY(species_id) REFERENCES species(id)
);

--  Create Visits Table
CREATE TABLE visits (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 animals_id INT,
 vets_id INT,
 date_of_visit DATE,
 CONSTRAINT vet_fk FOREIGN KEY(vets_id) REFERENCES vets(id),
 CONSTRAINT animals_fk FOREIGN KEY(animals_id) REFERENCES animals(id)
);

/* Add an email column to your owners table */

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
