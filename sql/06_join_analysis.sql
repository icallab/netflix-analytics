-- ==========================================
-- CREATE COUNTRY TABLE
-- ==========================================

CREATE TABLE netflix.netflix_country (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title TEXT,
    country VARCHAR(100)
);

-- ==========================================
-- CREATE GENRE TABLE
-- ==========================================

CREATE TABLE netflix.netflix_genre (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title TEXT,
    listed_in VARCHAR(150)
);


-- ==========================================
-- VALIDATE SUPPORTING TABLES
-- ==========================================

SELECT
    'netflix_titles' AS table_name,
    COUNT(*) AS total_records
FROM netflix.netflix_titles

UNION ALL

SELECT
    'netflix_country',
    COUNT(*)
FROM netflix.netflix_country

UNION ALL

SELECT
    'netflix_genre',
    COUNT(*)
FROM netflix.netflix_genre;


-- ==========================================
-- INNER JOIN: TITLES AND COUNTRIES
-- ==========================================
SELECT
    n.show_id,
    n.title,
    n.type,
    c.country
FROM netflix.netflix_titles n
INNER JOIN netflix.netflix_country c
    ON n.show_id = c.show_id
LIMIT 20;


-- ==========================================
-- LEFT JOIN: TITLES AND COUNTRIES
-- ==========================================

SELECT
    n.show_id,
    n.title,
    n.type,
    c.country
FROM netflix.netflix_titles n
LEFT JOIN netflix.netflix_country c
    ON n.show_id = c.show_id
LIMIT 20;


-- ==========================================
-- CONTENT BY COUNTRY
-- ==========================================

SELECT
    c.country,
    COUNT(DISTINCT n.show_id) AS total_titles
FROM netflix.netflix_titles n
INNER JOIN netflix.netflix_country c
    ON n.show_id = c.show_id
GROUP BY c.country
ORDER BY total_titles DESC
LIMIT 10;


-- ==========================================
-- CONTENT BY GENRE
-- ==========================================

SELECT
    g.listed_in AS genre,
    COUNT(DISTINCT n.show_id) AS total_titles
FROM netflix.netflix_titles n
INNER JOIN netflix.netflix_genre g
    ON n.show_id = g.show_id
GROUP BY g.listed_in
ORDER BY total_titles DESC
LIMIT 10;


-- ==========================================
-- COUNTRY BY CONTENT TYPE
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
-- GENRE BY CONTENT TYPE
-- ==========================================

SELECT
    g.listed_in AS genre,
    n.type,
    COUNT(DISTINCT n.show_id) AS total_titles
FROM netflix.netflix_titles n
INNER JOIN netflix.netflix_genre g
    ON n.show_id = g.show_id
GROUP BY
    g.listed_in,
    n.type
ORDER BY
    g.listed_in,
    total_titles DESC;