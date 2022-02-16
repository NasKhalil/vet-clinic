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