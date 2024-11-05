create database Alquiler;

use Alquiler;

create table Cliente(
Id_cliente int auto_increment primary key,
Direccioncliente varchar(60) not null,
Telefono int not null,
Nombrecliente varchar(60) not null,
email varchar(80),
Nro_dni int not null,
Fechanacimiento date,
Fechainscripcion date,
Temainteres varchar(40),
Estado varchar(20)
);

create table Sancion(
Id_sancio int primary key,
Id_cliente int,
Tiposancion int not null,
Nrodiassancion int not null,
constraint fk_id_cli foreign key(Id_cliente) references Cliente(Id_cliente)
);

create table Alquiler(
Id_alquiler int primary key,
Id_cliente int,
Fechaalquiler date not null,
Valoralquiler int not null,
constraint fk_id_cliente foreign key(Id_cliente) references Cliente(Id_cliente)
);

create table Titulo(
Id_titulo int primary key,
Titulo varchar(100) not null,
Año int,
Tema varchar(100) not null,
Productora varchar(100),
Director varchar(100),
Idioma varchar(60) not null,
Calificacion float(8),
Estado_titulo varchar(40)
);

create table Cd(
Id_cd int primary key,
Nro_cd int,
condicion varchar(40) not null,
Ubicacion varchar(60) not null,
Estado varchar(60) not null,
Id_Titulo int,
constraint fk_id_tit foreign key(Id_Titulo) references Titulo(Id_titulo)
);

create table Detalle_Alquiler(
Id_detalle int primary key,
Id_alquiler int not null,
Id_cd int not null,
Diasprestamo int not null,
Fechadevoluvion date not null,
constraint fk_id_alq foreign key (Id_alquiler) references Alquiler(Id_alquiler),
constraint fk_id_cd foreign key (Id_cd) references Cd(Id_cd)
);

INSERT INTO cliente (Direccioncliente, Telefono, Nombrecliente, email, Nro_dni, Fechanacimiento, Fechainscripcion, Temainteres, estado) VALUES
('Calle Falsa 123', 5551234, 'Juan Pérez', 'juan.perez@example.com', 12345678, '1980-05-15', '2024-08-01', 'Deportes', 'Activo'),
('Avenida Siempre Viva 742', 5555678, 'María Gómez', 'maria.gomez@example.com', 87654321, '1992-07-22', '2024-08-01', 'Tecnología', 'Activo'),
('Plaza Mayor 456', 5559876, 'Carlos Ruiz', 'carlos.ruiz@example.com', 11223344, '1985-11-10', '2024-08-02', 'Música', 'Inactivo'),
('Calle Solitaria 789', 5556543, 'Ana Fernández', 'ana.fernandez@example.com', 44332211, '1990-02-28', '2024-08-02', 'Viajes', 'Activo'),
('Boulevard Central 101', 5553210, 'Luis Martínez', 'luis.martinez@example.com', 55667788, '1978-09-05', '2024-08-03', 'Cocina', 'Inactivo');

insert into alquiler values
(0001,4,curdate(),50000),
(0002,5,"2024-07-30",40000),
(0003,1,"2024-08-06",30000),
(0004,2,"2024-08-01",50000),
(0005,3,curdate(),60000);

insert into titulo values
(1245, 'El Padrino', 1972, 'Crimen', 'Paramount Pictures', 'Francis Ford Coppola', 'Inglés', 9.2, 'Disponible'),
(2346, 'La Lista de Schindler', 1993, 'Historia', 'Universal Pictures', 'Steven Spielberg', 'Inglés', 8.9, 'Disponible'),
(3457, 'Pulp Fiction', 1994, 'Crimen', 'Miramax Films', 'Quentin Tarantino', 'Inglés', 8.9, 'Prestado'),
(4568, 'El Señor de los Anillos: La Comunidad del Anillo', 2001, 'Fantasía', 'New Line Cinema', 'Peter Jackson', 'Inglés', 8.8, 'Disponible'),
(5679, 'Inception', 2010, 'Ciencia Ficción', 'Warner Bros.', 'Christopher Nolan', 'Inglés', 8.8, 'Disponible');

insert into cd values
(1001, 1, 'Nuevo', 'Estante A1', 'Disponible', 1245),
(1002, 2, 'Usado', 'Estante B2', 'Prestado', 2346),
(1003, 3, 'Nuevo', 'Estante C3', 'Disponible', 3457),
(1004, 4, 'Usado', 'Estante D4', 'Disponible', 4568),
(1005, 5, 'Nuevo', 'Estante E5', 'Prestado', 5679);

insert into detalle_alquiler values
(2001,0005,1005,10,"2024-08-18"),
(2002,0001,1001,10,"2024-08-18"),
(2003,0002,1002,10,"2024-08-09"),
(2004,0003,1003,10,"2024-08-16"),
(2005,0004,1004,10,"2024-08-11");

insert into sancion values
(19487,1,2,5),
(95687,2,3,10),
(23568,1,2,5),
(98652,3,1,3),
(32457,1,4,15);
