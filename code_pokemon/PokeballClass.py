from typing import MutableSequence
import mysql.connector
class Pokeball:
    def __init__(self) -> None:
        pass

    def UpdateNbOfPokeBall(self, pokeballName, quantity):
        conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="mydb"
        )
        mycursor = conn.cursor()

        mycursor.execute("UPDATE pokeball SET quantity = "+ str(quantity) + " WHERE name = '" + str(pokeballName)+ "'")
        conn.commit()
        conn.close()