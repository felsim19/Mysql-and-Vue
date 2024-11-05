from pydantic import BaseModel as bm

class ClienteBase(bm):
    documento:int
    nombre:str
    apellido:str
    correo:str
    celular:str
    sexo:str
    edad:int
    
    
class UsuarioC(bm):
    documento:int
    nombreUsuario:str
    password:str
    rol:str
    
    
class Login(bm):
    nombreUsuario:str
    password:str