/* project_part2.sql 
  Chenyang Li
   CS 31A, Spring 2022
*/

/* university */

/* Query 1 */
SELECT* FROM academic_session;
SELECT* FROM parent_info;
SELECT* FROM student;
SELECT* FROM faculty;
SELECT* FROM course;
SELECT* FROM department;
SELECT* FROM exam_type;
SELECT* FROM exam;
SELECT* FROM student_att;
SELECT* FROM exam_result;
SELECT* FROM student_course;
SELECT* FROM faculty_login;
/* Query 2 */
SELECT course_id, course_name, dept_name
FROM course c
JOIN department d ON (c.dept_id = d.dept_id);


/* Query 3 */
SELECT course_name, session_name
FROM course c
JOIN academic_session a ON (c.session_id = a.session_id)
AND session_name = 'fall session';

/* Query 4 */
SELECT course_name, student_id, dept_name
FROM course c
JOIN student_course sc ON (c.course_id = sc.course_id)
JOIN department d ON (c.dept_id = d.dept_id);
    
/* Query 5 */
SELECT course_name , student_id, dept_name
FROM course c
JOIN student_course sc ON (c.course_id = sc.course_id)
JOIN department d ON (c.dept_id = d.dept_id)
AND d.dept_id = 20;

/* Query 6 */
SELECT sc.course_id, course_name, exam_grade, exam_id
FROM student_course sc
JOIN course c ON (c.course_id = sc.course_id)
JOIN exam_result er ON (sc.student_id = er.student_id)
AND sc.course_id BETWEEN 190 and 192;



/* Query 7 */
SELECT student_id, exam_grade, er.course_id, course_name
FROM exam_result er
LEFT JOIN course c ON (c.course_id = er.course_id);


/* Query 8 */
SELECT exam_id, student_id, exam_grade
FROM exam_result er
JOIN course c ON (er.course_id = c.course_id)
ORDER BY exam_id;


/* Query 9 */
SELECT student_id , num_work_days, exam_eligibility
FROM student_att;

    

/* Query 10 */
SELECT (exam_grade - 5) AS correct_grade
FROM exam_result;


