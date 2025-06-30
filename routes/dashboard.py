from flask import Blueprint, render_template
control_panel_bp = Blueprint('control_panel_bp', __name__)

@control_panel_bp.route('/Control_Panel')

def Control_Panel():
    return render_template('Control_Panel.html')
