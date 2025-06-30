import mysql.connector

def connect():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        port=3307,
        password="",
        database="lostnfound"
    )