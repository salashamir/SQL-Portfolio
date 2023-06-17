CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age TINYINT NOT NULL
);

CREATE TABLE papers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL, 
    grade TINYINT NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id)
    ON DELETE CASCADE,
    CONSTRAINT grade_bw_0_100 CHECK (grade BETWEEN 0 AND 100)
);

INSERT INTO students (first_name, last_name, age) VALUES 
('Caleb', 'Johnston',17), ('Samantha', 'Johnston', 18), ('Raj', 'Patel', 18), ('Carlos', 'Guerrera', 19), ('Lisa', 'Chlebowski', 17);
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- Find students and their papers\ titls + grades using an inner join
SELECT first_name, title, grade FROM students JOIN papers ON students.id = papers.student_id ORDER BY grade DESC;

-- Find all students who haven't writte any papers using a left join and fill in missing values (null) with more appropriate values
SELECT first_name, IFNULL(title, "MISSING"), IFNULL(grade,0) FROM students LEFT JOIN papers ON students.id = papers.student_id;

-- Find averages for students papers' along with a generated column to indicate whether they are passing or failing 
SELECT 
    first_name, 
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN AVG(grade) >= 75 THEN "PASSING"
        ELSE "FAILING"
    END AS passing_status
FROM students
LEFT JOIN papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;


