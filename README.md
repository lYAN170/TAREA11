<p class="clase-html">
  <span>Mi Primer Markdown</span>
</p>

# TAREA 11

### Ejercicios propuestos y Resueltos.
---
### <u><em>Mi entorno de actividad para realizar mis consultas</em></u>

`<DataGrip>` : <https://www.jetbrains.com/es-es/datagrip/>

![Mi entorno de actividad para realizar mi consultas ](https://github.com/lYAN170/TAREA11/assets/169726463/c64d9648-cf19-4983-b6ad-3589d799532c)


` 
FROM:  
WHERE: 
` 

| Tipos D. | Descripción                    |
| ------------- | ------------------------------ |
| `SELECT:`      | Selecciona las columnas que quiero .       |
| `FROM:`   | estoy seleccionando los datos de la tabla.     |
| `WHERE:`   | Filtra los datos y se utiliza para especificar condiciones que deben cumplirse para que   una fila sea incluida en el resultado de la consulta.     |

---

| Tipos D. | Descripción                    |
| ------------- | ------------------------------ |
| `SELECT:`      | Esto especifica las columnas que queremos incluir en el resultado de la consulta.       |
| `FROM:`   | Esto indica que la tabla principal de la que se van a seleccionar los datos, La letra E. esta mencionando a una tabla.     |
| `JOIN:`   | Esta especificando la condición de unión de 2 tablas.     |
| `JOIN:`   | en es este caso está uniendo con la tabla Proyecto " P "     |
| `WHERE:`   |  lo filtra las filas que se incluyen en el resultado.     |

---


## 1. Consulta de Proyecto:
¿Cuáles son los identificadores y nombres de todos los proyectos existentes en la empresa? (Preformatted Text).

    SELECT IDProyecto, NombreProyecto
    FROM Proyecto;

#### Resultado:
![Imagen3](https://github.com/lYAN170/TAREA11/assets/169726463/d6452a7e-dfe0-4ebc-a06e-139456c847ba)


## 2. Consulta de Proyectos por Ubicación:
¿Cuáles son los proyectos que se desarrollan en 'CHICAGO'?

    SELECT IDProyecto, NombreProyecto, Ubicacion
    FROM Proyecto
    WHERE Ubicacion = 'CHICAGO';
#### Resultado:
![Imagen4](https://github.com/lYAN170/TAREA11/assets/169726463/402e5b21-62c4-412d-8d85-2330314777d7)

## 3. Consulta de Proyectos por Departamento:
¿Cuáles son los proyectos que pertenecen al departamento con identificador 2?

    SELECT IDProyecto, NombreProyecto
    FROM Proyecto
    WHERE IDDepartamento = 2;
#### Resultado:
![Imagen5](https://github.com/lYAN170/TAREA11/assets/169726463/7d7c11e6-8bc7-4c34-8048-4cc1d5d5bf7d)


## 4. Consulta de Proyectos y Departamentos:
¿Cuáles son los nombres y ubicaciones de los proyectos junto con los nombres de sus departamentos asociados?

    SELECT P.NombreProyecto, P.Ubicacion, D.NombreDepartamento
    FROM Proyecto P
    JOIN Departamento D ON P.IDDepartamento = D.IDDepartamento;
#### Resultado:
![Imagen6](https://github.com/lYAN170/TAREA11/assets/169726463/830e0c9a-eadf-47e9-8bab-a42c5e7dc2b0)

## 5. Consulta de Empleados por Proyecto:
¿Qué empleados están asignados al proyecto identificado con el número 4, y cuáles son sus nombres?

    SELECT E.IDEmpleado, E.NombreEmpleado
    FROM Empleado E
    JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
    WHERE EP.IDProyecto = 4;

#### Resultado:
![Imagen17](https://github.com/lYAN170/TAREA11/assets/169726463/8b1257ae-123b-40c6-82a1-4c7c6c69eff0)

## 6. Consulta de Proyectos por Empleado:
¿En qué proyectos está participando el empleado con el identificador 4, y cuáles son los nombres de esos proyectos?

    SELECT P.IDProyecto, P.NombreProyecto
    FROM Proyecto P
    JOIN EmpleadoProyecto EP ON P.IDProyecto = EP.IDProyecto
    WHERE EP.IDEmpleado = 4;
#### Resultado:
![Imagen7](https://github.com/lYAN170/TAREA11/assets/169726463/a49704ea-36a2-4e0c-83b9-41dda9ad66e4)

## 7. Consulta de Horas Trabajadas por Proyecto:
¿Cuántas horas han trabajado en total los empleados en el proyecto con identificador 2?

    SELECT SUM(EP.HorasTrabajadas) AS TotalHoras
    FROM EmpleadoProyecto EP
    WHERE EP.IDProyecto = 2;
#### Resultado:
![Imagen8](https://github.com/lYAN170/TAREA11/assets/169726463/7c75e569-ebfd-41ae-8194-b83300ef4e32)

## 8. Consulta de Empleados con Horas Trabajadas:
¿Cuáles son los empleados que han trabajado más de 10 horas en el proyecto con identificador 2?

    SELECT E.IDEmpleado, E.NombreEmpleado
    FROM Empleado E
    JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
    WHERE EP.IDProyecto = 2 AND EP.HorasTrabajadas > 10;
#### Resultado:
![Imagen9](https://github.com/lYAN170/TAREA11/assets/169726463/5be084d2-9cab-425b-a6f7-fcbbfa5685f9)

## 9. Consulta de Total de Horas por Empleado:
¿Cuál es el total de horas trabajadas por cada empleado en todos los proyectos?

    SELECT E.NombreEmpleado, SUM(EP.HorasTrabajadas) AS TotalHoras
    FROM Empleado E
    JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
    GROUP BY E.IDEmpleado, E.NombreEmpleado;
#### Resultado:
![Imagen10](https://github.com/lYAN170/TAREA11/assets/169726463/7215cf9e-83e2-4219-9ddc-1a897987cf02)

## 10. Consulta de Empleados con Múltiples Proyectos:
¿Cuáles son los empleados que trabajan en más de un proyecto?

    SELECT E.NombreEmpleado, COUNT(EP.IDProyecto) AS Proyectos
    FROM Empleado E
    JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
    GROUP BY E.IDEmpleado, E.NombreEmpleado
    HAVING COUNT(EP.IDProyecto) > 1;
#### Resultado:
![Imagen11](https://github.com/lYAN170/TAREA11/assets/169726463/76d27b2f-f7d9-4985-af12-831fee34ffc1)

## 11. Consulta de Empleados y Horas Totales:
¿Cuáles son los empleados que han trabajado más de 30 horas en total en todos los proyectos?

    SELECT E.IDEmpleado, E.NombreEmpleado, SUM(EP.HorasTrabajadas) AS TotalHoras
    FROM Empleado E
    JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
    GROUP BY E.IDEmpleado, E.NombreEmpleado
    HAVING SUM(EP.HorasTrabajadas) > 30;
#### Resultado:
![Imagen12](https://github.com/lYAN170/TAREA11/assets/169726463/56517c02-7e9d-4c6a-a303-1de6d22016ad)

## 12. Consulta de Proyectos y Horas Promedio:
¿Cuál es el promedio de horas trabajadas por proyecto?

    SELECT P.IDProyecto, P.NombreProyecto, AVG(EP.HorasTrabajadas) AS PromedioHoras
    FROM Proyecto P
    JOIN EmpleadoProyecto EP ON P.IDProyecto = EP.IDProyecto
    GROUP BY P.IDProyecto, P.NombreProyecto;

#### Resultado:
![Imagen13](https://github.com/lYAN170/TAREA11/assets/169726463/369d0e02-71c1-4998-b903-296bda21fb2b)

# Consultas avanzadas:
---
## Pregunta 1: Empleados en Proyectos Específicos y con Salario Alto
¿Cuáles son los empleados que trabajan en proyectos ubicados en 'CHICAGO' y que tienen un salario (con o sin comisión) superior a 2000?

    SELECT E.IDEmpleado, E.NombreEmpleado, E.Salario, E.comision, P.NombreProyecto
    FROM Empleado E
    JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
    JOIN dbo.Proyecto P on P.IDProyecto = EP.IDProyecto
    WHERE P.Ubicacion = 'CHICAGO' AND (E.Salario + COALESCE(E.Comision, 0)) > 200;
#### Resultado:
![Imagen14](https://github.com/lYAN170/TAREA11/assets/169726463/72fede52-a510-434c-984e-7a8f70122f74)

## Pregunta 2: Empleados con Jefe y en Proyectos Múltiples
¿Cuáles son los empleados que tienen un jefe, están asignados a más de un proyecto, y han trabajado más de 15 horas en total en todos los proyectos combinados?

    SELECT E.IDEmpleado, E.NombreEmpleado, SUM(EP.HorasTrabajadas) AS TotalHoras
    FROM Empleado E
    JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
    WHERE E.IDJefe IS NOT NULL
    GROUP BY E.IDEmpleado, E.NombreEmpleado
    HAVING COUNT(EP.IDProyecto) > 1 AND SUM(EP.HorasTrabajadas) > 15;

#### Resultado:
![Imagen15](https://github.com/lYAN170/TAREA11/assets/169726463/82378997-ce21-4225-9a6f-15bcdabbf045)

## Pregunta 3: Empleados sin Comisión en Departamentos Específicos
¿Cuáles son los empleados que no reciben comisión y trabajan en departamentos ubicados en 'DALLAS' o 'NEW YORK'?

    SELECT E.IDEmpleado, E.NombreEmpleado, D.NombreDepartamento, D.Ubicacion
    FROM Empleado E
    JOIN Departamento D ON E.IDDepartamento = D.IDDepartamento
    WHERE E.Comision IS NULL AND (D.Ubicacion = 'DALLAS' OR D.Ubicacion = 'NEW YORK');

#### Resultado:
![Imagen16](https://github.com/lYAN170/TAREA11/assets/169726463/18e0bd16-a6e7-402d-bd3e-6a9c7ca257a3)

