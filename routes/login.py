from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from config.config import connect  # ✅ Corrección en la importación

login_bp = Blueprint('login_bp', __name__)

@login_bp.route('/Start_Session', methods=['GET', 'POST'])
def Start_Session():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        # Conexión a la base de datos
        db = connect()
        cursor = db.cursor(dictionary=True)

        query = "SELECT * FROM users WHERE user_mail = %s AND user_password = %s"
        cursor.execute(query, (email, password))
        user = cursor.fetchone()

        cursor.close()
        db.close()

        if user:
            # Almacena datos de sesión
            session['user_id'] = user['user_id']
            session['user_name'] = user['user_name']
            session['user_rol'] = user['user_rol_id']
            return redirect(url_for('control_panel_bp.Control_Panel'))
        else:
            flash('Correo o contraseña incorrectos.', 'danger')
            return redirect(url_for('login_bp.Start_Session'))

    return render_template('login.html')
