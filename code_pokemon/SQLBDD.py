import mysql.connector
class GenericCrud:
    def __init__(self) -> None:
        pass

    def GetAll(self, entity):
        conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="mydb"
        )
        mycursor = conn.cursor()

        mycursor.execute("SELECT * FROM " + str(entity))
        myresult = mycursor.fetchall()
        conn.close()
        return myresult

    def GetByID(mycursor, entity):
        mycursor.execute("SELECT * FROM " + str(entity) + " WHERE " + str(entity.id)) + " <= 6"  
        myresult = mycursor.fetchone()
        return myresult

    def GetByName(self, entity, name):
        conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="mydb"
        )
        mycursor = conn.cursor()

        mycursor.execute("SELECT " + str(name) + " FROM " + str(entity))
        myresult = mycursor.fetchall()
        conn.close()
        return myresult

    def Post(mycursor, entity):
        mycursor.execute("INSERT INTO" + str(entity) + "() VALUES ()" )
