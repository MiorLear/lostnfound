from flask import Blueprint, render_template, request, redirect, url_for
from modules.objects import register_found_object
from modules.helpers import get_users_short_list, get_categories_short_list
import traceback

objects_register_bp = Blueprint('objects_register_bp', __name__)

@objects_register_bp.route('/Objects_Register', methods=['GET', 'POST'])

def Objects_Register():
    if request.method == 'POST':
            try:
                object_name = request.form['object_name']
                object_description = request.form['object_description']
                category_id = request.form['category_id']
                student = request.form['student']
                found_place = request.form['found_place']
                extra_comments = request.form['extra_comments']

                register_found_object(object_name, object_description, category_id, student, found_place, extra_comments)
                return redirect(url_for('control_panel_bp.Control_Panel'))

            except Exception as e:
                print("Error al guardar en la base de datos:", e)
                traceback.print_exc()
                # return "Error al registrar el objeto", 500

    return render_template('Objects_Register.html', category = get_categories_short_list(),users = get_users_short_list())
