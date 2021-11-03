import mysql.connector
class GenericCrud:

    def _init_(self, getAll, getByID, mycursor):
        self.GetAll = getAll
        self.GetByID = getByID
        self.mycursor = mycursor

    def GetAll(mycursor, entity):
        mycursor.execute("SELECT * FROM " + str(entity))
        myresult = mycursor.fetchone()
        return myresult

    def GetByID(mycursor, entity):
        mycursor.execute("SELECT * FROM " + str(entity) + " WHERE " + str(entity.id)) + " <= 6"  
        myresult = mycursor.fetchone()
        return myresult

    def Post(mycursor, entity):
        mycursor.execute("INSERT INTO" + str(entity) + "() VALUES ()" )