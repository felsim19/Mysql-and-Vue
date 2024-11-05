from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

URL_DB = "mysql+mysqlconnector://root:0000@localhost:3306/banco"

crear = create_engine(URL_DB)

sesionLocal = sessionmaker(autocommit=False,autoflush=False,bind=crear)

base = declarative_base()


def get_db():
    conexion = sesionLocal()
    try:
        yield conexion 
    finally:
        conexion.close