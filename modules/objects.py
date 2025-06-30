from config.config import connect

def register_lost_object(object_name, object_description, category_id):
    # query = """
    #     INSERT INTO objetos_perdidos (
    #         object_name,
    #         object_description,
    #         object_status,
    #         object_photo,
    #         object_catgeory_id,
    #     ) VALUES (%s, %s, %s, %s, %s)
    # """

    conexion = connect()
    cursor = conexion.cursor()

    query = """
        INSERT INTO objects (
            object_name,
            object_description,
            object_status,
            object_category_id
        ) VALUES (%s, %s, %s, %s)
    """

    datos = (
        object_name,
        object_description,
        "lost",
        # object_photo,
        category_id
    )

    cursor.execute(query, datos)
    conexion.commit()

    # query = """
    #     INSERT INTO lost_reports (
    #         object_name,
    #         object_description,
    #         object_status,
    #         object_category_id
    #     ) VALUES (%s, %s, %s, %s)
    # """

    # datos = (
    #     object_name,
    #     object_description,
    #     "lost",
    #     # object_photo,
    #     category_id
    # )

    # cursor.execute(query, datos)
    # conexion.commit()
    conexion.close()