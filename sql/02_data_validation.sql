-- ==========================================
-- TOTAL RECORDS
-- ==========================================

SELECT
    COUNT(*) AS total_records
FROM netflix.netflix_titles;


-- ==========================================
-- DUPLICATE SHOW ID
-- ==========================================

SELECT
    show_id,
    COUNT(*) AS total_duplicate
FROM netflix.netflix_titles
GROUP BY show_id
HAVING COUNT(*) > 1;


-- ==========================================
-- MISSING VALUES
-- ==========================================

SELECT
    COUNT(*) FILTER (WHERE show_id IS NULL) AS missing_show_id,
    COUNT(*) FILTER (WHERE type IS NULL) AS missing_type,
    COUNT(*) FILTER (WHERE title IS NULL) AS missing_title,
    COUNT(*) FILTER (WHERE director IS NULL) AS missing_director,
    COUNT(*) FILTER (WHERE "cast" IS NULL) AS missing_cast,
    COUNT(*) FILTER (WHERE country IS NULL) AS missing_country,
    COUNT(*) FILTER (WHERE date_added IS NULL) AS missing_date_added,
    COUNT(*) FILTER (WHERE release_year IS NULL) AS missing_release_year,
    COUNT(*) FILTER (WHERE rating IS NULL) AS missing_rating,
    COUNT(*) FILTER (WHERE duration IS NULL) AS missing_duration,
    COUNT(*) FILTER (WHERE listed_in IS NULL) AS missing_genre,
    COUNT(*) FILTER (WHERE description IS NULL) AS missing_description
FROM netflix.netflix_titles;


-- ==========================================
-- CONTENT TYPE VALIDATION
-- ==========================================

SELECT
    type,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
GROUP BY type
ORDER BY total_titles DESC;


-- ==========================================
-- RELEASE YEAR VALIDATION
-- ==========================================

SELECT
    MIN(release_year) AS earliest_release_year,
    MAX(release_year) AS latest_release_year,
    COUNT(*) FILTER (
        WHERE release_year IS NULL
    ) AS missing_release_year
FROM netflix.netflix_titles;


-- ==========================================
-- DURATION VALIDATION
-- ==========================================

SELECT
    type,
    COUNT(*) AS total_titles,
    COUNT(duration_minutes) AS valid_movie_duration,
    COUNT(season_count) AS valid_tv_seasons
FROM netflix.netflix_titles
GROUP BY type
ORDER BY type;


-- ==========================================
-- FINAL DATA PREVIEW
-- ==========================================

SELECT *
FROM netflix.netflix_titles
LIMIT 10;