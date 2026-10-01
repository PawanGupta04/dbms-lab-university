USE university;

-- 1. Roll no and name of B.E. students
SELECT rollNo, name FROM student WHERE degree = 'B.E';

-- 2. Roll no and name of M.E. students
SELECT rollNo, name FROM student WHERE degree = 'M.E';

-- 3. Male students
SELECT rollNo, name FROM student WHERE sex = 'Male';

-- 4. Female students
SELECT rollNo, name FROM student WHERE sex = 'Female';

-- 5. Department id and phone of C.S.E
SELECT deptId, phone FROM department WHERE name = 'C.S.E';

-- 6. Professors who joined before 2000
SELECT empId, name, sex, phone FROM professor WHERE startYear < 2000;

-- 7. Name and phone of male professors
SELECT name, phone FROM professor WHERE sex = 'Male';

-- 8. Top graded students
SELECT rollNo, courseId, grade FROM enrollment WHERE grade = 'A++';

-- 9. First year students
SELECT rollNo, courseId FROM enrollment WHERE year = 1;

-- 10. Students other than 1st year
SELECT rollNo, courseId FROM enrollment WHERE year <> 1;

-- 11. Credit points of UG C.S.E course
SELECT credits FROM course WHERE cname = 'UG(CSE)';

-- 12. Courses with 4 credit points
SELECT cname FROM course WHERE credits = 4;

-- 13. Start year and phone of female professors
SELECT startYear, phone FROM professor WHERE sex = 'Female';

-- 14. Students with below B grade
SELECT rollNo, courseId FROM enrollment
WHERE grade NOT IN ('A++', 'A+', 'A', 'B++', 'B+', 'B');

-- 15. Roll no, year and degree of Aparajita
SELECT rollNo, year, degree FROM student WHERE name = 'Aparajita';
