--1. Write an SQL query to calculate the average number of students enrolled in each course. Useaggregate functions and subqueries to achieve this.
SELECT 
    AVG(student_count) AS avg_students_per_course
FROM (
    SELECT 
        course_id, 
        COUNT(student_id) AS student_count
    FROM 
       SISDB.dbo.Enrollments1
    GROUP BY 
        course_id
) AS subquery;

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximumpayment amount and then retrieve the student(s) associated with that amount.
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    p.amount
FROM 
    SISDB.dbo.Payments1 p
JOIN 
    SISDB.dbo.Students1 s ON p.student_id = s.student_id
WHERE 
    p.amount = (SELECT MAX(amount) FROM SISDB.dbo.Payments1);


--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find thecourse(s) with the maximum enrollment count.
WITH CourseEnrollments AS (
    SELECT 
        course_id, 
        COUNT(student_id) AS enrollment_count
    FROM 
        SISDB.dbo.Enrollments1
    GROUP BY 
        course_id
)
SELECT 
    course_id, 
    enrollment_count
FROM 
    CourseEnrollments
WHERE 
    enrollment_count = (SELECT MAX(enrollment_count) FROM CourseEnrollments);



--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum ayments for each teacher's courses.
SELECT 
    t.teacher_id, 
    t.first_name, 
    t.last_name, 
    (SELECT SUM(p.amount) 
     FROM SISDB.dbo.Payments1 p
     JOIN SISDB.dbo.Enrollments1 e ON p.student_id = e.student_id
     JOIN SISDB.dbo.Courses1 c ON e.course_id = c.course_id
     WHERE c.teacher_id = t.teacher_id
    ) AS total_payments
FROM 
    SISDB.dbo.Teacher1 t;


--5. Identify students who are enrolled in all available courses. Use subqueries to compare astudent's enrollments with the total number of courses.
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name
FROM 
    SISDB.dbo.Students1 s
WHERE 
    (SELECT COUNT(DISTINCT course_id) 
     FROM SISDB.dbo.Enrollments1 e
     WHERE e.student_id = s.student_id) = (SELECT COUNT(course_id) FROM SISDB.dbo.Courses1);


--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries tofind teachers with no course assignments.
SELECT 
    t.teacher_id, 
    t.first_name, 
    t.last_name
FROM 
    SISDB.dbo.Teacher1 t
WHERE 
    t.teacher_id NOT IN (SELECT DISTINCT teacher_id FROM SISDB.dbo.Courses1);

--7. Calculate the average age of all students. Use subqueries to calculate the age of each studentbased on their date of birth.
SELECT 
    AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS avg_age
FROM 
    SISDB.dbo.Students1;

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollmentrecords.
SELECT 
    c.course_id, 
    c.course_name
FROM 
    SISDB.dbo.Courses1 c
WHERE 
    c.course_id NOT IN (SELECT DISTINCT course_id FROM SISDB.dbo.Enrollments1);

--9. Calculate the total payments made by each student for each course they are enrolled in. Usesubqueries and aggregate functions to sum payments.
SELECT 
    e.student_id, 
    e.course_id, 
    SUM(p.amount) AS total_payments
FROM 
    SISDB.dbo.Enrollments1 e
JOIN 
    SISDB.dbo.Payments1 p ON e.student_id = p.student_id
GROUP BY 
    e.student_id, 
    e.course_id;

--10. Identify students who have made more than one payment. Use subqueries and aggregatefunctions to count payments per student and filter for those with counts greater than one.
SELECT 
    student_id, 
    COUNT(payment_id) AS payment_count
FROM 
    SISDB.dbo.Payments1
GROUP BY 
    student_id
HAVING 
    COUNT(payment_id) > 1;

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students"table with the "Payments" table and use GROUP BY to calculate the sum of payments for eachstudent.
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    SUM(p.amount) AS total_payments
FROM 
    SISDB.dbo.Students1 s
JOIN 
    SISDB.dbo.Payments1 p ON s.student_id = p.student_id
GROUP BY 
    s.student_id, 
    s.first_name, 
    s.last_name;

--12. Retrieve a list of course names along with the count of students enrolled in each course. UseJOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY tocount enrollments.
SELECT 
    c.course_name, 
    COUNT(e.student_id) AS student_count
FROM 
    SISDB.dbo.Courses1 c
LEFT JOIN 
    SISDB.dbo.Enrollments1 e ON c.course_id = e.course_id
GROUP BY 
    c.course_name;

--13. Calculate the average payment amount made by students. Use JOIN operations between the"Students" table and the "Payments" table and GROUP BY to calculate the average.
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    AVG(p.amount) AS avg_payment
FROM 
    SISDB.dbo.Students1 s
JOIN 
    SISDB.dbo.Payments1 p ON s.student_id = p.student_id
GROUP BY 
    s.student_id, 
    s.first_name, 
    s.last_name;
