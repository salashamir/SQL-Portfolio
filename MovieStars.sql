-- Project completed as part of Khan Academy's SQL course.
-- Created three tables relating data about actors/actresses including information about their age, marital status, movies they've starred in, genres
-- created a join table to join actors and movies since there's a many to many relationship
-- Then used a join to display information aggregated from both tables

CREATE TABLE actors
(id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
age INTEGER NOT NULL,
marital_status TEXT NOT NULL,
height_cm NUMERIC, 
birthplace_city TEXT NOT NULL,
birthplace_state TEXT NOT NULL,
birthplace_country TEXT NOT NULL);

INSERT INTO actors (first_name, last_name, age, marital_status, height_cm, birthplace_city, birthplace_state) 
VALUES
    ("Brad", "Pitt", 59, "divorced", 180, "Shawnee", "OK", "United States"),
    ("Florence", "Pugh", 27, "unmarried", 162.56, "Oxford", null, "United Kingdom"),
    ("Leonardo", "DiCaprio", 48, "unmarried", 180, "Los Angeles", "CA", "United States"),
    ("Ryan", "Gosling", 42, "unmarried", 180, "London", null, "Canada"),
    ("Margot", "Robbie", 32, "married", 167, "Dalby", null, "Australia"),
    ("Joaquin", "Phoenix", 48, "unmarried", 167, "Rio Piedras", "Puerto Rico", "United States"),
    ("Timothee", "Chalamet", 27, "unmarried", 167, "Manhattan", "NY", "United States"),
    ("Scarlett","Johansson", 38, "married", 160, "Manhattan", "NY", "United States"),
    ("Robert","De Niro", 79, "divorced", 175, "Manhattan", "NY", "United States"),
    ("Steve","Carell", 60, "married", 175, "Concord", "MA", "United States");

CREATE TABLE films
(id INTEGER PRIMARY KEY AUTOINCREMENT,
title TEXT NOT NULL,
running_time INTEGER NOT NULL,
mpaa_rating TEXT NOT NULL,
genre TEXT NOT NULL,
release_year INTEGER NOT NULL);

INSERT INTO films (title, running_time, mpaa_rating, genre, release_year) 
VALUES
    ("Ad Astra", 124, "PG-13", "science fiction", 2019),
    ("Once Upon a Time in Hollywood", 160, "R", "drama", 2019),
    ("The Revenant", 156, "R", "drama", 2015),
    ("Barbie", 100, "PG-13", "fantasy", 2023),
    ("The Wolf of Wall Street", 180, "R", "drama", 2013),
    ("Joker", 122, "R", "thriller", 2019),
    ("Her", 120, "R", "romance", 2013),
    ("Black Widow", 133, "PG-13", "superhero", 2021),
    ("Killers of the Flower Moon", 206, "R", "drama", 2023),
    ("Dune: Part Two", 150, "PG-13", "science fiction", 2023),
    ("Asteroid City", 105, "R", "comedy", 2023),
    ("Beautiful Boy", 120, "R", "drama", 2018),
    ("The Big Short", 130, "R", "comedy", 2015);

CREATE TABLE roles
(id INTEGER PRIMARY KEY AUTOINCREMENT,
actor_id INTEGER NOT NULL, 
movie_id INTEGER NOT NULL);

INSERT INTO roles (actor_id, movie_id)
VALUES
-- brad pitt
    (1, 1),
    (1, 2),
    (1, 13),
-- florence pugh
    (2, 8),
    (2, 10),
-- leonardo dicaprio
    (3, 2),
    (3, 3),
    (3, 5),
    (3, 9),
-- ryan gosling
    (4, 4),
    (4, 13),
-- margot robbie
    (5, 2),
    (5, 4),
    (5, 5),
    (5, 11),
-- joaquin phoenix
    (6, 6),
    (6, 7),
-- timothee chalamet
    (7, 10),
    (7, 12),
-- scarlett johansoon
    (8, 7),
    (8, 8),
    (8, 11),
-- robert de niro
    (9, 6),
    (9, 9),
-- steve carell
    (10, 11),
    (10, 12),
    (10, 13);

-- Find all the actors and their roles. Create fullname column from concatenating their individual column first name and last name. Basically a double join using a through table that only holds foreign keys. 
SELECT CONCAT(actors.first_name, " ", actors.last_name) AS fullname, films.title, films.release_year FROM actors JOIN roles ON actors.id = roles.actor_id JOIN films ON films.id = roles.movie_id;

-- Find how many roles actors have and sort by count in descending order
SELECT actors.first_name, actors.last_name, COUNT(*) AS no_of_roles FROM actors JOIN roles ON actors.id = roles.actor_id GROUP BY actors.first_name, actors.last_name ORDER BY no_of_roles DESC;

-- Find how many diff genres each actor has had film roles across and sort by count desc
SELECT actors.first_name, actors.last_name, COUNT(DISTINCT films.genre) AS no_of_genres FROM actors JOIN roles ON actors.id = roles.actor_id JOIN films ON roles.movie_id = films.id GROUP BY actors.first_name, actors.last_name ORDER BY no_of_genres DESC;







