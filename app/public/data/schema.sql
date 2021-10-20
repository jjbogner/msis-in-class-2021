CREATE DATABASE IF NOT EXISTS msisdb;
USE msisdb;

DROP TABLE IF EXISTS student;
CREATE TABLE student (
	id int PRIMARY KEY AUTO_INCREMENT ,
    username varchar(24) UNIQUE NOT NULL,
    name varchar(48)
);

INSERT INTO student (id, username, name) VALUES 
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Novel');

-- SELECT * FROM students;

DROP TABLE IF EXISTS offer;
CREATE TABLE offer (
	id int PRIMARY KEY AUTO_INCREMENT,
    studentId int NOT NULL REFERENCES student(id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
	title VARCHAR(50) NOT NULL DEFAULT '',
    author VARCHAR(50) NOT NULL DEFAULT '',
    year_pub VARCHAR(4) NOT NULL DEFAULT '',
    publisher VARCHAR(50) NOT NULL DEFAULT '',
    pg_count int(4) NOT NULL DEFAULT 0,
    MSRP float NOT NULL DEFAULT 0
);

-- Student 1 has no offers, Student 2 has 3 offers, Student 3 has one offer
INSERT INTO offer(id, studentId, title, author, year_pub, publisher, pg_count, MSRP) VALUES
  (1, 1, 'Harry Potter and the Philosophers Stone', 'J.K. Rowling' , '1997', 'Bloomsbury', 223, 6.98),
  (2, 3, 'The Book Thief', 'Markus Zusak', '2005', 'Picador', 584, 14.99),
  (3, 3, 'Fahrenheit 451', 'Mugnaini', '1953', 'Ballentine Books', 256, 16.99)
;

