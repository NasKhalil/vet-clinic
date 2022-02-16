/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals where animal_name LIKE '%mon';

SELECT animal_name FROM animals WHERE date_of_birth >= '2016/01/01' AND date_of_birth <= '2019/12/31';

SELECT animal_name FROM animals WHERE neutered = 'true' AND escape_attempts < '3';

SELECT date_of_birth FROM animals WHERE animal_name IN ('Agumon', 'Pikachu') ;

SELECT animal_name, escape_attempts FROM animals WHERE weight_per_kg > 10.5; 

SELECT * FROM animals WHERE neutered = 'true';

SELECT * FROM animals WHERE animal_name != 'Gabumon';

SELECT * FROM animals WHERE weight_per_kg >= '10.4' AND weight_per_kg <= '17.3';

/* Transaction Update 1 */
UPDATE animals SET species = 'Unspecified'
ROLLBACK;
SELECT * FROM animals;

/* Transaction Update 2 set species name to 'digimon' */
SELECT * FROM animals;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

/* Delete all records then rollback */
BEGIN;
DELETE * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Transaction Update 3 update animals weight, create savepoint, change negative values for kg */
BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SAVEPOINT dateOfBirth;
UPDATE animals SET weight_per_kg=-1*weight_per_kg;
ROLLBACK TO dateOfBirth;
UPDATE animals SET weight_per_kg=-1*weight_per_kg WHERE weight_per_kg<0;
COMMIT;
SELECT * FROM animals; 

/* Write final queries for database*/

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_per_kg) FROM animals;
SELECT neutered, count(neutered) as result FROM animals GROUP BY neutered ORDER BY result DESC LIMIT 1;
SELECT species, MAX(weight_per_kg) AS max_weight, MIN(weight_per_kg) AS min_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;