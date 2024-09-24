
-- Insert Teachers
INSERT INTO SISDB.dbo.Teacher1 (first_name, last_name, email)
VALUES 
('Alice', 'Johnson', 'alice.johnson@example.com'),  -- teacher_id = 1
('Bob', 'Williams', 'bob.williams@example.com'),    -- teacher_id = 2
('Carol', 'Smith', 'carol.smith@example.com'),		-- teacher_id = 3
('Bhavana','Ghatamaneni','bhavana.ghatamaneni@example.com'), -- teacher_id = 4
('Yashu','Kunam','Yashu.kunam@example.com'),
('Akhila', 'John', 'akhila.john@example.com'),  -- teacher_id = 1
('Babi', 'Willa', 'babi.willia@example.com'),    -- teacher_id = 2
('Carrot', 'Smitha', 'carrot.smitha@example.com'),		-- teacher_id = 3
('Bhavs','Bommineni','bhavs.bomminenineni@example.com'), -- teacher_id = 4
('Yasaswini','Kunams','Yasaswini.kunams@example.com');-- teacher_id = 5-- teacher_id = 5
DROP TABLE IF EXISTS Teacher;
DROP TABLE Teacher;

-- Insert Courses
INSERT INTO SISDB.dbo.Courses1 (course_name, credits, teacher_id)
VALUES 
('Mathematics', 4, 1),  -- teacher_id = 1 (Alice)
('Physics', 3, 2),      -- teacher_id = 2 (Bob)
('Chemistry', 3, 3),    -- teacher_id = 3 (Carol)
('Biology', 2, 1),      -- teacher_id = 1 (Alice)
('Computer Science', 5, 2),
('English',1,4),
('Telugu',5,2),
('Hindi',3,6),
('Social',5,8),
('politics',3,7);-- teacher_id = 2 (Bob)

-- Insert Students
INSERT INTO SISDB.dbo.Students1 (student_id,first_name, last_name, date_of_birth, email, phone_number)
VALUES 
(1,'John', 'Doe', '1998-05-12', 'john.doe@example.com', '1234567890'),  -- student_id = 1
(2,'Jane', 'Smith', '2000-08-22', 'jane.smith@example.com', '0987654321'),  -- student_id = 2
(3,'Mark', 'Johnson', '1999-03-10', 'mark.johnson@example.com', '1122334455'),  -- student_id = 3
(4,'Emily', 'Davis', '2001-07-15', 'emily.davis@example.com', '2233445566'),  -- student_id = 4
(5,'Luke', 'Brown', '2002-11-20', 'luke.brown@example.com', '3344556677'),
(6,'John', 'Doe', '1998-05-12', 'john.wet@example.com', '1234567'),
(7,'Jane', 'Smith', '2000-08-22', 'jane.werts@example.com', '098765'),
(8,'Michael', 'Brown', '1999-11-30', 'michael.brown@example.com', '111222'),
(9,'Emily', 'Davis', '1997-03-15', 'emily.dravid@example.com', '444555'),
(10,'Chris', 'Joh', '2001-07-07', 'chris.johnson@example.com', '777899');
-- student_id = 5

-- Insert Enrollments
INSERT INTO SISDB.dbo.Enrollments1 (student_id, course_id, enrollment_date)
VALUES 
(1, 1, '2024-01-15'),  
(2, 2, '2024-01-15'),
(3,3,'2024-07-12'),
(4,4,'2024-12-07'),
(5,5,'2024-08-05');
(6,6,'2024-07-07'),
(7,7,'2024-03-04'),
(8,8,'2024-02-07'),
(9,9,'2024-05-12'),
(10,10,'2024-01-23');

-- Insert Payments
INSERT INTO SISDB.dbo.Payments1 (student_id, amount, payment_date)
VALUES 
(1, 500.00, '2024-02-10'),  -- student_id = 1
(2, 450.00, '2024-02-12'),
(3, 348.00,'2024-09-21'),
(4,567.00,'2024-07-12'),
(5,456.00,'2024-08-05');-- student_id = 2
(6,342.00,'2024-09-09'),
(7,543.00,'2024-07-07'),
(8,213.45,'2024-05-04'),
(9,2340.00,'2024-02-01'),
(10,3452.52,'2024-07-12');

