from flask import Blueprint, render_template, request, redirect, url_for
from flask import Blueprint, render_template, request, redirect, url_for
from modules.objects import register_lost_object, load_lost_objects, change_object_tatus
from modules.helpers import get_users_short_list, get_categories_short_list
from config.config import connect
from werkzeug.utils import secure_filename
import traceback, os 

lost_objects_bp = Blueprint('lost_objects_bp', __name__)

UPLOAD_FOLDER = 'assets/img/uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

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

            file = request.files['object_image']
            if file and allowed_file(file.filename):
                filename = secure_filename(file.filename)
                filepath = os.path.join(UPLOAD_FOLDER, filename)
                file.save(filepath)
            else:
                filename = None  # Si no sube imagen

            register_lost_object(object_name, object_description, category_id, student, found_place, extra_comments, filename)
            return redirect(url_for('lost_objects_bp.Lost_Objects'))

        except Exception as e:
            print("Error al guardar en la base de datos:", e)
            traceback.print_exc()
    return render_template('Lost_Objects.html', category = get_categories_short_list(),users = get_users_short_list(), objects_db= load_lost_objects())

@lost_objects_bp.route("/Lost_Objects/<int:object_id>")
def founded_report(object_id):

    change_object_tatus(object_id)

    return redirect(url_for('lost_objects_bp.Lost_Objects'))
