from sqlalchemy import String,Integer,Column,ForeignKey
from conexion import base
from sqlalchemy.orm import relationship
 
class RegistroCliente(base):
    __tablename__= "clientes"
    documento=Column(Integer, primary_key=True, index=True)
    nombre = Column(String(50), nullable=False)
    apellido = Column(String(50), nullable=False)
    correo = Column(String(60), unique=True, nullable=True)
    celular = Column(String(60), nullable=False)
    sexo = Column(String(20), nullable=False)
    edad = Column(Integer, nullable=False)


class RegistroUsuario(base):
    __tablename__="usuario"
    documento = Column(Integer, ForeignKey('clientes.documento'), primary_key=True)
    cliente = relationship("RegistroCliente")
    nombreUsuario = Column(String(60), nullable=False)
    password = Column(String(60),nullable=False)
    rol= Column(String(20), nullable=False)