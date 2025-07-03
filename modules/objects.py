from config.config import connect

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
