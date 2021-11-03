import mysql.connector
class Model:

    conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="mydb"
    )
    mycursor = conn.cursor()

    def _init_(self, getAll, getByID):
        self.getAll = getAll
        self.getByID = getByID

    def getAll():

        getAll()


    def getByID():

        getbyid()