from flask import Blueprint, request, jsonify
from ..models.user import User
from .. import db

user_bp = Blueprint('users', __name__)

@user_bp.route('/', methods=['GET'])
def get_users():
    users = User.query.all()
    return jsonify([{'id': u.id, 'nombre': u.nombre, 'correo': u.correo} for u in users])

@user_bp.route('/', methods=['POST'])
def create_user():
    data = request.json
    nuevo = User(nombre=data['nombre'], correo=data['correo'])
    db.session.add(nuevo)
    db.session.commit()
    return jsonify({'message': 'Usuario creado'}), 201
