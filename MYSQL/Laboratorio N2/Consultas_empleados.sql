CREATE DATABASE EMPLEADOS;
use empleados;
CREATE TABLE departamento (
 CODIGO_DEPART int(11) NOT NULL,
 NOMBRE varchar(20) NOT NULL,
 LOCALIDAD varchar(20) DEFAULT NULL,
 PRIMARY KEY (CODIGO_DEPART)
);
INSERT INTO departamento (CODIGO_DEPART, NOMBRE,
LOCALIDAD) VALUES
(10, 'CONTABILIDAD', 'SEVILLA'),
(20, 'INVESTIGACION', 'MADRID'),
(30, 'VENTAS', 'BARCELONA'),
(40, 'PRODUCCION', 'BILBAO');
CREATE TABLE empleado (
 CODIGO_EMPLEADO int(11) NOT NULL,
 APELLIDO varchar(20) NOT NULL,
 OFICIO varchar(20) NOT NULL,
 DIRECCION int(11) DEFAULT NULL,
 FECHA_INGRESO date NOT NULL,
 SALARIO int(11) NOT NULL,
 COMISION int(11) DEFAULT NULL,
 departamento int(11) NOT NULL,
 PRIMARY KEY (CODIGO_EMPLEADO),
 FOREIGN KEY (departamento) references
departamento(codigo_depart)
);
INSERT INTO empleado (CODIGO_EMPLEADO, APELLIDO, OFICIO,
DIRECCION, FECHA_INGRESO, SALARIO, COMISION, departamento) VALUES
(7369, 'SANCHEZ', 'EMPLEADO', 7902, '1980-12-17', 104000, NULL,
20),
(7499, 'ARROYO', 'VENDEDOR', 7698, '1980-02-20', 108000, 39000,
30),
(7521, 'SALA', 'VENDEDOR', 7698, '1981-02-22', 162500, 162500,
30),
(7566, 'JIMENEZ', 'DIRECTOR', 7839, '1981-04-02', 386750, NULL,
20),
(7654, 'MARTIN', 'VENDEDOR', 7698, '1981-09-29', 162500, 182000,
30),
(7698, 'NEGRO', 'DIRECTOR', 7839, '1981-05-01', 370500, NULL, 30),
(7788, 'GIL', 'ANALISTA', 7566, '1981-11-09', 390000, NULL, 20),
(7839, 'REY', 'PRESIDENTE', NULL, '1981-11-17', 650000, NULL, 10),
(7844, 'TOVAR', 'VENDEDOR', 7698, '1981-08-09', 195000, 0, 30),
(7876, 'ALONSO', 'EMPLEADO', 7788, '1981-09-23', 143000, NULL,
20),
(7900, 'JIMENO', 'EMPLEADO', 7698, '1981-12-03', 1235000, NULL,
30),
(7902, 'FERNANDEZ', 'ANALISTA', 7566, '1981-12-03', 390000, NULL,
20),
(7934, 'MUÃ‘OZ', 'EMPLEADO', 7782, '1982-01-23', 169000, NULL,
10);

-- Mostrar el apellido, oficio y número de departamento de cada empleado
select apellido, oficio,departamento from empleado;

-- Mostrar el número, nombre y localización de cada departamento.
select CODIGO_DEPART,nombre,localidad from departamento;

-- Mostrar todos los datos de todos los empleados.
select * from empleado;

-- Datos de los empleados ordenados por apellidos.
select * from empleado order by apellido;

-- Datos de los empleados ordenados por número de departamento descendentemente.
select * from empleado order by departamento desc;

-- Datos de los empleados ordenados por número de departamento descendentemente y dentro de cada departamento ordenados por apellido ascendentemente.
select * from empleado order by departamento desc,apellido asc;

-- Mostrar los datos de los empleados cuyo salario sea mayor que 200000.
select * from empleado where salario > 200000;

-- Mostrar los datos de los empleados cuyo oficio sea ʻANALISTAʼ.
select * from empleado where oficio = 'ANALISTA';

-- Seleccionar el apellido y oficio de los empleados del departamento número 20.
select apellido, oficio from empleado where departamento = 20;

-- Mostrar todos los datos de los empleados ordenados por apellido.	
select * from empleado order by apellido;

-- Seleccionar los empleados cuyo oficio sea ʻVENDEDORʼ. Mostrar los datos ordenados por apellido.
select * from empleado where oficio = 'VENDEDOR' order by apellido;

-- Mostrar los empleados cuyo departamento sea 10 y cuyo oficio sea ʻANALISTAʼ. Ordenar el resultado por apellido.
select * from empleado where departamento = 10 and oficio = 'ANALISTA' order by apellido;

-- Mostrar los empleados que tengan un salario mayor que 200000 o que pertenezcan al departamento número 20.
select * from empleado where salario > 200000 or departamento = 20;

