use empleados;

describe usuario;

-- insertar datos --

insert into departamento values(98,"Sistemas","Mosquera");
insert into departamento(Codigo_Depart,Nombre) values (99,"Software");

insert into departamento(Codigo_Depart,Nombre) values 
(100,"Contabilidad"),
(101, "Produccion");

select * from usuario;

insert into empleado values(1,"sierra","Ingeniero","calle 15a n 9-15", curdate(), 5000000, 3000000, 98);
insert into empleado values(2,"martinez","tecnologo","calle 18b n 4-20", curdate(), 2500000, 1500000, 98);
insert into empleado(Codigo_Empleado,Apellido,Oficio,Direccion,Fecha_Ingreso,Salario,Departamento) values
(3,"rojas","tecnico","calle 29c n 8-15", '2024-05-28', 2000000, 100),
(4,"muñoz","programador","calle 31d n 8-12", '2024-02-28', 4000000, 101);


select * from usuario;

insert into usuario values(1,'Julian','Admin123','empleado', 1, 'https:google,mifotossbdainjsansjad.png');
insert into usuario values(2,'felipe','Admin456','administrador', 0, 'https:google,mifotossbdainjsansjad.png');




