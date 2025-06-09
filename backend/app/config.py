import os

class Config:
    SQLALCHEMY_DATABASE_URI = 'postgresql://usuario:contraseña@localhost:5432/nombre_db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = os.urandom(24)