-- Ordenar los empleados por oficio, y dentro de oficio por nombre
select * from empleado order by oficio,apellido;

-- Seleccionar de la tabla EMPLE los empleados cuyo apellido empiece por ʻAʼ.
select * from empleado where apellido like 'a%';

-- Seleccionar de la tabla EMPLE los empleados cuyo apellido termine por ʻZʼ.
select * from empleado where apellido like '%z';

-- Seleccionar de la tabla EMPLE aquellas filas cuyo APELLIDO empiece por ʻAʼ y el OFICIO tenga una ʻEʼ en cualquier posición.
select * from empleado where apellido like 'a%' and oficio like'%e%';

-- • Seleccionar los empleados cuyo salario esté entre 100000 y 200000. Utilizar el operador BETWEEN.
select * from empleado where salario between 100000 and 200000;

-- Obtener los empleados cuyo oficio sea ʻVENDEDORʼ y tengan una comisión superior a 100000.
select * from empleado where oficio = 'VENDEDOR' and comision > 100000;

-- Seleccionar los datos de los empleados ordenados por número de departamento, y dentro de cada departamento ordenados por apellido.
select * from empleado order by departamento,apellido;

-- Número y apellidos de los empleados cuyo apellido termine por ʻZʼ y tengan un salario superior a 300000.
select CODIGO_EMPLEADO,apellido,salario from empleado where apellido like '%z' and salario > 300000;

-- Datos de los departamentos cuya localización empiece por ʻBʼ
select * from departamento where localidad like 'b%';

-- Datos de los empleados cuyo oficio sea ʻEMPLEADOʼ, tengan un salario superior a 100000 y pertenezcan al departamento número 10.
select * from empleado where oficio = 'EMPLEADO' and salario > 100000 and departamento = 10;

-- Mostrar los apellidos de los empleados que no tengan comisión.
select * from empleado where comision is null;

-- Mostrar los apellidos de los empleados que no tengan comisión y cuyo apellido empiece por ʻJʼ.
select * from empleado where comision is null and apellido like 'j%';

-- Mostrar los apellidos de los empleados cuyo oficio sea ʻVENDEDORʼ,ʻANALISTAʼ o ʻEMPLEADOʼ.
select * from empleado where oficio in ('VENDEDOR', 'ANALISTA', 'EMPLEADO');

-- Mostrar los apellidos de los empleados cuyo oficio no sea ni ʻANALISTAʼ ni ʻEMPLEADOʼ, y además tengan un salario mayor de 200000.
select * from empleado where oficio not in ('ANALISTA', 'EMPLEADO') and salario > 200000;

-- Seleccionar de la tabla EMPLE los empleados cuyo salario esté entre 200000 y 300000 (utilizar BETWEEN).
select * from empleado where salario between 200000 and 300000;

-- Seleccionar el apellido, salario y número de departamento de los empleados cuyo salario sea mayor que 200000 en los departamentos 10 ó 30.
select apellido,salario,departamento from empleado where salario > 200000 and departamento in (10,30);

-- Mostrar el apellido y número de los empleados cuyo salario no esté entre 100000 y 200000 (utilizar BETWEEN)
select apellido,CODIGO_EMPLEADO,salario from empleado where salario not between 100000 and 200000;

-- Obtener los apellidos de todos los empleados en minúscula
select lower(apellido) from empleado;

-- En una consulta concatena el apellido de cada empleado con su oficio.
select concat(apellido, ' ' , oficio) as empleado_oficio from empleado;

-- • Mostrar el apellido y la longitud del apellido (función LENGTH) de todos los empleados, ordenados por la longitud de los apellidos de los empleados descendentemente.
select apellido, length(apellido) as longitud_Apellido from empleado order by longitud_Apellido desc;

-- Obtener el año de contratación de todos los empleados (función YEAR).
select year(FECHA_INGRESO) as año_ingreso from empleado;

-- Mostrar los datos de los empleados que hayan sido contratados en el año 1981.
select * from empleado where year(FECHA_INGRESO) = 1981;

--  .Mostrar los datos de los empleados que hayan sido contratados en el mes de febrero de cualquier año (función MONTHNAME).
select * from empleado where monthname(fecha_ingreso)='February';

-- Para cada empleado mostrar el apellido y el mayor valor del salario y la comisión que tienen
select apellido, salario, comision from empleado order by salario desc;

-- Mostrar los datos de los empleados cuyo apellido empiece por 'A' y hayan sido contratados en el año 1980.
select * from empleado where apellido like 'a%' and year(fecha_ingreso) = 1980;

-- Mostrar los datos de los empleados del departamento 10 que no tengan comisión
select * from empleado where departamento = 10 and comision is null;