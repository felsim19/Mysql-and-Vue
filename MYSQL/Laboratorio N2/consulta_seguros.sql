use seguros;

-- Visualizar los datos de las empresas fundadas entre el año 1991 y 1998.
select * from Compania where Comañofun between 1991 and 1998;


/*Listar todos los datos de los automotores cuya póliza expira en octubre de 2013, este reporte debe visualizar la placa, el modelo,
 la marca, número de pasajeros, cilindraje nombre de automotor, el valor de la póliza y el valor asegurado */
select a.Asefechaexpiracion, am.Autoplaca, am.Automodelo, am.Automarca, am.Autonumpasajeros, am.Autocilindraje, ta.Autnombre,
a.Asecosto, a.Asevalorasegurado
from Aseguramientos as a inner join automotores as am on a.Aseplaca = am.Autoplaca inner join TiposAutomotores as ta 
on am.AutoTipo = ta.Auttipo where year(a.Asefechaexpiracion) = 2013 and month(a.Asefechaexpiracion) = 9; 


/*Visualizar los datos de los incidentes ocurridos el 30 de septiembre de
2012, con su respectivo número de póliza, fecha de inicio de la póliza,
valor asegurado y valor de la póliza*/
select i.*, a.Asecodigo, a.Asefechainicio, a.Asevalorasegurado, a.Asecosto
from incidentes as i inner join AutoMotores as am on i.Inciplaca = am.Autoplaca inner join aseguramientos as a on am.Autoplaca 
= a.Aseplaca where i.Incifecha = '2012-09-30';


/*Visualizar los datos de los incidentes que han tenido un(1) herido, este
reporte debe visualizar la placa del automotor, con los respectivos
datos de la póliza como son fecha de inicio, valor, estado y valor
asegurado.*/
select i.*, am.Autoplaca, a.Asefechainicio, a.Asecosto, a.Aseestado, a.Asevalorasegurado
from incidentes as i inner join automotores as am on i.inciplaca = am.Autoplaca inner join aseguramientos as a on am.Autoplaca 
= a.Aseplaca where i.Incicantheridos >= 1;


-- Visualizar todos los datos de la póliza más costosa.
select * from aseguramientos order by Asecosto desc limit 1;


/*Visualizar los incidentes con el mínimo número de autos involucrados,
de este incidente visualizar el estado de la póliza y el valor asegurado*/
select i.*, a.Aseestado, a.Asevalorasegurado
from incidentes as i inner join automotores as am on i.inciplaca = am.Autoplaca inner join aseguramientos as a on am.Autoplaca 
= a.Aseplaca order by i.Incicanautosinvolucrados asc limit 1;

/*Visualizar los incidentes del vehículo con placas " FLL420", este reporte
debe visualizar la fecha, el lugar, la cantidad de heridos del incidente,
la fecha de inicio la de expiración de la póliza y el valor asegurado.*/
select i.Inciplaca, i.Incifecha, i.Incilugar, i.Incicantheridos, a.Asefechainicio, a.Asefechaexpiracion, a.Asevalorasegurado
from Incidentes as i inner join automotores as am on i.Inciplaca = am.Autoplaca inner join aseguramientos as a on am.Autoplaca
= a.Aseplaca where i.Inciplaca = 'FLL420';

-- Visualizar los datos de la empresa con nit 899999999-5.
select * from Compania where Comnit = '899999999-5';

/*Visualizar los datos de la póliza cuyo valor asegurado es el más
costoso, este reporte además de visualizar todos los datos de la póliza,
debe presentar todos los datos del vehículo que tiene dicha póliza.*/
select a.*, am.*
from aseguramientos as a inner join automotores as am on a.Aseplaca = am.Autoplaca
order by a.Asevalorasegurado desc limit 1;

/*Visualizar los datos de las pólizas de los automotores tipo 1, este reporte
debe incluir placa, marca, modelo, cilindraje del vehículo junto con la
fecha de inicio, de finalización y estado de la póliza.*/
select am.AutoTipo, am.Autoplaca, am.Automarca, am.Automodelo, am.Autocilindraje, a.Asefechainicio, a.Asefechaexpiracion, a.Aseestado
from automotores as am inner join aseguramientos as a on am.Autoplaca = a.Aseplaca where am.AutoTipo = 1;