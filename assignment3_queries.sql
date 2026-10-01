USE university;

-- 1. Senior most professor
SELECT empId, name FROM professor
WHERE startYear = (SELECT MIN(startYear) FROM professor);

-- 2. Students whose gender is same as their advisor
SELECT s.rollNo, s.name FROM student s
JOIN professor p ON s.advisor = p.empId
WHERE s.sex = p.sex;

-- 3. Courses taught by advisor of CSE dept
SELECT DISTINCT c.courseId, c.cname, t.sem FROM course c
JOIN teaching t ON c.courseId = t.courseId
WHERE t.empId IN (
  SELECT s.advisor FROM student s
  JOIN department d ON s.deptNo = d.deptId
  WHERE d.name = 'C.S.E');

-- 4. Courses taught by HOD of each dept
SELECT DISTINCT c.courseId, c.cname, t.sem FROM course c
JOIN teaching t ON c.courseId = t.courseId
JOIN department d ON t.empId = d.hod;

-- 5. PG male CSE students with course credit points
SELECT s.name, c.cname, c.credits FROM student s
JOIN enrollment e ON s.rollNo = e.rollNo
JOIN course c ON e.courseId = c.courseId
JOIN department d ON s.deptNo = d.deptId
WHERE s.degree = 'M.E' AND s.sex = 'Male' AND d.name = 'C.S.E';

-- 6. Courses with at least one female student
SELECT DISTINCT c.courseId, c.cname, d.name AS dept_name FROM course c
JOIN department d ON c.deptNo = d.deptId
JOIN enrollment e ON c.courseId = e.courseId
JOIN student s ON e.rollNo = s.rollNo
WHERE s.sex = 'Female';

-- 7. Courses which are not 6 point
SELECT c.courseId, c.cname, d.name AS dept_name FROM course c
JOIN department d ON c.deptNo = d.deptId
WHERE c.credits <> 6;

-- 8. Courses with at least one A++ student
SELECT DISTINCT c.courseId, c.cname FROM course c
JOIN enrollment e ON c.courseId = e.courseId
WHERE e.grade = 'A++';

-- 9. Female students taught by advisor of CSE dept
SELECT DISTINCT s.rollNo, s.name FROM student s
JOIN enrollment e ON s.rollNo = e.rollNo
JOIN teaching t ON e.courseId = t.courseId
  AND e.sem = t.sem AND e.year = t.year
WHERE s.sex = 'Female'
  AND t.empId IN (
    SELECT s2.advisor FROM student s2
    JOIN department d ON s2.deptNo = d.deptId
    WHERE d.name = 'C.S.E');

-- 10. Courses having any final year student
-- (B.E year 4, M.E year 2)
SELECT DISTINCT c.courseId, c.cname FROM course c
JOIN enrollment e ON c.courseId = e.courseId
JOIN student s ON e.rollNo = s.rollNo
WHERE (s.degree = 'B.E' AND s.year = 4)
   OR (s.degree = 'M.E' AND s.year = 2);
