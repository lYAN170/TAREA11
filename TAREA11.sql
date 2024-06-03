

"EJERCICIO 1";

SELECT IDProyecto, NombreProyecto
FROM Proyecto;

"EJERCICIO 2";

SELECT IDProyecto, NombreProyecto, Ubicacion
FROM Proyecto
WHERE Ubicacion = 'CHICAGO';

"EJERCICIO 3";

SELECT IDProyecto, NombreProyecto
FROM Proyecto
WHERE IDDepartamento = 2;

"EJERCICIO 4";

SELECT P.NombreProyecto, P.Ubicacion, D.NombreDepartamento
FROM Proyecto P
JOIN Departamento D ON P.IDDepartamento = D.IDDepartamento;

"EJERCICIO 5";

SELECT E.IDEmpleado, E.NombreEmpleado
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
WHERE EP.IDProyecto = 4;

"EJERCICIO 6";

SELECT P.IDProyecto, P.NombreProyecto
FROM Proyecto P
JOIN EmpleadoProyecto EP ON P.IDProyecto = EP.IDProyecto
WHERE EP.IDEmpleado = 4;


"EJERCICIO 7";

SELECT SUM(EP.HorasTrabajadas) AS TotalHoras
FROM EmpleadoProyecto EP
WHERE EP.IDProyecto = 2;

"EJERCICIO 8";

SELECT E.IDEmpleado, E.NombreEmpleado
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
WHERE EP.IDProyecto = 2 AND EP.HorasTrabajadas > 10;

"EJERCICIO 9";

SELECT E.NombreEmpleado, SUM(EP.HorasTrabajadas) AS TotalHoras
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
GROUP BY E.IDEmpleado, E.NombreEmpleado;

"EJERCICIO 10";

SELECT E.NombreEmpleado, COUNT(EP.IDProyecto) AS Proyectos
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
GROUP BY E.IDEmpleado, E.NombreEmpleado
HAVING COUNT(EP.IDProyecto) > 1;

"EJERCICIO 11";

SELECT E.IDEmpleado, E.NombreEmpleado, SUM(EP.HorasTrabajadas) AS TotalHoras
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
GROUP BY E.IDEmpleado, E.NombreEmpleado
HAVING SUM(EP.HorasTrabajadas) > 30;

"EJERCICIO 12";

SELECT P.IDProyecto, P.NombreProyecto, AVG(EP.HorasTrabajadas) AS PromedioHoras
FROM Proyecto P
JOIN EmpleadoProyecto EP ON P.IDProyecto = EP.IDProyecto
GROUP BY P.IDProyecto, P.NombreProyecto;



"Consultas avanzadas";

"Empleados en Proyectos Específicos y con Salario Alto";
"Ejercicio 1";

SELECT E.IDEmpleado, E.NombreEmpleado, E.Salario, E.comision, P.NombreProyecto
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
JOIN dbo.Proyecto P on P.IDProyecto = EP.IDProyecto
WHERE P.Ubicacion = 'CHICAGO' AND (E.Salario + COALESCE(E.Comision, 0)) > 200;

"ejercicio2"
"Empleados con Jefe y en Proyectos Múltiples"

SELECT E.IDEmpleado, E.NombreEmpleado, SUM(EP.HorasTrabajadas) AS TotalHoras
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
WHERE E.IDJefe IS NOT NULL
GROUP BY E.IDEmpleado, E.NombreEmpleado
HAVING COUNT(EP.IDProyecto) > 1 AND SUM(EP.HorasTrabajadas) > 15;

"Ejercicio 3";
"Empleados sin Comisión en Departamentos Específicos";

SELECT E.IDEmpleado, E.NombreEmpleado, D.NombreDepartamento, D.Ubicacion
FROM Empleado E
JOIN Departamento D ON E.IDDepartamento = D.IDDepartamento
WHERE E.Comision IS NULL AND (D.Ubicacion = 'DALLAS' OR D.Ubicacion = 'NEW YORK');


