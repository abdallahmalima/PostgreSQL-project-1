/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

-- Create owners table
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INT  
);

-- Create the species table
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

--- Modify the animals table
ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INT,
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id),
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);
