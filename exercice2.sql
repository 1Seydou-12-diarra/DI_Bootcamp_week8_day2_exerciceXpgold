-- EXERCICE_GOLD 2
-- Update 'Lea Benichou' and 'Marc Benichou' birth_dates to 02/11/1998.

UPDATE student
SET birth_date = '1998-11-02'
WHERE first_name = 'Lea' OR first_name = 'Marc';

-- Change the last_name of David from 'Grez' to 'Guez'.

UPDATE student
SET last_name = 'Guez'
WHERE first_name = 'David';
Delete:

-- Delete the student named 'Lea Benichou' from the table.

DELETE FROM student
WHERE first_name = 'Lea' AND last_name = 'Benichou';


-- Count how many students are in the table.
SELECT COUNT(*) AS num_students
FROM student;

-- Count how many students were born after 1/01/2000.

SELECT COUNT(*) AS num_students
FROM student
WHERE birth_date > '2000-01-01';


-- Add a column to the student table called math_grade.

ALTER TABLE student
ADD math_grade INT;
-- Add 80 to the student which id is 1.

UPDATE student
SET math_grade = math_grade + 80
WHERE id = 1;
-- Add 90 to the students which have ids of 2 or 4.
UPDATE student
SET math_grade = math_grade + 90
WHERE id IN (2, 4);

-- Add 40 to the student which id is 6.

Copy code
UPDATE student
SET math_grade = math_grade + 40
WHERE id = 6;

-- Count how many students have a grade bigger than 83.

SELECT first_name, last_name, COUNT(*) AS total_grades
FROM student
WHERE math_grade > 83
GROUP BY first_name, last_name;

-- Add another student named 'Omer Simpson' with the same birth_date as the one already in the table. Give him a grade of 70.

INSERT INTO student (first_name, last_name, birth_date, math_grade)
SELECT first_name, last_name, birth_date, 70
FROM student
WHERE first_name = 'Omer' AND last_name = 'Simpson';

-- Bonus: Count how many grades each student has.

SELECT first_name, last_name, COUNT(math_grade) AS total_grades
FROM student
GROUP BY first_name, last_name;

-- Find the sum of all the students grades.

SELECT SUM(math_grade) AS total_grades
FROM student;