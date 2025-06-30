from flask import Blueprint, render_template
landing_bp = Blueprint('landing_bp', __name__)

@landing_bp.route('/users_management')

def users_management():
    return render_template('landing.html')
