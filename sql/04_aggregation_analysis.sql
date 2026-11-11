-- ==========================================
-- CONTENT DISTRIBUTION
-- ==========================================

SELECT
    type,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
GROUP BY type
ORDER BY total_titles DESC;


-- ==========================================
-- CONTENT TYPE PERCENTAGE
-- ==========================================

SELECT
    type,
    COUNT(*) AS total_titles,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM netflix.netflix_titles
GROUP BY type
ORDER BY total_titles DESC;


-- ==========================================
-- CONTENT BY RELEASE YEAR
-- ==========================================

SELECT
    release_year,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
GROUP BY release_year
ORDER BY total_titles DESC
LIMIT 10;


-- ==========================================
-- CONTENT ADDITION TREND
-- ==========================================

SELECT
    EXTRACT(YEAR FROM date_added)::INTEGER AS added_year,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
WHERE date_added IS NOT NULL
GROUP BY EXTRACT(YEAR FROM date_added)
ORDER BY added_year;


-- ==========================================
-- TOP CONTENT RATINGS
-- ==========================================

SELECT
    rating,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
GROUP BY rating
ORDER BY total_titles DESC
LIMIT 10;


-- ==========================================
-- AVERAGE MOVIE DURATION
-- ==========================================

SELECT
    ROUND(AVG(duration_minutes), 2) AS avg_movie_duration,
    MIN(duration_minutes) AS shortest_movie,
    MAX(duration_minutes) AS longest_movie
FROM netflix.netflix_titles
WHERE type = 'Movie';


-- ==========================================
-- AVERAGE TV SHOW SEASONS
-- ==========================================

SELECT
    ROUND(AVG(season_count), 2) AS avg_seasons,
    MIN(season_count) AS min_seasons,
    MAX(season_count) AS max_seasons
FROM netflix.netflix_titles
WHERE type = 'TV Show';


-- ==========================================
-- CONTENT ADDITION BY YEAR AND TYPE
-- ==========================================

SELECT
    EXTRACT(YEAR FROM date_added)::INTEGER AS added_year,
    type,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
WHERE date_added IS NOT NULL
GROUP BY
    EXTRACT(YEAR FROM date_added),
    type
ORDER BY
    added_year,
    type;