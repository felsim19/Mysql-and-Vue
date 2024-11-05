use Pedidos;

-- Visualizar el nombre, apellido y dirección de todos aquellos clientes que hayan realizado un pedido el día 25 /02/2012.
SELECT c.Nom_Cli, c.Ape_Cli, c.Dir_Cli FROM Cliente c inner JOIN pedido p ON c.Id_Cli = p.Id_Cli_Ped WHERE p.Fec_Ped = '2012-02-25';

-- Listar todos los pedidos realizados incluyendo el nombre del artículo.
select arpe.*, a.Tit_Art from ArticuloxPedido as arpe inner join articulo as a on arpe.Id_Art_Artped = a.Id_Art;

-- Visualizar los clientes que cumplen años en marzo.
select * from cliente where Mes_Cum_Cli = 'Marzo';

-- Visualizar los datos del pedido 1, incluyendo el nombre del cliente, la dirección del mismo, el nombre y el valor de los artículos que tiene dicho pedido
SELECT p.*, c.nom_cli, c.ape_cli, c.dir_cli, a.Tit_Art, a.Preci_Art 
FROM cliente c 
inner JOIN pedido p ON c.id_cli = p.id_cli_ped  inner JOIN 
ArticuloxPedido ap ON p.id_ped = ap.Id_Ped_Artped  inner JOIN  articulo a ON ap.Id_Art_Artped = a.id_art WHERE p.id_ped = 1;

-- Visualizar el nombre del cliente, la fecha y el valor del pedido más costoso.
select c.Nom_Cli, c.Ape_Cli, p.Fec_Ped, p.Val_Ped 
from cliente as c inner join pedido as p on c.id_cli = p.id_cli_ped order by p.Val_Ped desc limit 1;

-- Mostrar cuantos artículos se tienen de cada editorial.
SELECT Edi_Art, COUNT(*) AS Cantidad_Articulos FROM Articulo GROUP BY Edi_Art;

-- Mostrar los pedidos con los respectivos artículos(código, nombre, valor y cantidad pedida).
select p.*, a.Id_Art, a.Tit_Art, a.Preci_Art, ap.Can_Art_Artped
from pedido as p inner join ArticuloxPedido as ap on p.id_ped = ap.Id_Ped_Artped inner join articulo as a on 
ap.id_ped_artped = a.Id_art;

-- Visualizar todos los clientes organizados por apellido
select * from cliente order by Ape_Cli;

-- Visualizar todos los artículos organizados por autor
select * from articulo order by Aut_Art;

-- Visualizar los pedidos que se han realizado para el articulo con id 2, el listado debe mostrar el nombre y dirección del cliente, el respectivo número de pedido y la cantidad solicitada.
select a.Id_Art, c.Nom_Cli, c.Dir_Cli,p.Id_Ped, ap.Can_Art_Artped
from pedido as p inner join cliente as c on p.Id_Cli_Ped = c.Id_Cli inner join ArticuloxPedido as ap on p.id_ped = ap.Id_Ped_Artped
inner join articulo as a on ap.id_ped_artped = a.Id_art where a.Id_Art = 2;