-- 1. We need a list of all staff members, including their first and last names, email addresses, and the store id number where they work
SELECT
    first_name,
    last_name,
    email,
    store_id
FROM
    mavenmovies.staff;

-- 2. We need sepearate counts of inventory items held at each of your two stores
SELECT
    store_id,
    COUNT(inventory_id) AS store_inventory_count
FROM
    mavenmovies.inventory
GROUP BY
    store_id;

-- 3. We will need a count of active and inactive customers for each of your stores, separetely
SELECT
    store_id,
    COUNT(
        CASE
            WHEN active = 1 THEN customer_id
            ELSE null
        END
    ) AS active_count,
    COUNT(
        CASE
            WHEN active = 0 THEN customer_id
            ELSE null
        END
    ) AS inactive_count
FROM
    mavenmovies.customer
GROUP BY
    store_id;

-- 4. To assess the liability of a data breach, we need a count of all customer email addresses stored in the db
SELECT
    COUNT(email) AS emails_total
FROM
    mavenmovies.customer;

-- 5.We are interested in how diverse your film offering is as a means of understanding how likely you are to keep customers engaged in the future.Please provide a count of unique film titles you have in inventory at each store and then provide a count of the unique categories of films you provide.
SELECT
    store_id,
    COUNT(DISTINCT film_id) AS unique_films
FROM
    mavenmovies.inventory
GROUP BY
    store_id;

SELECT
    COUNT(DISTINCT name) AS unique_categories_count
FROM
    mavenmovies.category;

-- 6. We would like to understand the replacement cost of your films.Please provide the replacement cost for the film that is least expensive to replace, the most expensive to replace, and the average of all films you carry.
SELECT
    MIN(replacement_cost) AS least_expensive_repl,
    MAX(replacement_cost) AS most_expensive_repl,
    ROUND(AVG(replacement_cost), 2) AS avg_repl
FROM
    mavenmovies.film;

-- 7. We are interested in having you put payment monitoring systems and maximum payment processing restrictions in place in order to minimize the future risk of fraud by your staff.Please provide the average payment you process, as well as the maximum payment you have processed.
SELECT
    AVG(amount) AS avg_payment,
    MAX(amount) AS max_payment
FROM
    payment;

-- 8.We would like to better understand what your customer base looks like.Please provide a list of all customer identification values, with a count of rentals they have made all - time, with your highest volume customers at the top of the list.
SELECT
    customer_id,
    COUNT(rental_id) AS number_rentals
FROM
    mavenmovies.rental
GROUP BY
    customer_id
ORDER BY
    number_rentals DESC;