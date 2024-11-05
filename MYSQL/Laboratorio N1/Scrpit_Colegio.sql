create database Colegio; 

use colegio;

create table Alumnos(
Cod_Alumnos int auto_increment primary key,
Nombre varchar(25) not null,
Primer_Apellido varchar(40) not null,
Segundo_Apellido varchar(40),
Ciudad varchar(40),
Direccion varchar(30) not null,
Telefono varchar(14) not null,
Fecha_Nacimiento date,
Identificacion varchar(25) not null,
No_Identificacion int not null 
);

create table Profesores(
Cod_De_Profesor int auto_increment primary key,
Nombre varchar(25) not null,
Primer_Apellido varchar(40) not null,
Segundo_Apellido varchar(40),
Ciudad varchar(40),
Direccion varchar(30) not null,
Telefono varchar(14),
Fecha_Nacimiento date not null,
No_Identificacion int not null
);

create table Curso(
Cod_Curso int primary Key,
Curso varchar(20) not null,
Cod_De_Profesor int not null,
Fecha_Inicio date,
Fecha_Fin date,
Incidencias varchar(50),
constraint fk_cod_profesor foreign key (Cod_De_Profesor) references Profesores(Cod_De_Profesor)
);

create table Evaluaciones(
Cod_Evaluacion int auto_increment primary key,
Cod_Alumno int not null,
Cod_Curso int not null,
Cod_De_Profesor int not null,
Nota_Final float,
Observaciones varchar(50),
constraint fk_cod_alumno foreign key (Cod_Alumno) references Alumnos(Cod_Alumnos),
constraint fk_cod_´pro foreign key (Cod_De_Profesor) references Profesores(Cod_De_Profesor),
constraint fk_cod_curso foreign key (Cod_Curso) references Curso(Cod_Curso)
);

-- insertar datos

describe alumnos;

insert into Alumnos values
(1,"Julian","Sierra","Martinez","Sibate","Calle 15a N 9-15", "3107486450","2002-10-04","Cedula",1000728492),
(2,"Maria","Amaya","Sierra","Sibate","Calle 12b N 4-20", "3107658965","1994-10-09","Cedula",1022400899),
(3,"Alan","Sierra","Gomez","Sibate","Calle 16c N 10-18", "3019685320","2015-07-13","Tarejta Identidad",1025459865),
(4,"Leidy","Amaya","Sierra","Sibate","Calle 8a N 75-20", "3023901563","1988-02-04","Cedula",1024480548),
(5,"Hilda","Sierra","Rojas","Sibate","Calle 9b N 7-30", "3084509685","1969-02-10","Cedula",39724088),
(6,"Jesus","Sierra","Rojas","Sibate","Calle 18c N 8-30", "3096301240","1978-03-23","Cedula",79987608),
(7,"Oscar","Gonzales","Clavijo","Sibate","Calle 25d N 6-30", "3045209630","2002-03-04","Cedula",2000745650),
(8,"Mateo","Gamboa","Correa","Sibate","Calle 19a N 7-40", "3084509560","2002-12-22","Cedula",300024569),
(9,"Erick","Torres","Briceño","Sibate","Calle 13b N 8-20", "3096504210","2000-08-14","Cedula",753042698),
(10,"Felipe","Parra","Castañeda","Sibate","Calle 18c N 9-20", "3107509840","2008-12-01","Tarjeta Identidad",1023026845);

insert into Profesores values
(1,"Andres","Beltran","Romero","Sibate","Calle 78a N 9-15", "3112785520","1987-10-14",39785620),
(2,"Kevin","Chavez","Sosa","Sibate","Calle 75b N 4-20", "3125568950","1994-10-09",15029630),
(3,"Laura","Granados","Gomez","Sibate","Calle 76c N 10-18", "3134502345","1980-07-13",75482560),
(4,"Marta","Parra","Vazques","Sibate","Calle 98a N 75-20", "3085068956","1988-02-04",95632540),
(5,"Alejandra","Velazques","Vargas","Sibate","Calle 109b N 7-30", "3024534120","1969-02-10",84520563);

insert into curso values
(1,"Access", 1, "2024-01-10","2024-04-10","Ninguna"),
(2,"Word", 2, "2024-02-10","2024-05-10","Ninguna"),
(3,"PowerPoint", 3, "2024-03-10","2024-06-10","Ninguna"),
(4,"Excel", 4, "2024-04-10","2024-07-10","Ninguna"),
(5,"Contabilidad", 5, "2024-05-10","2024-08-10","Ninguna");

insert into Evaluaciones values
(1,1,1,1,4.5,"La Nota Final es 4.5"),
(2,1,5,5,4.0,"La Nota Final es 4.0"),
(3,2,2,2,3.5,"La Nota Final es 3.5"),
(4,2,3,3,2.5,"La Nota Final es 2.5"),
(5,3,4,4,3.8,"La Nota Final es 3.8"),
(6,3,1,1,4.1,"La Nota Final es 4.1"),
(7,4,5,5,2.7,"La Nota Final es 2.7"),
(8,4,2,2,3.4,"La Nota Final es 3.4"),
(9,5,3,3,3.9,"La Nota Final es 3.9"),
(10,5,4,4,4.1,"La Nota Final es 4.1"),
(11,6,5,5,3.7,"La Nota Final es 3.7"),
(12,6,1,1,4.3,"La Nota Final es 4.3"),
(13,7,2,2,3.8,"La Nota Final es 3.8"),
(14,7,4,4,3.6,"La Nota Final es 3.6"),
(15,8,3,3,1.5,"La Nota Final es 1.5"),
(16,8,5,5,3.1,"La Nota Final es 3.1"),
(17,9,1,1,4.9,"La Nota Final es 4.9"),
(18,9,2,2,4.0,"La Nota Final es 4.0"),
(19,10,3,3,2.5,"La Nota Final es 2.5"),
(20,10,4,4,4.7,"La Nota Final es 4.7");

select * from evaluaciones;
