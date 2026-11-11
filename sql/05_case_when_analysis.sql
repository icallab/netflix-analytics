-- ==========================================
-- MOVIE DURATION CATEGORIZATION
-- ==========================================

SELECT
    title,
    duration_minutes,
    CASE
        WHEN duration_minutes < 60 THEN 'Short Movie'
        WHEN duration_minutes BETWEEN 60 AND 120 THEN 'Medium Movie'
        WHEN duration_minutes > 120 THEN 'Long Movie'
        ELSE 'Unknown'
    END AS duration_category
FROM netflix.netflix_titles
WHERE type = 'Movie'
ORDER BY duration_minutes;


-- ==========================================
-- MOVIE DURATION DISTRIBUTION
-- ==========================================

SELECT
    CASE
        WHEN duration_minutes < 60 THEN 'Short Movie'
        WHEN duration_minutes BETWEEN 60 AND 120 THEN 'Medium Movie'
        WHEN duration_minutes > 120 THEN 'Long Movie'
        ELSE 'Unknown'
    END AS duration_category,
    COUNT(*) AS total_movies
FROM netflix.netflix_titles
WHERE type = 'Movie'
GROUP BY duration_category
ORDER BY total_movies DESC;


-- ==========================================
-- TV SHOW SEASON CATEGORIZATION
-- ==========================================

SELECT
    title,
    season_count,
    CASE
        WHEN season_count = 1 THEN 'Single Season'
        WHEN season_count BETWEEN 2 AND 3 THEN 'Short Series'
        WHEN season_count BETWEEN 4 AND 6 THEN 'Medium Series'
        WHEN season_count > 6 THEN 'Long Series'
        ELSE 'Unknown'
    END AS season_category
FROM netflix.netflix_titles
WHERE type = 'TV Show'
ORDER BY season_count DESC;


-- ==========================================
-- TV SHOW SEASON DISTRIBUTION
-- ==========================================

SELECT
    CASE
        WHEN season_count = 1 THEN 'Single Season'
        WHEN season_count BETWEEN 2 AND 3 THEN 'Short Series'
        WHEN season_count BETWEEN 4 AND 6 THEN 'Medium Series'
        WHEN season_count > 6 THEN 'Long Series'
        ELSE 'Unknown'
    END AS season_category,
    COUNT(*) AS total_shows
FROM netflix.netflix_titles
WHERE type = 'TV Show'
GROUP BY season_category
ORDER BY total_shows DESC;


-- ==========================================
-- RELEASE YEAR CATEGORIZATION
-- ==========================================

SELECT
    title,
    type,
    release_year,
    CASE
        WHEN release_year < 2000 THEN 'Classic'
        WHEN release_year BETWEEN 2000 AND 2009 THEN 'Early 2000s'
        WHEN release_year BETWEEN 2010 AND 2019 THEN '2010s'
        WHEN release_year >= 2020 THEN 'Recent'
        ELSE 'Unknown'
    END AS release_period
FROM netflix.netflix_titles
ORDER BY release_year DESC;


-- ==========================================
-- RELEASE PERIOD DISTRIBUTION
-- ==========================================

SELECT
    CASE
        WHEN release_year < 2000 THEN 'Classic'
        WHEN release_year BETWEEN 2000 AND 2009 THEN 'Early 2000s'
        WHEN release_year BETWEEN 2010 AND 2019 THEN '2010s'
        WHEN release_year >= 2020 THEN 'Recent'
        ELSE 'Unknown'
    END AS release_period,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
GROUP BY release_period
ORDER BY total_titles DESC;


-- ==========================================
-- RELEASE PERIOD DISTRIBUTION
-- ==========================================

SELECT
    CASE
        WHEN release_year < 2000 THEN 'Classic'
        WHEN release_year BETWEEN 2000 AND 2009 THEN 'Early 2000s'
        WHEN release_year BETWEEN 2010 AND 2019 THEN '2010s'
        WHEN release_year >= 2020 THEN 'Recent'
        ELSE 'Unknown'
    END AS release_period,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
GROUP BY release_period
ORDER BY total_titles DESC;


-- ==========================================
-- 6.7 CONTENT RATING CATEGORIZATION
-- ==========================================

SELECT
    rating,
    CASE
        WHEN rating IN ('G', 'TV-Y', 'TV-G') 
            THEN 'General Audience'
        WHEN rating IN ('PG', 'TV-PG', 'TV-Y7', 'TV-Y7-FV')
            THEN 'Parental Guidance'
        WHEN rating IN ('PG-13', 'TV-14')
            THEN 'Teen Audience'
        WHEN rating IN ('R', 'NC-17', 'TV-MA')
            THEN 'Mature Audience'
        ELSE 'Other / Unclassified'
    END AS audience_category,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
GROUP BY rating, audience_category
ORDER BY total_titles DESC;