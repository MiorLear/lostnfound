from flask import Flask
from routes.dashboard import control_panel_bp
from routes.login import login_bp
from routes.landing import landing_bp
from routes.lost_objects import lost_objects_bp
from routes.found_objects import found_objects_bp
from routes.objects_register import objects_register_bp


app = Flask(__name__, static_folder='assets')

app.register_blueprint(lost_objects_bp)
app.register_blueprint(found_objects_bp)
app.register_blueprint(objects_register_bp)
app.register_blueprint(landing_bp)
app.register_blueprint(control_panel_bp)
app.register_blueprint(login_bp)

# @app.route('/')
# def index():
#     return render_template('index.html')

# @app.route('/login')
# def login():
#     return render_template('login.html')

# @app.route('/dashboard')
# def dashboard():
#     return render_template('control.html')

if __name__ == '__main__':
    app.run(debug=True)