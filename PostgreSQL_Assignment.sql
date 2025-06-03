-- Active: 1748083052040@@127.0.0.1@5432@conservation_db@public
-- | Table Name  | What It Stores                                                                |
-- | ----------- | ----------------------------------------------------------------------------- |
-- | `rangers`   | Information about rangers like Meera (name, contact, zone)                    |
-- | `species`   | Info about different animals (name, scientific name, how endangered they are) |
-- | `sightings` | Records of when and where each animal was seen                                |

CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

CREATE Table species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_nama VARCHAR(50) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL,
);


CREATE Table sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id NUMERIC REFERENCES rangers(ranger_id) ON DELETE SET NULL,
)