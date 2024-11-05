create database inmuebles;

use inmuebles;

create table Ciudad (
id_ciudad int not null primary key,
ciudad varchar(20) 
);

insert into Ciudad values
(7845,"Bogota"),
(4578,"Medellin"),
(8956,"Cali"),
(9856,"Cucuta"),
(1235,"Santa Marta");

create table Departamentos(
id_departamentos int not null primary key,
departamento varchar(20)
);

insert into Departamentos values
(38,"Cundinamarca"),
(41,"Bogota"),
(43,"Antioquia"),
(45,"Caribe"),
(47,"Putumayo");


create table Propietarios(
id_propetario int not null primary key,
nombre varchar(30),
apellido varchar(40),
direccion varchar(50),
telefono varchar(15),
id_ciudad int not null,
id_departamento int not null,
constraint fk_id_ciu foreign key (id_ciudad) references Ciudad(id_ciudad),
constraint fk_id_dep foreign key (id_departamento) references Departamentos(id_departamentos)
);

insert into Propietarios values
(200,"Julian","Sierra","Calle 15a N9-15","3107486450",4589,41),
(105,"Felipe","Martinez","Calle 18b N20-12","3023901563",4578,43),
(107,"Mateo","Gamboa","Calle 17c N19-05","3112785520",1235,45),
(109,"Sebastian","Carrillo","Calle 12d N19-18","310748695",9856,47),
(111,"Juan","Cita","Calle 15a N20-15","3012563694",9856,38);

create table Inmuebles(
id_inmueble int not null primary key,
direccion varchar(50),
barrio varchar(20),
id_ciudad int not null,
id_departamento int not null,
anio int,
tipo varchar(30),
superficie int,
dormitorios int,
garaje bit,
precio float,
observaciones varchar(100),
id_propietario int not null,
constraint fk_id_ciudad foreign key (id_ciudad) references Ciudad(id_ciudad),
constraint fk_id_depart foreign key (id_departamento) references Departamentos(id_departamentos),
constraint fk_id_pro foreign key (id_propietario) references Propietarios(id_propetario)
);

insert into inmuebles values
(963852,"Calle 15a N-9-15","Los rosales",7845,41,2010,"Casa",300000,3,1,20000000,"Exelente Estado",103),
(741852,"Calle 18b N20-12","La paz",4578,43,2008,"Apartamento",400000,3,1,22000000,"Exelente Estado",105),
(321456,"Calle 15a N-9-15","Santa Isabel",1235,45,2012,"Apartamento",200000,2,0,15000000,"mediano Estado",107),
(654789,"Calle 15a N-9-15","San Juan",9856,47,2016,"Casa",500000,4,0,28000000,"mediano Estado",109),
(258746,"Calle 15a N-9-15","San Jose",9856,38,2015,"Casa",600000,5,1,35000000,"Exelente Estado",111);

create table Arrendatarios(
id_arrendatario int auto_increment not null primary key,
nombre varchar(30),
apellido varchar(40),
fecha_nac date,
sexo enum('Hombre','Mujer','Otros'),
estado_civil enum('Soltero','Casado')  
);

insert into Arrendatarios(nombre,apellido,fecha_nac,sexo,estado_civil) values
("Oscar","Diaz","2002-10-04","Hombre","Soltero"),
("Miguel","Gonzales","2002-06-06","Hombre","Soltero"),
("Samuel","Heredia","2000-08-04","Hombre","Soltero"),
("Alejo","Granados","2001-04-14","Hombre","Soltero"),
("Camilo","Sanchez","1999-02-24","Hombre","Soltero");

create table Alquileres(
id_alquiler int not null primary key,
id_inmueble int,
id_arrendatario int,
fecha_inicio date,
fecha_fin date,
Forma_pago varchar(20),
constraint fk_id_inm foreign key (id_inmueble) references inmuebles(id_inmueble),
constraint fk_id_arr foreign key (id_arrendatario) references Arrendatarios(id_arrendatario)
);

insert into Alquileres values
(9,963852,1,"2024-08-13","2025-08-13","Efectivo"),
(10,741852,2,"2024-05-03","2025-05-03","Efectivo"),
(11,321456,3,"2024-06-07","2025-06-07","Tarjeta"),
(12,654789,4,"2024-11-23","2025-11-23","Efectivo"),
(13,258746,5,"2024-12-31","2025-11-23","Tarjeta");




