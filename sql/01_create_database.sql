CREATE DATABASE netflix_analytics;

CREATE SCHEMA netflix;

CREATE TABLE netflix.netflix_titles (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(20),
    title TEXT,
    director TEXT, 
    "cast" TEXT,
    country TEXT,
    date_added DATE,
    release_year INTEGER,
    rating VARCHAR(20),
    duration VARCHAR(30),
    listed_in TEXT,
    description TEXT,
    duration_minutes INTEGER,
    season_count INTEGER
);
