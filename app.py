from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
from datetime import datetime

app = Flask(__name__)

def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",  # Reemplaza si tienes clave
        database="key"
    )

def obtener_usuarios():
    conexion = conectar()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute("SELECT id_usuario, nombre FROM usuarios")
    usuarios = cursor.fetchall()
    conexion.close()
    return usuarios

def obtener_categorias():
    conexion = conectar()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute("SELECT id_categoria, nombre_categoria FROM categorias")
    categorias = cursor.fetchall()
    conexion.close()
    return categorias

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/dashboard')
def dashboard():
    return render_template('control.html')

@app.route('/registro', methods=['GET', 'POST'])
def registro():
    if request.method == 'POST':
        try:
            alumno = request.form['alumno']
            nombre_objeto = request.form['nombre_objeto']
            id_categoria = request.form['categoria']
            descripcion = request.form['descripcion']
            lugar_encontrado = request.form['lugar_encontrado']
            fecha_encontrado = request.form['fecha_encontrado']

            conexion = conectar()
            cursor = conexion.cursor()
            query = """
                INSERT INTO objetos_encontrados (
                    id_usuario_encuentra, nombre_objeto, id_categoria,
                    descripcion, lugar_encontrado, fecha_encontrado
                ) VALUES (%s, %s, %s, %s, %s, %s)
            """
            datos = (
                alumno,
                nombre_objeto,
                id_categoria,
                descripcion,
                lugar_encontrado,
                fecha_encontrado
            )
            cursor.execute(query, datos)
            conexion.commit()
            conexion.close()

            return redirect(url_for('dashboard'))

        except Exception as e:
            print("Error al guardar en la base de datos:", e)
            return "Error al registrar el objeto", 500

    usuarios = obtener_usuarios()
    categorias = obtener_categorias()
    return render_template('registro.html', usuarios=usuarios, categorias=categorias)

if __name__ == '__main__':
    app.run(debug=True)
