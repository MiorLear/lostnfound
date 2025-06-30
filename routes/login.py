from flask import Blueprint, render_template
login_bp = Blueprint('login_bp', __name__)

@login_bp.route('/Start_Session')

def Start_Session():
    return render_template('login.html')
