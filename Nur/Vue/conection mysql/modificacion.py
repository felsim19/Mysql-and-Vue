from fastapi import FastAPI, Depends,HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import text
from conexion import crear, get_db
from sqlalchemy.exc import SQLAlchemyError

app = FastAPI()

@app.post("/alterTable")
async def AlterTable(db:Session=Depends(get_db)):
    try:
       alteraT = text("ALTER TABLE usuario ADD COLUMN rol Varchar(20)")
       db.execute(alteraT)
       db.commit()
       return {"msj":"Tabla Alterada Sactisfactoriamente"}
       
    except SQLAlchemyError as e:
        db.rollback()
        raise HTTPException(status_code=400,detail=str(e))