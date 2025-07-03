from flask import Blueprint, render_template
login_bp = Blueprint('login_bp', __name__)

@login_bp.route('/Control_Panel')

def Start_Session():
    return render_template('login.html')
