from flask import Blueprint, render_template, request, redirect, url_for

lost_objects_bp = Blueprint('lost_objects_bp', __name__)

@lost_objects_bp.route('/Lost_Objects', methods=['GET', 'POST'])

def Lost_Objects():
    return render_template('Report_Losts.html')
