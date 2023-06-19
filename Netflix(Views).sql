-- Continuance of project with data from the dataset in Netflix(many_to_many).sql file. Practice with creating views for commonly run queries that will be used in analysis.
-- Common multiple join:
SELECT
    title,
    released_year,
    genre,
    rating,
    first_name,
    last_name
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
    JOIN reviewers ON reviews.reviewer_id = reviewers.id;

-- Create a view, which is a query physically stored in memory 
CREATE VIEW full_reviews AS
SELECT
    title,
    released_year,
    genre,
    rating,
    first_name,
    last_name
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
    JOIN reviewers ON reviews.reviewer_id = reviewers.id;

-- using view
SELECT
    genre,
    AVG(rating) AS avg_rating
FROM
    full_reviews
GROUP BY
    genre
ORDER BY
    avg_rating DESC;

-- update view to have ordered data
CREATE
OR REPLACE VIEW full_reviews AS
SELECT
    title,
    released_year,
    genre,
    rating,
    first_name,
    last_name
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
    JOIN reviewers ON reviews.reviewer_id = reviewers.id
ORDER BY
    title;

-- Alternate syntax for updating view
ALTER VIEW full_reviews AS
SELECT
    title,
    released_year,
    genre,
    rating,
    first_name,
    last_name
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
    JOIN reviewers ON reviews.reviewer_id = reviewers.id
ORDER BY
    title DESC;

-- Find shows with more than 1 review
SELECT
    title,
    AVG(rating) AS avg_rating
FROM
    full_reviews
GROUP BY
    title
HAVING
    COUNT(rating) > 1;

-- Get rollup summary stat for count along with review counts for each title
SELECT
    title,
    COUNT(rating) AS count_reviews
FROM
    full_reviews
GROUP BY
    title WITH ROLLUP;

-- Get average ratings by year, genre, and reviewer
SELECT
    first_name,
    released_year,
    genre,
    AVG(rating)
FROM
    full_reviews
GROUP BY
    released_year,
    genre,
    first_name WITH ROLLUP;

-- drop the view
DROP VIEW full_reviews;