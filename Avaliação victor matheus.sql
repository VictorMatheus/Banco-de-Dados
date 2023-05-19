use avaliação;

SELECT COUNT(country_name) AS total
FROM country;

SELECT *
FROM ranking_system;

SELECT COUNT(DISTINCT university_name) AS total_universidades
FROM university;

SELECT AVG(student_staff_ratio) AS media_student_staff_ratio
FROM university_year;