-- Active: 1748083052040@@127.0.0.1@5432@conservation_db

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
SELECT common_name,sighting_time,"name" FROM sightings JOIN rangers ON sightings.ranger_id=rangers.ranger_id
                        JOIN species ON sightings.species_id=species.species_id
                        ORDER BY sighting_time DESC LIMIT 2;
--Problem 7
UPDATE species SET conservation_status='Historic' WHERE DATE(discovery_date)<'1800-01-01 ';

--Problem 8 
ALTER TABLE sightings
ADD COLUMN  time_of_day VARCHAR(50);
UPDATE sightings SET time_of_day=Case 
   WHEN extract(HOUR FROM sighting_time) <12 THEN 'Morning'
   WHEN extract(HOUR FROM sighting_time) >=12 AND extract(HOUR FROM sighting_time) <=17 THEN 'Afternoon'
   ELSE 'Evening'
   END;

--Problem 9
DELETE FROM rangers WHERE ranger_id in (SELECT rangers.ranger_id FROM  rangers LEFT JOIN sightings ON rangers.ranger_id=sightings.ranger_id WHERE sighting_id is NULL )