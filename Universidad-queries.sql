1. SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = "Alumno" ORDER BY apellido1,apellido2,nombre; 

2. SELECT nombre,apellido1, apellido2 FROM persona WHERE tipo = "alumno" AND telefono is NULL;

3. SELECT * FROM persona WHERE fecha_nacimiento LIKE "1999%";

4. SELECT * FROM persona WHERE tipo = "profesor" AND telefono is NULL AND nif LIKE "%K";

5. SELECT * FROM asignatura WHERE curso = 3 AND cuatrimestre = 1 AND id_grado = 7;

6. SELECT persona.apellido1,persona.apellido2,persona.nombre,departamento.nombre FROM persona JOIN universidad.profesor ON profesor.id_profesor = persona.id JOIN universidad.departamento ON departamento.id = profesor.id_departamento ORDER BY apellido1 ASC, apellido2 ASC, persona.nombre ASC;

7. SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN universidad.alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id JOIN universidad.asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id JOIN universidad.curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE ni
f="26902806M";

8. SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON profesor.id_departamento = departamento.id JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor JOIN grado ON grado.id = asignatura.id_grado WHERE grado.nombre = "Grado en Ingeniera Informtica (Plan 2015)";

9. SELECT DISTINCT persona.nombre,persona.apellido1,persona.apellido2 FROM persona JOIN alumno_se_matricula_asign
atura ON alumno_se_matricula_asignatura.id_alumno = persona.id JOIN curso_escolar ON curso_escolar.id = alumno_se_mat
ricula_asignatura.id_curso_escolar WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;



Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

1. SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento;

2. SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE departamento.id IS NULL;

3. SELECT departamento.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id RIGHT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.nombre IS NULL;

4. SELECT persona.nombre,persona.apellido1,persona.apellido2 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON asignatura.id = profesor.id_profesor WHERE asignatura.id IS NULL;

5. SELECT asignatura.nombre FROM asignatura LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;

6. SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento
LEFT JOIN asignatura ON asignatura.id_profesor  = profesor.id_profesor  LEFT JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id WHERE alumno_se_matricula_asignatura.id_curso_escolar IS
NULL;


Consultes resum:

1. SELECT COUNT(*) FROM persona WHERE tipo = "alumno";

2. SELECT COUNT(*) FROM persona WHERE SUBSTRING(fecha_nacimiento,1,4) = 1999;

3. SELECT departamento.nombre,COUNT(profesor.id_profesor) AS Numero_de_profesores FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre HAVING Numero_de_profesores>0 ORDER
BY Numero_de_profesores;

4. SELECT departamento.nombre,COUNT(profesor.id_profesor) AS Numero_de_profesores FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre;

5. SELECT grado.nombre, COUNT(asignatura.id) AS Numero_de_asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY Numero_de_asignaturas;

6. SELECT grado.nombre, COUNT(asignatura.id) AS Numero_de_asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre HAVING Numero_de_asignaturas > 40 ORDER BY Numero_de_asignaturas;

7. SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) AS Numero_de_creditos FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre,asignatura.tipo ORDER BY grado.nombre,Numero_de_credit
os DESC;

8. SELECT curso_escolar.anyo_inicio,COUNT(alumno_se_matricula_asignatura.id_alumno) FROM curso_escolar LEFT JOIN
alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id GROUP BY curso_escolar.anyo_inicio;

9. SELECT profesor.id_profesor,persona.nombre,persona.apellido1,persona.apellido2,COUNT(asignatura.id) FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor GROUP BY profesor.id_profesor,persona.nombre,persona.apellido1,persona.apellido2 ORDER BY COUNT(asignatur
a.id) DESC;

10. SELECT * FROM persona ORDER BY fecha_nacimiento DESC LIMIT 1;

11. SELECT profesor.id_profesor,persona.nombre,persona.apellido1,persona.apellido2 FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento LEFT JOIN
asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE profesor.id_profesor IS NULL;
