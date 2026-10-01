creating database 

  
CREATE DATABASE university;
USE university;

-- 1. Department (hod FK added later, because of circular reference)
CREATE TABLE department (
  deptId INT PRIMARY KEY,
  name   VARCHAR(20),
  hod    VARCHAR(10),
  phone  INT
);

-- 2. Professor
CREATE TABLE professor (
  empId     VARCHAR(10) PRIMARY KEY,
  name      VARCHAR(50),
  sex       VARCHAR(10),
  startYear INT,
  deptNo    INT,
  phone     VARCHAR(15),
  FOREIGN KEY (deptNo) REFERENCES department(deptId)
);

-- 3. Course
CREATE TABLE course (
  courseId VARCHAR(10) PRIMARY KEY,
  cname    VARCHAR(20),
  credits  INT,
  deptNo   INT,
  FOREIGN KEY (deptNo) REFERENCES department(deptId)
);

-- 4. Student
CREATE TABLE student (
  rollNo  INT PRIMARY KEY,
  name    VARCHAR(50),
  degree  VARCHAR(10),
  year    INT,
  sex     VARCHAR(10),
  deptNo  INT,
  advisor VARCHAR(10),
  FOREIGN KEY (deptNo)  REFERENCES department(deptId),
  FOREIGN KEY (advisor) REFERENCES professor(empId)
);

-- 5. Enrollment
CREATE TABLE enrollment (
  rollNo   INT,
  courseId VARCHAR(10),
  sem      INT,
  year     INT,
  grade    VARCHAR(5),
  PRIMARY KEY (rollNo, courseId, sem, year),
  FOREIGN KEY (rollNo)   REFERENCES student(rollNo),
  FOREIGN KEY (courseId) REFERENCES course(courseId)
);

-- 6. Teaching
CREATE TABLE teaching (
  empId     VARCHAR(10),
  courseId  VARCHAR(10),
  sem       INT,
  year      INT,
  classRoom VARCHAR(10),
  PRIMARY KEY (empId, courseId, sem, year),
  FOREIGN KEY (empId)    REFERENCES professor(empId),
  FOREIGN KEY (courseId) REFERENCES course(courseId)
);

-- 7. Prerequisite
CREATE TABLE prerequisite (
  preReqCourse VARCHAR(10),
  courseId     VARCHAR(10),
  PRIMARY KEY (preReqCourse, courseId),
  FOREIGN KEY (courseId) REFERENCES course(courseId)
);
