from flask import Blueprint, render_template, request, redirect, url_for
from flask import Blueprint, render_template, request, redirect, url_for
from modules.objects import register_lost_object
from modules.objects import load_lost_objects
from modules.helpers import get_users_short_list, get_categories_short_list
import traceback

lost_objects_bp = Blueprint('lost_objects_bp', __name__)

@lost_objects_bp.route('/Lost_Objects', methods=['GET', 'POST'])

def Lost_Objects():
    if request.method == 'POST':
        try:
            object_name = request.form['object_name']
            object_description = request.form['object_description']
            category_id = request.form['category_id']
            student = request.form['student']
            found_place = request.form['found_place']
            extra_comments = request.form['extra_comments']

            register_lost_object(object_name, object_description, category_id, student, found_place, extra_comments)
            return redirect(url_for('lost_objects_bp.Lost_Objects'))

        except Exception as e:
            print("Error al guardar en la base de datos:", e)
            traceback.print_exc()
    return render_template('Lost_Objects.html', category = get_categories_short_list(),users = get_users_short_list(), objects_db= load_lost_objects())
