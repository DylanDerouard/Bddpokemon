import mysql.connector
class Inventory:
    def __init__(self) -> None:
        pass
    
    def GetMoney(self):
        conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="mydb"
        )
        mycursor = conn.cursor()

        mycursor.execute("SELECT money FROM inventory WHERE money IS NOT NULL")
        myresult = mycursor.fetchone()
        conn.close()
        return myresult[0]