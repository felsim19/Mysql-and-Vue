-- Realice las siguientes consultas, debajo de cada uno escriba la sintaxis seguido de un ; 
-- este arcivo lo deben guardar con su nombre_apellido_complejas, y es el que deben subir a la plataforma,

-- 1. Obtener el código, el tipo, el color y el premio de todos los maillots que hay.
select * from maillot;


-- 2. Obtener el dorsal y el nombre de los ciclistas cuya edad sea menor o igual que 25 años.
select dorsal, nombre, edad from ciclista where edad >= 25;
 

-- 3. Obtener el nombre y la altura de todos los puertos de categoría ‘E’ (Especial).
select nompuerto, altura, categoria from puerto where categoria = 'E';
 

-- 4. Obtener el valor del atributo netapa de aquellas etapas con salida y llegada en la misma ciudad.
select  netapa, salida, llegada from etapa where salida = llegada;


-- 5. ¿Cuántos ciclistas hay?
select count(*) as numero_ciclastas from ciclista; 


-- 6. ¿Cuántos ciclistas hay con edad superior a 25 años?
select count(*) as numero_ciclastas from ciclista where edad > 25;


-- 7. ¿Cuántos equipos hay?	
 select count(*) as numero_equipos from equipo;


-- 8. Obtener la media de edad de los ciclistas.
 select avg(edad) as edad_promedio from ciclista;

-- 9. Obtener la altura mínima y máxima de los puertos de montaña.
select min(altura) as minima, max(altura) as maxima from puerto;


-- 10. Obtener el nombre de cada ciclista junto con el nombre del equipo al que pertenece
select c.nombre, eq.nomeq from ciclista as c inner join equipo as eq on c.nomeq = eq.nomeq;


-- 11. Obtener el nombre de los ciclistas que sean de Banesto.
select c.nombre, eq.nomeq, c.dorsal from ciclista as c inner join equipo as eq on c.nomeq = eq.nomeq where eq.nomeq = 'Banesto';

 
-- 12. ¿Cuántos ciclistas pertenecen al equipo Amore Vita?
 select count(*) as numero_ciclistas from ciclista as c inner join
 equipo as eq on c.nomeq = eq.nomeq where eq.nomeq = 'Amore Vita';


-- 13. Edad media de los ciclistas del equipo TVM.
select avg(c.edad) as edad_media from ciclista as c inner join
equipo as eq on c.nomeq = eq.nomeq where eq.nomeq = 'TVM'; 


-- 14. Nombre de los ciclistas que pertenezcan al mismo equipo que Miguel Indurain
select nombre, nomeq from ciclista where nomeq=(select nomeq from ciclista where nombre = 'Miguel Indurain')
and nombre <> 'Miguel Indurain';   


-- 15. Nombre de los ciclistas que han ganado alguna etapa.
select distinct c.nombre from ciclista as c inner join etapa as e on c.dorsal = e.dorsal;


-- 16. Nombre de los ciclistas que han llevado el maillot General.
select distinct c.nombre, m.tipo from ciclista as c inner join llevar as ll on c.dorsal = ll.dorsal inner join maillot as m on
ll.codigomail = m.codigo where m.tipo = 'General';


-- 17. Obtener el nombre del ciclista más joven
select nombre, edad from ciclista order by edad asc limit 1; 


-- 18. Obtener el número de ciclistas de cada equipo.
select nomeq,count(*) as numero_ciclistas from ciclista group by nomeq; 

 
-- 19. Obtener el nombre de los equipos que tengan más de 5 ciclistas.
select nomeq,count(*) as numero_ciclistas from ciclista group by nomeq having numero_ciclistas > 5; 

-- 20. Obtener el número de puertos que ha ganado cada ciclista.
select c.nombre, count(p.dorsal) as Puertos_Ganados from ciclista as c inner join puerto as p on c.dorsal = p.dorsal 
group by c.nombre; 


-- 21. Obtener el nombre de los ciclistas que han ganado más de un puerto.
 select c.nombre, count(*) as Puertos_Ganados from ciclista as c inner join puerto as p on c.dorsal = p.dorsal 
group by c.nombre having Puertos_Ganados > 1;


-- 22. Obtener el nombre y el director de los equipos a los que pertenezca algún ciclista mayor de 33 años.
select c.nomeq, e.director, c.edad from ciclista as c inner join equipo as e on c.nomeq = e.nomeq where c.edad > 33; 


-- 23. Nombre de los ciclistas que no pertenezcan a Kelme
 select nombre, nomeq from ciclista where not nomeq = 'Kelme'; 


