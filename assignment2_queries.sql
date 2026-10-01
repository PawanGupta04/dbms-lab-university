USE university;

-- 16. CSE students
SELECT s.rollNo, s.name FROM student s
JOIN department d ON s.deptNo = d.deptId
WHERE d.name = 'C.S.E';

-- 17. Male students of ECE
SELECT s.rollNo, s.name, s.year FROM student s
JOIN department d ON s.deptNo = d.deptId
WHERE d.name = 'E.C.E' AND s.sex = 'Male';

-- 18. Students advised by Mr.Biswanath Pal
SELECT s.rollNo, s.name, s.degree FROM student s
JOIN professor p ON s.advisor = p.empId
WHERE p.name = 'Mr.Biswanath Pal';

-- 19. M.E female students advised by Mr.Bivas Paramanik
SELECT s.rollNo, s.name FROM student s
JOIN professor p ON s.advisor = p.empId
WHERE s.degree = 'M.E' AND s.sex = 'Female'
  AND p.name = 'Mr.Bivas Paramanik';

-- 20. Name and phone of HOD of CSE
SELECT p.name, p.phone FROM professor p
JOIN department d ON d.hod = p.empId
WHERE d.name = 'C.S.E';

-- 21. Female professors of CSE
SELECT p.name FROM professor p
JOIN department d ON p.deptNo = d.deptId
WHERE d.name = 'C.S.E' AND p.sex = 'Female';

-- 22. Empid, name, start year of HOD of ECE
SELECT p.empId, p.name, p.startYear FROM professor p
JOIN department d ON d.hod = p.empId
WHERE d.name = 'E.C.E';

-- 23. 2nd year M.E male students of ECE
SELECT s.rollNo, s.name FROM student s
JOIN department d ON s.deptNo = d.deptId
WHERE d.name = 'E.C.E' AND s.degree = 'M.E'
  AND s.year = 2 AND s.sex = 'Male';

-- 24. Details of student with rollno 1
SELECT s.name, s.degree, e.courseId, e.sem FROM student s
JOIN enrollment e ON s.rollNo = e.rollNo
WHERE s.rollNo = 1;

-- 25. Post graduate (M.E) students with grade A++
SELECT s.rollNo, s.name, s.degree FROM student s
JOIN enrollment e ON s.rollNo = e.rollNo
WHERE s.degree = 'M.E' AND e.grade = 'A++';

-- 26. CSE students with advisor name and empid
SELECT s.rollNo, s.name, p.name AS advisor_name, p.empId FROM student s
JOIN professor p ON s.advisor = p.empId
JOIN department d ON s.deptNo = d.deptId
WHERE d.name = 'C.S.E';

-- 27. CSE professors who joined before 1995
SELECT p.name, p.empId, p.phone FROM professor p
JOIN department d ON p.deptNo = d.deptId
WHERE d.name = 'C.S.E' AND p.startYear < 1995;

-- 28. Professors teaching post graduate courses in ECE
SELECT DISTINCT p.empId, p.name FROM professor p
JOIN teaching t ON p.empId = t.empId
JOIN course c ON t.courseId = c.courseId
JOIN department d ON c.deptNo = d.deptId
WHERE d.name = 'E.C.E' AND c.cname LIKE 'PG%';

-- 29. 2nd sem PG ECE students with grade greater than B++
SELECT s.name, s.rollNo FROM student s
JOIN enrollment e ON s.rollNo = e.rollNo
JOIN course c ON e.courseId = c.courseId
JOIN department d ON c.deptNo = d.deptId
WHERE e.sem = 2 AND c.cname LIKE 'PG%' AND d.name = 'E.C.E'
  AND e.grade IN ('A++', 'A+', 'A');

-- 30. Professors teaching UG 6th sem CSE courses
SELECT DISTINCT p.name FROM professor p
JOIN teaching t ON p.empId = t.empId
JOIN course c ON t.courseId = c.courseId
JOIN department d ON c.deptNo = d.deptId
WHERE t.sem = 6 AND c.cname LIKE 'UG%' AND d.name = 'C.S.E';
