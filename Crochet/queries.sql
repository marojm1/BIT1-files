
--Use case: Tracks student participation in events 
SELECT
    Students.name AS StudentName,
    Events.event_name AS EventName,
    Students.student_id AS StudentID
FROM
    Students
INNER JOIN
    StudentEvents ON Students.student_id = StudentEvents.student_id
INNER JOIN
    Events ON StudentEvents.event_id = Events.event_id
GROUP BY
    Students.student_id, Events.event_id;
-- Counts the number of events students have attended
SELECT
Students.name AS StudentName,
    COUNT(StudentEvents.event_id) AS EventsAttended
FROM
Students
INNER JOIN
StudentEvents ON Students.student_id = StudentEvents.student_id
GROUP BY
Students.student_id
ORDER BY
EventsAttended DESC;




--Data analysis 
--of events
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



-- Class scheduling use case
--Shows Schedule for every student  
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
GROUP BY
Students.name, Schedule.day_of_week, Schedule.start_time;
--Shows individual students scheule
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


--Use case: cerficate generation
 select * from CourseCompletion
  WHERE CourseCompletion.completed = 1;


--Use case: Student Registration
select * from Students;
-- Shows how many students are in each course 
SELECT
Course.title AS CourseTitle,
    COUNT(DISTINCT Students.student_id) AS StudentsPerCourse
FROM
Course
INNER JOIN
StudentCourse ON Course.course_id = StudentCourse.course_id
INNER JOIN
Students ON StudentCourse.student_id = Students.student_id
GROUP BY
Course.title;


--Use case: Communication
-- for individual students 
SELECT
Students.student_id AS StudentID,
Students.name AS Name,
Students.email AS Email,
EmergencyContact.relationship AS EmergencyContactRelationship,
EmergencyContact.contact_name AS EmergencyContactName,
EmergencyContact.contact_phone AS EmergencyContactPhone,
EmergencyContact.contact_email AS EmergencyContactEmail,
EmergencyContact.contact_address AS EmergencyContactAddress
FROM
Students
INNER JOIN
EmergencyContact ON Students.student_id = EmergencyContact.student_id
WHERE
Students.student_id = 1234 ;
-- to show all
 SELECT
Students.student_id AS StudentID,
Students.name AS Name,
Students.email AS Email,
EmergencyContact.relationship AS EmergencyContactRelationship,
EmergencyContact.contact_name AS EmergencyContactName,
EmergencyContact.contact_phone AS EmergencyContactPhone,
EmergencyContact.contact_email AS EmergencyContactEmail,
EmergencyContact.contact_address AS EmergencyContactAddress
FROM
Students
JOIN
EmergencyContact ON Students.student_id = EmergencyContact.student_id
;


-- Use case: Assignment Management
select * from Assignment;
-- also shows the students grade 
SELECT
Assignment.assignment_id,
Assignment.course_id,
Assignment.due_date,
Assignment.student_id,
StudentAssignment.grade
FROM
Assignment 
JOIN
StudentAssignment  ON Assignment.assignment_id = StudentAssignment.assignment_id;


--Use case: Payment Management
select * from Payments; 
-- shows those who have not yet paid
SELECT
Payments.student_id,
Payments.course_id,
Payments.debt
FROM
Payments 
INNER JOIN
PaymentCourse  ON Payments.course_id = PaymentCourse.course_id
WHERE
Payments.debt > 0
Group by 
Payments.student_id;