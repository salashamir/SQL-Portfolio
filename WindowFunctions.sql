CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO
    employees (department, salary)
VALUES
    ('engineering', 80000),
    ('engineering', 69000),
    ('engineering', 70000),
    ('engineering', 103000),
    ('engineering', 67000),
    ('engineering', 89000),
    ('engineering', 91000),
    ('sales', 59000),
    ('sales', 70000),
    ('sales', 159000),
    ('sales', 72000),
    ('sales', 60000),
    ('sales', 61000),
    ('sales', 61000),
    ('customer service', 38000),
    ('customer service', 45000),
    ('customer service', 61000),
    ('customer service', 40000),
    ('customer service', 31000),
    ('customer service', 56000),
    ('customer service', 55000);

-- Find the avg salary for the whole table and add it to every row
SELECT
    emp_no,
    department,
    salary,
    AVG(salary) OVER()
FROM
    employees;

-- Find avg salary by department group and total avg salary and display added to all rows. 
SELECT
    emp_no,
    department,
    salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM
    employees;

-- Find count for departments
SELECT
    emp_no,
    department,
    salary,
    COUNT(*) OVER(PARTITION BY department) as dept_count
FROM
    employees;

-- Find rolling sum
SELECT
    emp_no,
    department,
    salary,
    SUM(salary) OVER(
        PARTITION BY department
        ORDER BY
            salary
    ) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM
    employees;

-- Find total rankings by salary for all rows and department groups
SELECT
    emp_no,
    department,
    salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY
            SALARY DESC
    ) as dept_row_number,
    RANK() OVER(
        PARTITION BY department
        ORDER BY
            SALARY DESC
    ) as dept_salary_rank,
    RANK() OVER(
        ORDER BY
            salary DESC
    ) as overall_rank,
    DENSE_RANK() OVER(
        ORDER BY
            salary DESC
    ) as overall_dense_rank,
    ROW_NUMBER() OVER(
        ORDER BY
            salary DESC
    ) as overall_num
FROM
    employees
ORDER BY
    overall_rank;

-- Find salary quartiles position overall and by department
SELECT
    emp_no,
    department,
    salary,
    NTILE(4) OVER(
        PARTITION BY department
        ORDER BY
            salary DESC
    ) AS dept_salary_quartile,
    NTILE(4) OVER(
        ORDER BY
            salary DESC
    ) AS salary_quartile
FROM
    employees;

-- Find id of highest paid salary by department and overall and attach to each row
SELECT
    emp_no,
    department,
    salary,
    FIRST_VALUE(emp_no) OVER(
        PARTITION BY department
        ORDER BY
            salary DESC
    ) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(
        ORDER BY
            salary DESC
    ) as highest_paid_overall
FROM
    employees;

-- Find diff b/w salaries by department using LAG window function
SELECT
    emp_no,
    department,
    salary,
    salary - LAG(salary) OVER(
        ORDER BY
            salary DESC
    ) as salary_diff
FROM
    employees;