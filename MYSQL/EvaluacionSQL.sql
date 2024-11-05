use pedidos;

select c.*, a.Tit_Art from cliente as c inner join pedido as p on c.Id_Cli = p.Id_Cli_Ped inner join ArticuloxPedido as ap on
p.Id_Ped = ap.Id_Ped_Artped inner join Articulo as a on ap.Id_Art_Artped = a.Id_Art
where p.Fec_Ped = '2012-04-30' and a.Tit_Art like '%q%';

