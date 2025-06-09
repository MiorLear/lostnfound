from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from .config import Config

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    CORS(app)

    db.init_app(app)

    from .routes.user_routes import user_bp
    app.register_blueprint(user_bp, url_prefix='/api/users')

    return app