-- 24. Nombre de los ciclistas que no hayan ganado ninguna etapa.
select c.nombre from ciclista as c left join etapa as e on c.dorsal = e.dorsal 
where e.dorsal is null; 


-- 25. Nombre de los ciclistas que no hayan ganado ningún puerto de montaña.
select c.nombre from ciclista as c left join puerto as p on c.dorsal = p.dorsal
where p.dorsal is null;


-- 26. Nombre de los ciclistas que hayan ganado más de un puerto de montaña.
select c.nombre, count(*) as Puertos_Ganados from ciclista as c inner join puerto as p on c.dorsal = p.dorsal 
group by c.nombre having Puertos_Ganados > 1;


-- 27. ¿Qué ciclistas han llevado el mismo maillot que Miguel Indurain?
 select distinct c.nombre, m.codigo from ciclista as c inner join llevar as ll on c.dorsal = ll.dorsal inner join maillot as m on 
 ll.codigomail = m.codigo where m.codigo in (select m2.codigo from maillot as m2 inner join llevar as ll2 on m.codigo = ll2.codigomail 
 inner join ciclista as c2 on ll2.dorsal = c2.dorsal where c2.nombre = 'Miguel Indurain') and c.nombre <> 'Miguel Indurain';


-- 28. De cada equipo obtener la edad media, la máxima edad y la mínima edad.
 select nomeq, round(avg(edad)) as edad_Media, max(edad) as edad_Maxima, min(edad) as edad_Minima
 from ciclista group by nomeq;


-- 29. Nombre de aquellos ciclistas que tengan una edad entre 25 y 30 años y que no pertenezcan a los equipos Kelme y Banesto.
select nombre, edad, nomeq from ciclista where nomeq not in ('Kelme', 'Banesto') and edad >= 25 and edad <= 30 ; 


-- 30. Nombre de los ciclistas que han ganado la etapa que comienza en Zamora.
select e.salida, e.dorsal, c.nombre from etapa as e inner join ciclista as c on
 e.dorsal = c.dorsal where e.salida = 'Zamora'; 


-- 31. Obtén el nombre y la categoría de los puertos ganados por ciclistas del equipo ‘Banesto’.
 select p.nompuerto, p.categoria, c.nomeq, c.nombre from puerto as p inner join ciclista as c on p.dorsal = c.dorsal
 where c.nomeq = 'Banesto';


-- 32. Obtener el nombre de cada puerto indicando el número (netapa) y los kilómetros de la etapa en la que se encuentra el puerto.
select p.nompuerto, p.netapa, e.km from puerto as p inner join etapa as e on p.netapa = e.netapa;


-- 33. Obtener el nombre de los ciclistas con el color de cada maillot que hayan llevado.
 select distinct  c.nombre, m.color from ciclista as c inner join llevar as ll on c.dorsal = ll.dorsal 
 inner join maillot as m on ll.codigomail = m.codigo;


-- 34. Obtener pares de nombre de ciclista y número de etapa tal que ese ciclista haya ganado esa etapa habiendo
-- llevado el maillot de color amarillo al menos una vez
select c.nombre, ll.netapa , m.color from ciclista as c inner join llevar as ll on c.dorsal = ll.dorsal 
inner join maillot as m on ll.codigomail = m.codigo where m.color = 'Amarillo';


-- 35. Obtener el valor del atributo netapa de las etapas que no comienzan en la misma ciudad en que acabó la anterior etapa.
select e1.netapa, e1.salida, e1.llegada from etapa as e1 left join etapa as e2 on e1.netapa = e2.netapa + 1
where e1.salida <> e2.llegada or e2.llegada is null;

-- 36. Obtener el valor del atributo netapa y la ciudad de salida de aquellas etapas que no tengan puertos de montaña.
 select e.netapa, e.salida from etapa as e left join puerto as p on e.netapa = p.netapa where e.netapa not in
 (select e1.netapa from etapa as e1 inner join puerto as p on e.netapa = p.netapa where e.netapa);

-- 37. Obtener la edad media de los ciclistas que han ganado alguna etapa.
select avg(distinct c.edad) as edad_promedio_Ganadores_Etapa from ciclista as c inner join etapa as e on c.dorsal = e.dorsal where e.dorsal;

-- 38. Selecciona el nombre de los puertos con una altura superior a la altura media de todos los puertos.
 select nompuerto from puerto where altura > (select avg(altura) from puerto);


-- 39. Obtener el nombre de la ciudad de salida y de llegada de las etapas donde estén los puertos con mayor pendiente.
 select e.salida, e.llegada, p.altura from etapa as e inner join puerto as p on e.netapa = p.netapa
 where p.altura = (select max(altura) from puerto);


