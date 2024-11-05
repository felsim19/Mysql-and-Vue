import bcrypt
from fastapi import FastAPI, Depends,HTTPException
from sqlalchemy.orm import Session
from conexion import crear, get_db
from modelo import base, RegistroCliente, RegistroUsuario
from schema import ClienteBase as cli, UsuarioC as us, Login as lo
from fastapi.middleware.cors import CORSMiddleware
 
app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)
base.metadata.create_all(bind=crear)

@app.post("/insertar", response_model=cli)
async def registar_cliente(clientemodel:cli, db:Session=Depends(get_db)):
    datos=RegistroCliente(**clientemodel.dict())
    db.add(datos)
    db.commit()
    db.refresh(datos)
    return datos

@app.get("/consultarCliente", response_model=list[cli])
async def ConsultarClientes(db:Session=Depends(get_db)):
    datos_cliente = db.query(RegistroCliente).all()
    return datos_cliente

@app.get("/clientes/{documento}", response_model=cli)
async def ConsultarDocumento(documento:int ,db:Session=Depends(get_db)):
    dato_cliente=db.query(RegistroCliente).filter(RegistroCliente.documento==documento).first()
    if dato_cliente is None:
        raise HTTPException(status_code=404,detail="Dato No encontrado")
    return dato_cliente


@app.get("/clientes/documento/", response_model=list[int])
async def getDocumentoClientes(db:Session=Depends(get_db)):
    documentos = db.query(RegistroCliente.documento).all()
    return [doc[0] for doc in documentos]

@app.post("/Registro/", response_model=us)
async def Registro_Usuario(usermodel:us, db:Session=Depends(get_db)):
    nombre_user = db.query(RegistroUsuario).filter(RegistroUsuario.nombreUsuario==usermodel.nombreUsuario).first()
    if nombre_user:
        raise HTTPException(status_code=404, detail="Ese nombre de usuario ya existe")
    
    new_user = RegistroUsuario(documento= usermodel.documento,nombreUsuario= usermodel.nombreUsuario, password= usermodel.password, rol = usermodel.rol)
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return {"Estado": "Usuario correctamente agregado"}

@app.post("/registrousuario/")
async def  registrar_usuario(usermodel:us,db:Session=Depends(get_db)):
    nombre_user=db.query(RegistroUsuario).filter(RegistroUsuario.nombreUsuario==usermodel.nombreUsuario).first()
    if nombre_user:
        raise HTTPException(status_code=400,detail="Usario ya existente")
    encriptacion=bcrypt.hashpw(usermodel.password.encode("utf-8"),bcrypt.gensalt())
    nuevo_user=RegistroUsuario(documento=usermodel.documento,nombreUsuario=usermodel.nombreUsuario,password=encriptacion.decode('utf-8'), rol=usermodel.rol)
    db.add(nuevo_user)
    db.commit()
    db.refresh(nuevo_user)
    return {"documento":nuevo_user.documento,"nombre": nuevo_user.nombreUsuario,"rol":nuevo_user.rol}

@app.post("/login")
async def login(loginmodel:lo, db:Session=Depends(get_db)):
    db_user = db.query(RegistroUsuario).filter(RegistroUsuario.nombreUsuario == loginmodel.nombreUsuario).first()
    if db_user is None:
        raise HTTPException(status_code=400, detail="Usuario no existe")
    if not bcrypt.checkpw(loginmodel.password.encode('utf-8'), db_user.password.encode('utf-8')):
        raise HTTPException(status_code=400, detail="Contraseña incorrecta")
    return {"mensaje": "Login exitoso", "usuario": db_user.nombreUsuario, "rol": db_user.rol}