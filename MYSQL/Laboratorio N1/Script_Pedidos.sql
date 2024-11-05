create database Pedidos;

use Pedidos;

create table Cliente(
Id_Cli varchar(11) primary key,
Nom_Cli varchar(30) not null,
Ape_Cli varchar(30) not null,
Dir_Cli varchar(100),
Dep_Cli varchar(20),
Mes_Cum_Cli varchar(10)
);

Create table Articulo(
Id_Art int auto_increment primary key,
Tit_Art varchar(100) not null,
Aut_Art varchar(100) not null,
Edi_Art varchar(300),
Preci_Art int
);

create table Pedido(
Id_Ped int auto_increment primary key,
Id_Cli_Ped varchar(11) not null,
Fec_Ped date,
Val_Ped int,
constraint fk_id_cli foreign key (Id_Cli_Ped) references Cliente(Id_Cli)
);

create table ArticuloxPedido(
Id_Ped_Artped int,
Id_Art_Artped int,
Can_Art_Artped int,
Val_Ven_Art_Artped int,
constraint fk_id_ped foreign key (Id_Ped_Artped) references pedido(Id_Ped),
constraint fk_id_art foreign key(Id_Art_Artped) references Articulo(Id_Art)
);

select * from pedido;

insert into cliente values
(63502718,"Maritza","Rojas","Calle 34 No 14 - 45","Santander","Abril"),
(13890234, "Roger","Ariza","Cra 30 No 13 - 45","Antoquia","Junio"),
(77191956,"Juan Carlos", "Arenas", "Diagonal 23 No 12 - 34 apto 101", "Valle", "Marzo"),
(1098765789,"Catalina","Zapata","Av el libertador No 30 - 14","Cauca","Marzo");

insert into articulo values
(1,"Redes Cisco","Ernesto Arigasello","Alfaomega - Rama", 60000),
(2,"Facebook y twitter para adultos","Veloso Claudio","Alfaomega", 52000),
(3,"Creacion de un portal con php y mysql","Jacobo Pavon Puertas","Alfaomega - Rama",40000),
(4,"Administracion de sistemas operativos", "Julio Gomez Lopez","Alfaomega - Rama",55000);

insert into pedido values
(1,"63502718","2012-02-25",120000),
(2,"77191956", "2012-04-30", 55000),
(3,"63502718", "2011-12-10", 260000),
(4,"1098765789", "2012-02-25", 1800000);

INSERT INTO ArticuloxPedido VALUES
(1, 1, 2, 120000),  -- Pedido 1, Artículo 1, Cantidad 2, Valor total 120000
(2, 3, 1, 40000),   -- Pedido 2, Artículo 3, Cantidad 1, Valor total 40000
(3, 2, 5, 260000),  -- Pedido 3, Artículo 2, Cantidad 5, Valor total 260000
(4, 4, 3, 165000);  -- Pedido 4, Artículo 4, Cantidad 3, Valor total 165000