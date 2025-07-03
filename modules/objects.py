from config.config import connect

def register_found_object(object_name, object_description, category_id, student, found_place, extra_comments, object_image):
    connection = connect()
    cursor = connection.cursor()

    query = """
        INSERT INTO objects (
            object_name,
            object_description,
            object_status,
            object_category_id, 
            object_photo
        ) VALUES (%s, %s, %s, %s, %s)
    """
    datos = (
        object_name,
        object_description,
        "found",
        category_id,
        object_image
    )
    cursor.execute(query, datos)
    connection.commit()

    cursor2 = connection.cursor(dictionary=True)
    cursor2.execute("SELECT MAX(object_id) FROM objects")
    object_id = cursor2.fetchone()['MAX(object_id)']
    print("OBJECT ID:", object_id)

    query = """
        INSERT INTO found_reports (
            found_report_object_id,
            found_place,
            found_reporting_user_id,
            found_report_extra_comments
        ) VALUES (%s, %s, %s, %s)
    """
    datos = (
        object_id,
        found_place,
        student,
        extra_comments
    )
    
    cursor3 = connection.cursor()
    cursor3.execute(query, datos)
    connection.commit()
    connection.close()

def register_lost_object(object_name, object_description, category_id, student, found_place, extra_comments):
    connection = connect()
    cursor = connection.cursor()

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
        category_id
    )
    cursor.execute(query, datos)
    connection.commit()

    cursor2 = connection.cursor(dictionary=True)
    cursor2.execute("SELECT MAX(object_id) FROM objects")
    object_id = cursor2.fetchone()['MAX(object_id)']
    print("OBJECT ID:", object_id)

    query = """
        INSERT INTO lost_reports (
            lost_report_object_id,
            lost_place,
            lost_reporting_user_id,
            lost_report_extra_comments
        ) VALUES (%s, %s, %s, %s)
    """
    datos = (
        object_id,
        found_place,
        student,
        extra_comments
    )
    
    cursor3 = connection.cursor()
    cursor3.execute(query, datos)
    connection.commit()
    connection.close()

def load_lost_objects():
    connection = connect()
    cursor = connection.cursor(dictionary=True)
    querie = "SELECT lost_report_id, lost_report_object_id, lost_reporting_user_id, lost_date, lost_place, objects.object_name, objects.object_category_id, objects.object_photo, objects.object_status, categories.category_name, users.user_name FROM lost_reports LEFT JOIN objects ON lost_report_object_id = objects.object_id LEFT JOIN categories ON objects.object_category_id = categories.category_id LEFT JOIN users ON lost_reporting_user_id = users.user_id;"
    cursor.execute(querie)
    objects_db = cursor.fetchall()
    connection.close()
    return objects_db

def load_lost_specific_object():
    connection = connect()
    cursor = connection.cursor(dictionary=True)
    querie = "SELECT lost_report_id, lost_report_extra_comments, lost_reporting_user_id, lost_date, lost_place, objects.object_name, objects.object_category_id, objects.object_photo, objects.object_description, objects.object_status, categories.category_name, users.user_name FROM lost_reports LEFT JOIN objects ON lost_report_object_id = objects.object_id LEFT JOIN categories ON objects.object_category_id = categories.category_id LEFT JOIN users ON lost_reporting_user_id = users.user_id;"
    cursor.execute(querie)
    objects_db = cursor.fetchall()
    connection.close()
    return objects_db

def load_found_objects():
    connection = connect()
    cursor = connection.cursor(dictionary=True)
    querie = "SELECT found_report_id, found_report_object_id, found_reporting_user_id, found_date, found_place, objects.object_name, objects.object_category_id, objects.object_photo, objects.object_status, categories.category_name, users.user_name FROM found_reports LEFT JOIN objects ON found_report_object_id = objects.object_id LEFT JOIN categories ON objects.object_category_id = categories.category_id LEFT JOIN users ON found_reporting_user_id = users.user_id;"
    cursor.execute(querie)
    objects_db = cursor.fetchall()
    connection.close()
    return objects_db

def load_found_specific_objects():
    connection = connect()
    cursor = connection.cursor(dictionary=True)
    querie = "SELECT found_report_id, found_report_object_id, found_report_extra_comments, found_reporting_user_id, found_date, found_place, objects.object_name, objects.object_category_id, objects.object_photo, objects.object_description, objects.object_status, categories.category_name, users.user_name FROM found_reports LEFT JOIN objects ON found_report_object_id = objects.object_id LEFT JOIN categories ON objects.object_category_id = categories.category_id LEFT JOIN users ON found_reporting_user_id = users.user_id;"
    cursor.execute(querie)
    objects_db = cursor.fetchall()
    connection.close()
    return objects_db