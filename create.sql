DROP DATABASE IF EXISTS champs;
CREATE DATABASE champs;
\c champs;

CREATE TABLE pokemon (
    pokemon_id SERIAL PRIMARY KEY,
    pokemon_name TEXT,
    generation_id TEXT,
    evolves_from_species_id INTEGER,
    evolution_chain_id INTEGER,
    color_id INTEGER,
    shape_id INTEGER,
    habitat_id INTEGER,
    gender_rate INTEGER,
    capture_rate INTEGER,
    base_happiness INTEGER,
    is_baby BOOLEAN,
    hatch_counter INTEGER,
    has_gender_differences BOOLEAN,
    growth_rate_id INTEGER,
    forms_switchable BOOLEAN,
    is_legendary BOOLEAN,
    is_mythical BOOLEAN,
    ordering INTEGER,
    conquest_order INTEGER
);

CREATE TABLE rounds (
    round_id SERIAL PRIMARY KEY,
    round_name TEXT
);
CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    round_id INTEGER REFERENCES rounds (round_id)
);
CREATE TABLE match_entries (
    match_entry_id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches (match_id),
    pokemon_id INTEGER REFERENCES pokemon (pokemon_id),
    is_winner BOOLEAN,
    is_from_revival BOOLEAN
);
CREATE TABLE voters (
    voter_id SERIAL PRIMARY KEY,
    voter_name TEXT
);
CREATE TABLE votes (
    vote_id SERIAL PRIMARY KEY,
    voter_id INTEGER REFERENCES voters (voter_id),
    match_entry_id INTEGER REFERENCES match_entries (match_entry_id)
);

\copy pokemon FROM './data/species.csv' DELIMITER ',' CSV HEADER
\copy rounds FROM './data/rounds.csv' DELIMITER ',' CSV HEADER
\copy matches FROM './data/matches.csv' DELIMITER ',' CSV HEADER
\copy match_entries FROM './data/match_entries.csv' DELIMITER ',' CSV HEADER