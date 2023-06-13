CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- Transform name columns into one column w their full name
SELECT CONCAT(author_fname, " ", author_lname) AS full_name FROM books;

-- Get strings of book titles and author names with hyphen delimiter 
SELECT CONCAT_WS('-', title, author_fname, author_lname) AS book_info FROM books;

-- Get shortened titles
SELECT CONCAT(SUBSTRING(title, 1, 9), "...") AS shortened_title FROM books;

-- Get initials column
SELECT CONCAT(SUBSTRING(author_fname, 1, 1), ".", SUBSTRING(author_lname, 1, 1), ".") AS author_initials FROM books;

-- Get author's full name with spaces replaced by hyphens and concatenate it with reversed title
SELECT CONCAT_WS("_", REPLACE(CONCAT(author_fname, " ", author_lname), " ", "-"), REVERSE(REPLACE(title, " ", "_"))) AS replace_reversed_info FROM books;

-- Select last names and their lengths
SELECT author_lname, CHAR_LENGTH(author_lname) AS lname_length FROM books;

-- Get a string describing length of title
SELECT CONCAT(title, " is ", CHARLENGTH(title), " characters long.") AS title_length_desc FROM books;

-- GET titles with spaces replaced by arrows
SELECT REPLACE(title, ' ', '->') AS arrowed_title FROM books;

-- Get a shortened title, specially formated author full name column, and a quantity string
SELECT CONCAT(LEFT(title, 10), "...") AS 'short title', CONCAT_WS(",", LOWER(author_lname), UPPER(author_fname)) AS author, CONCAT(stock_quantity, " in stock") AS quantity FROM books;

-- insert some more data
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- Get summary of book title and release date order by release date for the 4 most recent releases
SELECT DISTINCT CONCAT(title, " - ", released_year) AS book_summ, released_year
FROM books
ORDER BY released_year DESC
LIMIT 5;