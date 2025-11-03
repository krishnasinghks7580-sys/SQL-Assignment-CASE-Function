
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    marks INT,
    city VARCHAR(50)
);

INSERT INTO Students (student_id, name, subject, marks, city)
VALUES
(1, 'Rahul', 'Math', 95, 'Delhi'),
(2, 'Priya', 'Science', 82, 'Mumbai'),
(3, 'Arjun', 'English', 45, 'Bangalore'),
(4, 'Neha', 'Math', 67, 'Delhi'),
(5, 'Kabir', 'Science', 30, 'Pune'),
(6, 'Simran', 'English', 88, 'Chennai'); 

SELECT * FROM Students;

----Q1. Write a query to show the grade for each 
-----student using this grading logic:
--   - A → marks >= 90
--   - B → marks between 75 and 89
--   - D → marks below 50

SELECT name,marks,
CASE WHEN marks >= 90 THEN 'A'
           WHEN marks >= 75 THEN 'B'
           WHEN marks >= 50 THEN 'C'
           ELSE 'D'
       END AS Grade
FROM students;

---Q2. Write a query to categorize students as:
--- - Pass if marks are >=50
---   - Fail if marks are below 50
SELECT name,marks,
CASE WHEN marks >= '50' THEN 'pass'
ELSE 'fail' END AS Result FROM students;

---Q3. Write a query to display:
---   - Top Performer if marks >= 90
---   - Average Performer if marks between 60 and 89
---   - Needs Improvement if marks below 60

SELECT name,marks,
CASE
WHEN marks>='90' THEN 'Top Performer'
WHEN marks BETWEEN '60' AND '89' THEN 'Average Performer'
ELSE 'Needs Improvement'
END AS Performer FROM students;

---Q4. Use CASE to create a column City_Category where:
 ---  - Metro for Delhi and Mumbai
 ---  - Non-Metro for other cities

SELECT name,city,
CASE
WHEN city IN('Delhi','Mumbai') THEN 'Metro'
ELSE 'Non_Metro' 
END AS City_Category
FROM students;


-----Q5. Combine CASE with aggregate functions: Write a query to count how 
-----many students are Pass and how many are Fail.
SELECT 
    CASE
        WHEN marks >= 50 THEN 'Pass'
        ELSE 'Fail'
    END AS Result,
    COUNT(*) AS Total_Students
FROM students
GROUP BY
    CASE
        WHEN marks >= 50 THEN 'Pass'
        ELSE 'Fail'
    END;
	
----Q6. Challenge Task:
--- Write a query to show a custom message for each student:
---   - Excellent Work Rahul! if the student is Rahul with marks above 90
---   - Good Effort if marks >= 50 but < 90
---   - Needs Extra Classes if marks < 50
	
SELECT name,marks, 
  CASE 
  WHEN name='Rahul!'AND marks>90
  THEN 'Excellent Work Rahul!'
  WHEN marks=50 THEN 'Good Effort'
            ELSE 'Needs Extra Classes'
       END AS Message
FROM students;

  