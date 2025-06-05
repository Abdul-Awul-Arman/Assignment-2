-- Active: 1748083052040@@127.0.0.1@5432@conservation_db

CREATE DATABASE conservation_db;

CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

CREATE Table species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);


CREATE Table sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER NULL REFERENCES rangers(ranger_id) ON DELETE SET NULL,
    species_id INTEGER NULL REFERENCES species(species_id) ON DELETE SET NULL,
    sighting_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    location VARCHAR(50) NOT NULL,
    notes TEXT 
);

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;

INSERT INTO rangers (ranger_id, name, region)
VALUES 
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes)
VALUES
(1, 1, 'Peak Ridge',        '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area',     '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass',     '2024-05-18 18:30:00', NULL);



--Problem 1
INSERT INTO rangers (ranger_id, name, region)
VALUES(4,'Derek Fox','Coastal Plains')

--Problem 2
SELECT count(DISTINCT species_id)as  unique_species_count FROM sightings;

--Problem 3
SELECT * FROM sightings WHERE location LIKE('%Pass%')

--Problem 4
SELECT rangers.name,count(rangers.name) as total_sightings FROM sightings JOIN rangers ON sightings.ranger_id=rangers.ranger_id GROUP BY rangers.name;



--Problem 5
SELECT common_name FROM species  LEFT JOIN sightings ON species.species_id=sightings.species_id
WHERE sightings.sighting_id is NULL;

--Problem 6
SELECT sighting_time FROM sightings ORDER BY sighting_time DESC LIMIT 2;

--Problem 7
UPDATE species SET conservation_status='Historic' WHERE DATE(discovery_date)<'1800-01-01 ';

--Problem 8 
ALTER TABLE sightings
ADD COLUMN  time_of_day VARCHAR(50);
SELECT *,extract(HOUR from sighting_time)as "hour" FROM sightings;

UPDATE sightings SET time_of_day=Case 
   WHEN extract(HOUR FROM sighting_time) <12 THEN 'Morning'
   WHEN extract(HOUR FROM sighting_time) >=12 AND extract(HOUR FROM sighting_time) <=17 THEN 'Afternoon'
   ELSE 'Evening'
   END;