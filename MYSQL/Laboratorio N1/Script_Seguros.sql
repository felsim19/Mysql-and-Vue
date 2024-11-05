create database Seguros;

use Seguros;

create table Compania(
Comnit varchar(11) primary key,
Comnombre varchar(30),
Comañofun int,
Comreplegal varchar(100)
);

create table TiposAutomotores(
Auttipo int primary key
);

create table AutoMotores(
Autoplaca varchar(6) primary key,
Automarca varchar(30),
AutoTipo int,
Automodelo int,
Autonumpasajeros int,
Autocilindraje int,
Autonumchasis varchar(20),
constraint fk_aut_tip foreign key (AutoTipo) references TiposAutomotores(Auttipo)
);

create table Aseguramientos(
Asecodigo int auto_increment primary key,
Asefechainicio date,
Asefechaexpiracion date,
Asevalorasegurado int,
Aseestado varchar(10),
Asecosto int,
Aseplaca varchar(6),
constraint fk_ase_pla foreign key(Aseplaca) references AutoMotores(Autoplaca)
);

create table Incidentes(
Incicodigo int auto_increment primary key,
Incifecha date,
Inciplaca  varchar(6),
Incilugar varchar(40),
Incicantheridos int,
Incicanfatalidades int,
Incicanautosinvolucrados int,
constraint fk_inc_pla foreign key(Inciplaca) references AutoMotores(Autoplaca)
);

insert into Compania value
("800890890-2","Seguros Atlantida",1998,"Carlos Lopez"),
("899999999-1","Aseguradora Rojas",1991,"Luis Fernando Rojas"),
("899999999-5","Seguros Del Estadio",2001,"Maria Margarita Perez");

alter table TiposAutomotores add column Autnombre varchar(30);

insert into TiposAutomotores values
(1,"Automoviles"),
(2,"Camperos"),
(3,"Camiones");

insert into automotores values
("FLL420","chevrolet corsa",1,2003,5,1400,"wywzzz167kk009d25"),
("DKZ820", "renault stepway",1,2008,5,1600,"wywwzz157kk009d45"),
("KJQ920","kia sportage",2,2009,7,2000,"wywzzz157kk009d25");

insert into Aseguramientos(Asefechainicio,Asefechaexpiracion,Asevalorasegurado,Aseestado,Asecosto,Aseplaca) values
("2012-09-30","2013-09-30",30000000,"Vigente",500000,"FLL420"),
("2012-09-27","2013-09-27",35000000,"Vigente",600000,"DKZ820"),
("2011-09-28","2012-09-28",50000000,"Vencido",800000,"KJQ920");

INSERT INTO Incidentes (Incifecha, Inciplaca, Incilugar, Incicantheridos, Incicanfatalidades, Incicanautosinvolucrados) VALUES
('2024-05-15', 'FLL420', 'Calle 45 con Avenida 10', 2, 0, 1),
('2024-06-10', 'DKZ820', 'Autopista Norte', 1, 1, 2),
('2024-07-22', 'KJQ920', 'Carrera 7 con Calle 100', 0, 0, 3),
('2012-09-30', 'FLL420', 'Calle 45 con Carrera 12', 1, 0, 2);