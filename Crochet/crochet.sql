.headers on
.mode column

 CREATE TABLE Students(
  name TEXT,
  email TEXT,
  age TEXT,
  course_id INTEGER,
  student_address TEXT,
  student_id INTEGER PRIMARY KEY
);

-- Course table
CREATE TABLE Course (
  title TEXT,
  course_id INTEGER,
  status TEXT,
  student_id INTEGER,
  Primary key (course_id, student_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
  );

-- Payments table
CREATE TABLE Payments (
  amount REAL,
  debt REAL,
  course_id INTEGER,
  student_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE PaymentCourse (
  course_id INTEGER,
  student_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- StudentCourse table
CREATE TABLE StudentCourse (
  course_id INTEGER,
  student_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Events table
CREATE TABLE Events (
  event_name TEXT,
  student_id INTEGER,
  event_id INTEGER ,
  PRIMARY KEY (event_id, student_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- StudentEvents table
CREATE TABLE StudentEvents (
  event_id INTEGER,
  student_id INTEGER,
  FOREIGN KEY (event_id) REFERENCES Events(event_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Health table
CREATE TABLE Health (
  medical_conditions TEXT,
  allergies TEXT,
  student_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- EmergencyContact table
CREATE TABLE EmergencyContact (
  contact_name TEXT,
  relationship TEXT,
  contact_phone TEXT,
  contact_email TEXT,
  contact_address TEXT,
  student_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Assignment table
CREATE TABLE Assignment (
  course_id INTEGER,
  assignment_id INTEGER ,
  due_date DATE,
  student_id INTEGER,
  Primary key (assignment_id, student_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- StudentAssignment table
CREATE TABLE StudentAssignment (
  grade REAL,
  assignment_id INTEGER,
  student_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id)
);

-- AssignmentCourse table (assuming course_id is a foreign key)
CREATE TABLE AssignmentCourse (
 student_id INTEGER,
  grade REAL,
  assignment_id INTEGER,
  course_id INTEGER,
  FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

--Schedule 
Create Table Schedule (
course_id INTEGER,
day_of_week DATE,
start_time TIME,
end_time TIME,
FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

Create table CourseCompletion (
  student_id INTEGER, 
  course_id INTEGER, 
  completed BOOLEAN, 
  completion_date date , 
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
  );


-- Students table
INSERT INTO Students (name, email , age , student_address, course_id, student_id)
VALUES
  ('John Doe', 'johndoe@crochet.com', '20', '123 Main St', 10013, 1234 ),
  ('Jane Smith', 'janesmith@crochet.com', '22', '456 Elm St', 10202, 1235),
  ('Mike Johnson', 'mikejohnson@crochet.com', '21', '789 Oak St', 10305, 1236),
  ('Jill Thompson', 'jthompson@crochet.com', '19', '321 Pine St', 100013, 1237),
  ('Mark Davis', 'mdavis@crochet.com', '23', '567 Oak St', 10305, 1238),
  ('Alice Grant', 'agrant@crochet.com', '21', '456 Maple Ave', 10202, 1239),
  ('Adam Lee', 'alee@crochet.com', '20', '678 Main Ave', 10305, 1240),
  ('Eve Miller', 'emiller@crochet.com', '22', '987 Pine St', 10013, 1241),
  ('James Walker', 'jwalker@crochet.com', '20', '890 Maple Ave', 10013, 1242),
  ('Olivia Turner', 'oturner@crochet.com', '23', '543 Elm St', 10305, 1243);

-- Course table
INSERT INTO Course (title, course_id , status, student_id)
VALUES
  ('Crochet Basics', 10013, 'Active', 1234),
  ('Advanced Crochet', 10202, 'Active', 1235),
  ('Intermediate Crochet', 10305, 'Active', 1236),
  ('Crochet Basics', 10013, 'Active', 1237),
  ('Advanced Crochet', 10202, 'Active', 1238),
  ('Intermediate Crochet', 10305, 'Active', 1239),
  ('Crochet Basics', 10013, 'Active', 1240),
  ('Advanced Crochet', 10202, 'Active', 1241),
  ('Intermediate Crochet', 10305, 'Active', 1242),
  ('Intermediate Crochet', 10305, 'Active', 1243);

-- Events table
-- Assuming event_id is auto-increment
INSERT INTO Events (event_name, student_id, event_id)
VALUES
  ('Orientation', 1234, 100),
  ('Workshop', 1234, 101),
  ('Seminar', 1234, 102),
  ('Orientation', 1235, 100),
  ('Workshop', 1235, 101),
  ('Seminar', 1235, 102),
  ('Orientation', 1236, 100),
  ('Seminar', 1236, 102),
  ('Orientation', 1237, 100),
  ('Orientation', 1240, 100),
  ('Workshop', 1240, 101),
  ('Seminar', 1240, 102),
  ('Orientation', 1243,100),
  ('Workshop', 1243, 101);
  
-- Payments table
INSERT INTO Payments (amount, debt, course_id, student_id)
VALUES
  (150, 0, 10013, 1234),
  (0, 150, 10202, 1235),
  (150, 0, 10305, 1236),
  (150, 0, 10013, 1237),
  (0, 150, 10305, 1238),
  (150, 0, 10202, 1239),
  (150, 0, 10305, 1240),
  (0, 150, 10013, 1241),
  (150, 0, 10013, 1242),
  (0, 150, 10305, 1243);

-- PaymentCourse table
INSERT INTO PaymentCourse (course_id, student_id)
VALUES
  (10013, 1234),
  (10202, 1235),
  (10305, 1236),
  (10013, 1237),
  (10305, 1238),
  (10202, 1239),
  (10305, 1240),
  (10013, 1241),
  (10013, 1242),
  (10305, 1243);

-- StudentEvents table
-- Assuming event_id is auto-increment
INSERT INTO StudentEvents (event_id, student_id)
VALUES
  (100, 1234),
  (101, 1234),
  (102, 1234),
  (100, 1235),
  (101, 1235),
  (102, 1235),
  (100, 1236),
  (102, 1236),
  (100, 1237),
  (100, 1240),
  (101, 1240),
  (102, 1240),
  (100, 1243),
  (101, 1243);

-- Health table
INSERT INTO Health (medical_conditions, allergies, student_id)
VALUES
  ('NULL', 'None', 1234),
  ('NULL', 'Peanuts', 1235),
  ('NULL', 'None', 1235),
  ('NULL', 'None', 1236),
  ('NULL', 'Peanuts', 1237),
  ('NULL', 'None', 1238),
  ('NULL', 'None', 1239),
  ('NULL', 'Peanuts', 1240),
  ('NULL', 'None', 1241), 
  ('NULL', 'None', 1242),
  ('NULL', 'Peanuts', 1243);

-- EmergencyContact table
INSERT INTO EmergencyContact (contact_name, relationship , contact_phone, contact_email, contact_address, student_id)
VALUES
  ('Alice Doe', 'Mother', '023 456 7890', 'alicedoe@ gmail.com', '123 Main Street', 1234),
  ('Bob Smith', 'Father', '034 982 9489', 'bsmith@ gmail.com', '456 Elm Street', 1235),
  ('Charlie Johnson', 'Brother', '034 627 72374', 'cjohnson@ gmail.com', '789 Oak Street', 1236),
  ('Taylor Rains','Sister',  '023 456 7819', 'tay.a@gmail.com', '6 Gal Street', 1237),
  ('Aaron Davis ', 'Father', '023 544 6574','a.davis@gmail.com', '5 Jil Avenue', 1238),
  ('Jack Grant', 'Father', '023 381 4123', 'grant.j@gmail.com', '243 Gen Street', 1239),
  ('Catherine Watering', 'Sister', '021 345 9012', 'cat.ing@gmail.com', '746 TYLOR Street', 1240),
  ('Dan Miller', 'Father', '023 789 9877', 'd.ller@gmail.com', '9 Jlo Street', 1241),
  ('Hanna Jenkings', 'Sister', '022 738 8382', 'hannajen@gmail.com', '78 Klosse Terrance', 1242),
  ('Zach Turner', 'Brother', '022 930 9384', 'zaturner@gmail.com', '92 Huu Street', 1243);

-- StudentAssignment table
INSERT INTO StudentAssignment (grade, assignment_id, student_id)
VALUES
  (84, 0121, 1234),
  (92, 2342, 1235),
  (88, 3433, 1236),
  (89, 0121, 1237),
  (92, 2342, 1238),
  (83, 3433, 1239),
  (85, 0121, 1240),
  (95, 2342, 1241),
  (84, 3433, 1242),
  (70, 3433, 1243);

-- Assignment table
INSERT INTO Assignment (course_id,assignment_id, due_date, student_id)
VALUES
  (10013, 0121, '2023/01/5', 1234),
  (10202, 2342, '2023/02/20', 1235),
  (10305, 3433, '2023/03/10', 1236),
  (10013, 0121, '2023/01/5', 1237),
  (10202, 2342, '2023/02/20', 1238),
  (10305, 3433, '2023/03/10', 1239),
  (10013, 0121, '2023/01/5', 1240),
  (10202, 2342, '2023/02/20', 1241),
  (10305, 3433, '2023/03/10', 1242),
  (10305, 3433, '2023/03/10', 1243);

-- StudentCourse table
INSERT INTO StudentCourse (course_id, student_id)
VALUES
  (10013, 1234),
  (10202, 1235),
  (10305, 1236),
  (10013, 1237),
  (10202, 1238),
  (10305, 1239),
  (10013, 1240),
  (10202, 1241),
  (10305, 1242),
  (10305, 1243);


-- AssignmentCourse table
INSERT INTO AssignmentCourse (assignment_id, grade, student_id, course_id)
VALUES
  (0121, 85, 1234, 10013),
  (2342, 92, 1235, 10202),
  (3433, 88, 1236, 10305),
  (0121, 85, 1237, 10013),
  (2342, 92, 1238, 10202),
  (3433, 88, 1239, 10305),
  (0121, 85, 1240, 10013),
  (2342, 92, 1241, 10202),
  (3433, 88, 1242, 10305),
  (3433, 85, 1243, 10305);

INSERT INTO Schedule (course_id, day_of_week, start_time, end_time)
VALUES
(10013, 'Monday', '12:00', '14:00'),  
(10013, 'Wednesday', '08:00', '10:00'), 
(10013, 'Tuesday', '10:00', '12:00'), 
(10202, 'Wednesday', '12:00', '14:00'), 
(10202, 'Thursday', '10:00', '12:00'), 
(10305, 'Tuesday', '12:00', '14:00'), 
(10305, 'Thursday', '10:00', '12:00');  

INSERT INTO CourseCompletion (student_id, course_id, completed, completion_date)
VALUES
  (10013, 1234, 0,'    -'),
  (10013, 1235, 1, ' 02/07/2021'),
  (10202, 1235, 0,'    -'),
  (10013, 1236,  1,  ' 02/07/2021'),
  (10202, 1236,  1,  '02/12/2021'),
  (10305, 1236, 0,'    -'),
  (10013, 1237, 0, '    -'),
  (10013, 1238, 1, '02/12/2021'),
  (10202, 1238, 0, '    -'),
  (10013, 1239, 1, '02/07/2021'),
  (10202, 1239, 1, '02/12/2021'),
  (10305, 1239, 0, '    -'),
  (10013, 1240, 0,  '    -'),
  (10013, 1241, 1,  '02/07/2021'),
  (10202, 1241, 0, '    -'),
  (10013, 1241, 1,  '02/07/2021'),
  (10202, 1241, 1, '02/12/2021'),
  (10305, 1242, 0, '    -'),
  (10013, 1243, 1,  '02/07/2021'),
  (10202, 1243, 1, '02/12/2021'),
  (10305, 1243, 0, '    -');


SELECT
Students.name AS StudentName,
Course.title  AS Course,
Schedule.day_of_week AS Schedule,
Schedule.start_time || ' - ' || Schedule.end_time AS TimeSlot
FROM
Students
INNER JOIN
StudentCourse ON Students.student_id = StudentCourse.student_id
INNER JOIN
Course ON StudentCourse.course_id = Course.course_id
INNER JOIN
Schedule ON Course.course_id = Schedule.course_id
WHERE --can either use student.name or student.student_id 
Students.name ='John Doe'
GROUP BY
Students.name, Schedule.day_of_week, Schedule.start_time;

WITH StudentEventCount AS (
    SELECT
Students.name AS StudentName,
COUNT(StudentEvents.event_id) AS EventsAttended
    FROM
Students
    LEFT JOIN
StudentEvents ON Students.student_id = StudentEvents.student_id
    LEFT JOIN
Events ON StudentEvents.event_id = Events.event_id
    GROUP BY
Students.name
)
SELECT
StudentName,
    EventsAttended,
    (SELECT AVG(EventsAttended) FROM StudentEventCount) AS AverageAttendance,
    CASE WHEN EventsAttended = 0 THEN 'Risk Student' ELSE '' END AS RiskStudents
FROM
StudentEventCount
ORDER BY
EventsAttended ASC;
