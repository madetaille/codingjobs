Import the file `students.sql`.

In this model, students are enrolled in universities, and each student has the opportunity to support a group.
The groups are international and do not depend on a particular university.

Write the queries to display :

1. 
    SELECT * FROM students AS s, groups AS g
    WHERE s.id_group = g.id;

    SELECT * FROM students, groups
    WHERE students.id_group = groups.id;

2. 
    SELECT lastname, firstname, name
    FROM students, universities
    WHERE students.id_university = universities.id;

3. 
    SELECT lastname, firstname
    FROM students, universities
    WHERE students.id_university = universities.id
    AND universities.name = "Université de Viennes";
    # Avec LIKE ça marche aussi

4. 
    SELECT firstname, lastname
    FROM students, groups
    WHERE students.id_group = groups.id
    AND groups.name = "Club des amateurs de Confipote";

5. 
    SELECT firstname, lastname, universities.name, groups.name
    FROM students, universities, groups
    WHERE students.id_group = groups.id
    AND students.id_university = universities.id
    AND universities.name = "École Polytechnique";

6. 
    SELECT lastname, firstname, universities.name, groups.name
    FROM students, groups, universities
    WHERE students.id_group = groups.id
    AND students.id_university = universities.id
    AND groups.name LIKE "%choucroute%"
    AND universities.name = "Université de Viennes";

7. 
SELECT g.id as group_id, GROUP_CONCAT(CONCAT(CONCAT(firstname, ' '), lastname)) as members FROM students as s JOIN groups as g ON s.id_group = g.id GROUP BY group_id;
    

8. 
SELECT s.firstname, s.lastname, u.name FROM students as s JOIN universities as u ON s.id_university = u.id WHERE u.name LIKE "%Ecole%";

9. 
    SELECT students.lastname, students.firstname, universities.name
    FROM students, universities, cities
    WHERE universities.id = students.id_university
    AND cities.id = universities.id_city
    AND cities.name LIKE "Paris"

10. 
    SELECT lastname, firstname, universities.name, languages.name
    FROM students, universities, languages, groups
    WHERE students.id_university = universities.id
    AND students.id_language = languages.id
    AND students.id_group = groups.id
    AND groups.name LIKE "%choucroute%";

11. 
    SELECT cities.name
    FROM cities, universities, languages, students
    WHERE universities.id_city = cities.id
    AND students.id_university = universities.id
    AND students.id_language = languages.id
    AND languages.name = "Anglais"

12. 
    SELECT DISTINCT languages.name
    FROM languages
    INNER JOIN students     ON students.id_language = languages.id
    INNER JOIN groups       ON students.id_group = groups.id
    INNER JOIN universities ON students.id_university = universities.id
    AND groups.name LIKE "%choucroute"
    AND universities.name = "Université de Viennes";

13. 
    SELECT lastname, firstname, languages.name
    FROM students, languages, universities, cities
    WHERE students.id_language = languages.id
    AND students.id_university = universities.id
    AND universities.id_city = cities.id
    AND cities.name = "Paris";

14. 
    SELECT universities.name, students.lastname, students.firstname
    FROM universities, languages, students
    WHERE universities.id = students.id_university
    AND languages.id = students.id_language
    AND languages.name = "Allemand";

Join example 

SELECT * FROM 
(SELECT firstname, lastname, uni_name, name FROM 
 (SELECT firstname, lastname, universities.name as uni_name, id_group FROM students JOIN universities ON students.id_university = universities.id) AS first_join 
 JOIN groups ON first_join.id_group = groups.id) as second_join 
 WHERE uni_name = "École Polytechnique";
