-- Project completed for Khan Academy's Intro to SQL Course. In this project I created a table for items in a clothing store. The clothing in the inventory contains data apparel type, size, color, quantity in stock, sex, and material. After I used aggregate functions to query some basic stats about the inventory.

CREATE TABLE clothing_store (id INTEGER PRIMARY KEY, apparel_type TEXT, size TEXT, color TEXT, quantity INTEGER, material TEXT, sex TEXT, price NUMERIC);

INSERT INTO clothing_store (id,apparel_type, size, color, quantity, material, sex, price)
VALUES
    (1, "t-shirt", "small", "burgundy", 34, "cotton", "men", 15.99),
    (2, "bomber jacket", "medium", "navy", 52, "polyester", "men", 85.00),
    (3, "blouse", "x-small", "beige", 25, "silk", "women", 25.00),
    (4, "jeans", "large", "grey", 18, "denim", "women", 36.99),
    (5, "sweatshirt", "large", "cream", 43, "cotton", "women", 40.99),
    (6, "sweatshirt", "small", "cream", 24, "cotton", "women", 40.99),
    (7, "v-neck", "medium", "fuchsia", 87, "cotton", "men", 19.99),
    (8, "bowler hat", "small", "coffee", 54, "tweed", "men", 39.99),
    (9, "jacket", "medium", "navy", 35, "leather", "women", 125.00),
    (10, "loafers", "medium", "brown", 17, "leather", "men", 24.99),
    (11, "hoodie", "small", "burgundy", 75, "cotton", "men", 79.99),
    (12, "windbreaker", "x-large", "crimson", 44, "polyester", "men", 135.00),
    (13, "windbreaker", "x-small", "green", 27, "polyester", "women", 119.89),
    (14, "jeans", "medium", "navy", 62, "denim", "men", 35.99),
    (15, "t-shirt", "x-small", "cream", 31, "cotton", "women", 15.96);

-- Get an ordering of all the products sorted by price descending.
SELECT apparel_type, size, sex, quantity, price FROM clothing_store ORDER BY price DESC;

-- select all cream colored products
SELECT * FROM clothing_store WHERE color = "cream";

-- select all medium size products
SELECT apparel_type, color, size FROM clothing_store WHERE size = "medium";

-- select all products that are navy colored and for women then sort by price
SELECT apparel_type, color, sex, price FROM clothing_store WHERE color = "navy" AND sex = "women" ORDER BY price DESC;
