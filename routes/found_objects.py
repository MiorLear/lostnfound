from flask import Blueprint, render_template, request, redirect, url_for

found_objects_bp = Blueprint('found_objects_bp', __name__)

@found_objects_bp.route('/Found_Objects', methods=['GET', 'POST'])

def Found_Objects():
    return render_template('Found_Objects.html')
