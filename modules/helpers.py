from config.config import connect

def get_categories_short_list():
    conexion = connect()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute("SELECT category_id, category_name FROM categories ORDER BY category_id")
    categorias = cursor.fetchall()
    conexion.close()
    return categorias

def get_users_short_list():
    conexion = connect()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute("SELECT user_id, user_name FROM users ORDER BY user_id")
    usuarios = cursor.fetchall()
    conexion.close()
    return usuarios