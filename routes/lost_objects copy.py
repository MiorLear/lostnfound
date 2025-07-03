from flask import Blueprint, render_template, request, redirect, url_for
from modules.objects import register_found_object
from modules.helpers import get_users_short_list, get_categories_short_list

lost_objects_bp = Blueprint('lost_objects_bp', __name__)

@lost_objects_bp.route('/Lost_Objects', methods=['GET', 'POST'])

def Lost_Objects():
    if request.method == 'POST':
        try:
            alumno = request.form['alumno']
            nombre_objeto = request.form['nombre_objeto']
            id_categoria = request.form['categoria']
            descripcion = request.form['descripcion']
            lugar = request.form['lugar_encontrado']
            fecha_perdida = request.form['fecha_encontrado']

            register_found_object(alumno, nombre_objeto, descripcion, lugar, fecha_perdida, id_categoria)
            return redirect(url_for('dashboard'))

        except Exception as e:
            print("Error al guardar en la base de datos:", e)
            return "Error al registrar el objeto", 500

    usuarios = get_users_short_list()
    categorias = get_categories_short_list()
    return render_template('Lost_Objects.html', usuarios=usuarios, categorias=categorias)
