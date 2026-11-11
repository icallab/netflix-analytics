-- ==========================================
-- 1. CONTENT TYPE ANALYSIS
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
-- 2. CONTENT ADDITION TREND
-- =========================================

SELECT
    EXTRACT(YEAR FROM date_added)::INTEGER AS addition_year,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
WHERE date_added IS NOT NULL
GROUP BY addition_year
ORDER BY addition_year;


-- ==========================================
-- 3. TOP 10 COUNTRIES
-- ==========================================

SELECT
    country,
    COUNT(DISTINCT show_id) AS total_titles
FROM netflix.netflix_country
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;


-- ==========================================
-- 4. TOP 10 GENRES
-- ==========================================

SELECT
    listed_in AS genre,
    COUNT(DISTINCT show_id) AS total_titles
FROM netflix.netflix_genre
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 10;


-- ==========================================
-- 5. MOVIE DURATION ANALYSIS
-- ==========================================

SELECT
    CASE
        WHEN duration_minutes < 60 THEN 'Short'
        WHEN duration_minutes <= 120 THEN 'Medium'
        ELSE 'Long'
    END AS duration_category,
    COUNT(*) AS total_movies,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM netflix.netflix_titles
WHERE type = 'Movie'
  AND duration_minutes IS NOT NULL
GROUP BY duration_category
ORDER BY total_movies DESC;


-- ==========================================
-- 6. TV SHOW SEASON ANALYSIS
-- ==========================================

SELECT
    CASE
        WHEN season_count = 1 THEN 'Single Season'
        WHEN season_count BETWEEN 2 AND 3 THEN 'Short Series'
        WHEN season_count BETWEEN 4 AND 6 THEN 'Medium Series'
        ELSE 'Long Series'
    END AS season_category,
    COUNT(*) AS total_shows,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM netflix.netflix_titles
WHERE type = 'TV Show'
  AND season_count IS NOT NULL
GROUP BY season_category
ORDER BY total_shows DESC;


-- ==========================================
-- 7. CONTENT RATING ANALYSIS
-- ==========================================

SELECT
    rating,
    COUNT(*) AS total_titles,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM netflix.netflix_titles
GROUP BY rating
ORDER BY total_titles DESC;


-- ==========================================
-- 8. CONTENT RELEASE YEAR ANALYSIS
-- ==========================================

SELECT
    release_year,
    COUNT(*) AS total_titles
FROM netflix.netflix_titles
GROUP BY release_year
ORDER BY total_titles DESC
LIMIT 10;


-- ==========================================
-- 9. COUNTRY BY CONTENT TYPE
-- ==========================================

SELECT
    c.country,
    n.type,
    COUNT(DISTINCT n.show_id) AS total_titles
FROM netflix.netflix_titles n
INNER JOIN netflix.netflix_country c
    ON n.show_id = c.show_id
GROUP BY
    c.country,
    n.type
ORDER BY
    c.country,
    total_titles DESC;


-- ==========================================
-- 10. GENRE BY CONTENT TYPE
-- ==========================================

WITH genre_analysis AS (
    SELECT
        n.type,
        g.listed_in AS genre,
        COUNT(DISTINCT n.show_id) AS total_titles
    FROM netflix.netflix_titles n
    INNER JOIN netflix.netflix_genre g
        ON n.show_id = g.show_id
    GROUP BY
        n.type,
        g.listed_in
),
ranked_genres AS (
    SELECT
        type,
        genre,
        total_titles,
        DENSE_RANK() OVER (
            PARTITION BY type
            ORDER BY total_titles DESC
        ) AS genre_rank
    FROM genre_analysis
)
SELECT
    type,
    genre,
    total_titles,
    genre_rank
FROM ranked_genres
WHERE genre_rank <= 10
ORDER BY
    type,
    genre_rank;