-- ==========================================
-- TOP 10 COUNTRIES USING CTE
-- ==========================================

WITH country_summary AS (
    SELECT
        c.country,
        COUNT(DISTINCT c.show_id) AS total_titles
    FROM netflix.netflix_country c
    GROUP BY c.country
)
SELECT
    country,
    total_titles
FROM country_summary
ORDER BY total_titles DESC
LIMIT 10;


-- ==========================================
-- TOP 10 GENRES USING CTE
-- ==========================================

WITH genre_summary AS (
    SELECT
        listed_in AS genre,
        COUNT(DISTINCT show_id) AS total_titles
    FROM netflix.netflix_genre
    GROUP BY listed_in
)
SELECT
    genre,
    total_titles
FROM genre_summary
ORDER BY total_titles DESC
LIMIT 10;


-- ==========================================
-- CONTENT DISTRIBUTION USING CTE
-- ==========================================

WITH content_summary AS (
    SELECT
        type,
        COUNT(*) AS total_titles
    FROM netflix.netflix_titles
    GROUP BY type
)
SELECT
    type,
    total_titles,
    ROUND(
        total_titles * 100.0 /
        SUM(total_titles) OVER (),
        2
    ) AS percentage
FROM content_summary
ORDER BY total_titles DESC;


-- ==========================================
-- MOVIE DURATION CATEGORY USING CTE
-- ==========================================

WITH movie_category AS (
    SELECT
        show_id,
        title,
        duration_minutes,
        CASE
            WHEN duration_minutes < 60 THEN 'Short'
            WHEN duration_minutes <= 120 THEN 'Medium'
            ELSE 'Long'
        END AS duration_category
    FROM netflix.netflix_titles
    WHERE type = 'Movie'
      AND duration_minutes IS NOT NULL
)
SELECT
    duration_category,
    COUNT(*) AS total_movies,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM movie_category
GROUP BY duration_category
ORDER BY total_movies DESC;


-- ==========================================
-- TV SHOW SEASON CATEGORY USING CTE
-- ==========================================

WITH tv_category AS (
    SELECT
        show_id,
        title,
        season_count,
        CASE
            WHEN season_count = 1 THEN 'Single Season'
            WHEN season_count BETWEEN 2 AND 3 THEN 'Short Series'
            WHEN season_count BETWEEN 4 AND 6 THEN 'Medium Series'
            ELSE 'Long Series'
        END AS season_category
    FROM netflix.netflix_titles
    WHERE type = 'TV Show'
      AND season_count IS NOT NULL
)
SELECT
    season_category,
    COUNT(*) AS total_shows,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM tv_category
GROUP BY season_category
ORDER BY total_shows DESC;


-- ==========================================
-- CONTENT ADDITION TREND USING CTE
-- ==========================================

WITH yearly_content AS (
    SELECT
        EXTRACT(YEAR FROM date_added)::INTEGER AS addition_year,
        COUNT(*) AS total_titles
    FROM netflix.netflix_titles
    WHERE date_added IS NOT NULL
    GROUP BY EXTRACT(YEAR FROM date_added)
)
SELECT
    addition_year,
    total_titles
FROM yearly_content
ORDER BY addition_year;


-- ==========================================
-- COUNTRY CONTRIBUTION BY CONTENT TYPE
-- ==========================================

WITH country_type AS (
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
)
SELECT
    country,
    type,
    total_titles
FROM country_type
ORDER BY
    country,
    total_titles DESC;