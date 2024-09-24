--Write an SQL query to enroll a student in a course. Choose an existing student and course andinsert a record into the "Enrollments" table with the enrollment date
INSERT INTO SISDB.dbo.Enrollments1(student_id, course_id, enrollment_date)
VALUES (3, 3, '2024-09-20');
select * from SISDB.dbo.Enrollments1;
--Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.
select *  from SISDB.dbo.Teacher1;
update SISDB.dbo.Teacher1
set email = 'keerthi.kancham@gmail.com' where first_name = 'Carrot';
select * from SISDB.dbo.Teacher1;
--Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course.
select *  from SISDB.dbo.Enrollments1;
delete from SISDB.dbo.Enrollments1 where student_id = 4 and course_id = 4;
--Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.
UPDATE SISDB.dbo.Courses1
SET teacher_id = 5
WHERE course_id = 6;
select *  from SISDB.dbo.Courses1;
--Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.
select *  from SISDB.dbo.Students1;
DELETE FROM SISDB.dbo.Enrollments1
WHERE student_id = 10;
DELETE FROM SISDB.dbo.Students1
WHERE student_id = 10;
--Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.
UPDATE SISDB.dbo.Payments1
SET amount = 400.00
WHERE student_id = 2 AND payment_id = 2;
select * from SISDB.dbo.Payments1;