-- 40. Obtener el dorsal y el nombre de los ciclistas que han ganado los puertos de mayor altura.
select c.dorsal, c.nombre from ciclista as c inner join etapa as e on c.dorsal = e.dorsal inner join puerto as p 
on e.netapa = p.netapa where p.altura > (select avg(altura) from puerto);


-- 41. Obtener el nombre del ciclista más joven que ha ganado al menos una etapa.
select distinct c.nombre from ciclista as c inner join etapa as e on c.dorsal = e.dorsal
where c.edad = (select distinct min(c1.edad) from ciclista as c1 inner join etapa as e1 on c1.dorsal = e1.dorsal);

-- 42. Obtener el valor del atributo netapa de aquellas etapas tales que todos los puertos que están en ellas tienen
-- más de 700 metros de altura.
select distinct e.netapa from etapa as e inner join puerto as p on e.netapa = p.netapa where p.altura > 700;


-- 43. Obtener el nombre y el director de los equipos tales que todos sus ciclistas son mayores de 20 años.
select e.nomeq, e.director from equipo as e inner join ciclista as c on e.nomeq = c.nomeq
group by e.nomeq, e.director having min(c.edad) > 20;


-- 44. Obtener el dorsal y el nombre de los ciclistas tales que todas las etapas que han ganado tienen más de 170 km 
-- (es decir que sólo han ganado etapas de más de 170 km).
 select e.dorsal, c.nombre from etapa as e inner join ciclista as c on e.dorsal = c.dorsal
 where e.km > 170;

-- 45. Obtener el nombre de los ciclistas que han ganado todos los puertos de una etapa y además han ganado esa misma etapa.
select distinct p.dorsal, e.dorsal, c.nombre from puerto as p inner join etapa as e on p.netapa = e.netapa inner join ciclista as c on
e.dorsal = c.dorsal where p.dorsal = e.dorsal;


-- 46. Obtener el nombre de los equipos tales que todos sus corredores han llevado algún maillot o han ganado algún puerto.
select distinct c.nomeq from ciclista as c inner join llevar as ll on c.dorsal = ll.dorsal inner join puerto as p on
c.dorsal = p.dorsal where ll.dorsal or p.dorsal;


-- 47. Obtener el código y el color de aquellos maillots que sólo han sido llevados por ciclistas de un mismo equipo.
select m.codigo, m.color from maillot as m inner join llevar as ll on m.codigo = ll.codigomail inner join ciclista as c on
ll.dorsal = c.dorsal group by m.codigo, m.color having COUNT(DISTINCT c.nomeq) = 1;


-- 48. Obtener el nombre de aquellos equipos tal que sus ciclistas sólo hayan ganado puertos de 1ª categoría
select distinct c.nomeq from ciclista as c inner join puerto as p on c.dorsal = p.dorsal where p.categoria = '1';


-- 49. Obtener el valor del atributo netapa de aquellas etapas que tienen puertos de montaña indicando cuántos tiene.
select netapa ,count(netapa) as puertos_motaña from puerto group by netapa;

-- 50. Obtener el nombre de todos los equipos indicando cuántos ciclistas tiene cada uno.
select nomeq, count(nomeq) as cantidad_ciclista from ciclista group by nomeq;

-- 51. Obtener el director y el nombre de los equipos que tengan más de 3 ciclistas y cuya edad media sea igual o inferior a 30 años.
select c.nomeq, e.director, avg(c.edad) as edad_promedio_equipo from equipo as e inner join ciclista as c on e.nomeq = c.nomeq 
group by c.nomeq, e.director having count(c.nomeq) > 3 and avg(c.edad) <= 30;
 

-- 52. Obtener el nombre de los ciclistas que pertenezcan a un equipo que tenga más de cinco corredores
-- y que hayan ganado alguna etapa indicando cuántas etapas ha ganado.
select c.nombre, c.nomeq from ciclista as c inner join etapa as e on c.dorsal = e.dorsal where c.nomeq = 
(select nomeq from ciclista group by nomeq having count(nomeq) > 5);

 
-- 53. Obtener el nombre de los equipos y la edad media de sus ciclistas de aquellos equipos que tengan la media
-- de edad máxima de todos los equipos.
 select nomeq, avg(edad) as edad_media_equipo from ciclista group by nomeq having avg(edad) > 
 (select avg(edad) as edad_promedio from ciclista);


-- 54. Obtener el director de los equipos cuyos ciclistas han llevado más días maillots de cualquier tipo.




