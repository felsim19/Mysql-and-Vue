use alquiler;

-- Consultar todos los datos de sancion con el nombre del cliente
select s.*, c.Nombrecliente, c.telefono, c.estado from sancion as s inner join cliente as c on s.Id_cliente = c.Id_cliente; 

-- Consultar la base de datos y mostar el cliente con mas sanciones y cuantas tiene
select s.id_cliente, count(*) as numero_sanciones,c.nombrecliente from sancion as s
inner join cliente as c on s.id_cliente = c.id_cliente group by s.id_cliente limit 1;

-- Consultar el nombre del cliente, el email, la fecha del alquiler y el valor
select c.nombrecliente, c.email, a.Fechaalquiler, a.Valoralquiler from cliente as c inner join alquiler as a on c.id_cliente =
a.Id_cliente; 

-- Consultar el nombre, la direcion, el tema de interes, el precio y la fecha del alquiler mas reciete
select c.nombrecliente, c.Direccioncliente, c.Temainteres, a.Fechaalquiler, a.Valoralquiler from cliente as c inner join alquiler as
a on c.id_cliente = a.Id_cliente order by a.Fechaalquiler desc limit 1; 

-- Consultar y traer el nombre la productor y el año de las 3 peliculas mas antiguas con el numero y la condicion del cd
select t.Titulo, t.Productora, t.Año, c.Nro_cd, c.condicion from titulo as t inner join cd as c on t.Id_titulo = c.Id_titulo 
order by t.año asc limit 3;

-- Muestre Todos los detalles del alquiler, el estado del cd y el titulo y la productora 
select da.*, c.condicion, t.titulo, t.productora from titulo as t inner join cd as c on t.Id_titulo = c.Id_titulo inner join 
detalle_alquiler as da on c.Id_cd = da.Id_cd;

-- Muestre el nombre del cliente, la fecha y el valor del alquiler y los dias de prestamos y la fecha de devolucion
select c.nombrecliente, a.Fechaalquiler, a.Valoralquiler, da.Diasprestamo, da.Fechadevoluvion from cliente as c inner join
alquiler as a on c.id_cliente = a.id_cliente inner join detalle_alquiler as da on a.Id_alquiler = da.Id_alquiler;

-- Muestre el nombre del cliente, la fecha y el valor del alquiler y los dias de prestamos y la fecha de devolucion pero donde solo muestren a los que el valor del alquiler supera los 40000
select c.nombrecliente, a.Fechaalquiler, a.Valoralquiler, da.Diasprestamo, da.Fechadevoluvion from cliente as c inner join
alquiler as a on c.id_cliente = a.id_cliente inner join detalle_alquiler as da on a.Id_alquiler = da.Id_alquiler 
where a.Valoralquiler >= 40000;

-- Muestre el nombre del cliente, la fecha y el valor del alquiler y los dias de prestamos y la fecha de devolucion y el estado y la condicion del cd
select c.nombrecliente, a.Fechaalquiler, a.Valoralquiler, da.Diasprestamo, da.Fechadevoluvion, cd.condicion, cd.Estado
from cliente as c inner join alquiler as a on c.id_cliente = a.id_cliente inner join detalle_alquiler as da on a.Id_alquiler = 
da.Id_alquiler inner join cd as cd on da.id_cd = cd.id_cd;

-- Muestra un dato de todas las tablas 
select s.Tiposancion, c.nombrecliente, a.valoralquiler, da.diasprestamo, cd.estado, t.titulo from sancion as s inner join cliente
as c on s.Id_cliente = c.Id_cliente inner join alquiler as a on c.id_cliente = a.Id_cliente inner join detalle_alquiler as da on
a.Id_alquiler = da.Id_alquiler inner join cd as cd on da.id_cd = cd.id_cd inner join titulo as t on t.Id_titulo = cd.Id_titulo;