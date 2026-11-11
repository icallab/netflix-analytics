-- ==========================================
-- ROW_NUMBER: COUNTRY RANKING
-- ==========================================

WITH country_summary AS (
    SELECT
        country,
        COUNT(DISTINCT show_id) AS total_titles
    FROM netflix.netflix_country
    GROUP BY country
)
SELECT
    country,
    total_titles,
    ROW_NUMBER() OVER (
        ORDER BY total_titles DESC
    ) AS row_num
FROM country_summary
ORDER BY row_num;


-- ==========================================
-- RANK: GENRE RANKING
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
    total_titles,
    RANK() OVER (
        ORDER BY total_titles DESC
    ) AS genre_rank
FROM genre_summary
ORDER BY genre_rank;


-- ==========================================
-- DENSE_RANK: RELEASE YEAR RANKING
-- ==========================================

WITH yearly_content AS (
    SELECT
        release_year,
        COUNT(*) AS total_titles
    FROM netflix.netflix_titles
    GROUP BY release_year
)
SELECT
    release_year,
    total_titles,
    DENSE_RANK() OVER (
        ORDER BY total_titles DESC
    ) AS year_rank
FROM yearly_content
ORDER BY year_rank, release_year DESC;


-- ==========================================
-- 4. LAG: YEAR-OVER-YEAR ANALYSIS
-- ==========================================

WITH yearly_content AS (
    SELECT
        EXTRACT(YEAR FROM date_added)::INTEGER AS addition_year,
        COUNT(*) AS total_titles
    FROM netflix.netflix_titles
    WHERE date_added IS NOT NULL
    GROUP BY EXTRACT(YEAR FROM date_added)
),
yearly_comparison AS (
    SELECT
        addition_year,
        total_titles,
        LAG(total_titles) OVER (
            ORDER BY addition_year
        ) AS previous_year_titles
    FROM yearly_content
)
SELECT
    addition_year,
    total_titles,
    previous_year_titles,
    total_titles - previous_year_titles AS difference,
    ROUND(
        (total_titles - previous_year_titles) * 100.0 /
        NULLIF(previous_year_titles, 0),
        2
    ) AS growth_percentage
FROM yearly_comparison
ORDER BY addition_year;


-- ==========================================
-- 5. LEAD: NEXT YEAR COMPARISON
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
    total_titles,
    LEAD(total_titles) OVER (
        ORDER BY addition_year
    ) AS next_year_titles
FROM yearly_content
ORDER BY addition_year;


-- ==========================================
-- 6. PERCENT_RANK: MOVIE DURATION
-- ==========================================

SELECT
    title,
    duration_minutes,
    ROUND(
        (
            PERCENT_RANK() OVER (
                ORDER BY duration_minutes
            )
        )::NUMERIC,
        4
    ) AS duration_percent_rank
FROM netflix.netflix_titles
WHERE type = 'Movie'
  AND duration_minutes IS NOT NULL
ORDER BY duration_percent_rank DESC
LIMIT 20;


-- ==========================================
-- 7. PARTITION BY: GENRE RANKING BY TYPE
-- ==========================================

WITH genre_summary AS (
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
)
SELECT
    type,
    genre,
    total_titles,
    DENSE_RANK() OVER (
        PARTITION BY type
        ORDER BY total_titles DESC
    ) AS genre_rank
FROM genre_summary
ORDER BY
    type,
    genre_rank;