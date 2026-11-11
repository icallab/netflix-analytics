-- ==========================================
-- VIEW ALL DATA
-- ==========================================

SELECT *
FROM netflix.netflix_titles;

-- ==========================================
-- SELECT SPECIFIC COLUMNS
-- ==========================================

SELECT
    show_id,
    title,
    type,
    release_year,
    rating,
    duration
FROM netflix.netflix_titles
LIMIT 20;


-- ==========================================
-- FILTER MOVIES
-- ==========================================

SELECT
    title,
    release_year,
    rating,
    duration
FROM netflix.netflix_titles
WHERE type = 'Movie'
ORDER BY release_year DESC
LIMIT 20;


-- ==========================================
-- FILTER TV SHOWS
-- ==========================================

SELECT
    title,
    release_year,
    rating,
    duration
FROM netflix.netflix_titles
WHERE type = 'TV Show'
ORDER BY release_year DESC
LIMIT 20;


-- ==========================================
-- FILTER RELEASE YEAR
-- ==========================================

SELECT
    title,
    type,
    release_year
FROM netflix.netflix_titles
WHERE release_year >= 2020
ORDER BY release_year DESC;


-- ==========================================
-- FILTER CONTENT RATING
-- ==========================================

SELECT
    title,
    type,
    rating
FROM netflix.netflix_titles
WHERE rating = 'TV-MA'
ORDER BY title;


-- ==========================================
-- DISTINCT RATINGS
-- ==========================================

SELECT DISTINCT
    rating
FROM netflix.netflix_titles
ORDER BY rating;


-- ==========================================
-- SEARCH TITLE
-- ==========================================

SELECT
    title,
    type,
    release_year
FROM netflix.netflix_titles
WHERE title ILIKE '%Love%'
ORDER BY release_year DESC;