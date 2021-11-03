import random, os, time, msvcrt
from collections import Counter

from code_pokemon.game import Game
from code_pokemon.inventory import Inventory
from code_pokemon.pokeball import Pokeball
from code_pokemon.shop import Shop

class Inventory:

    def showInventory() :
        pokeBallInfosToShow = ""
        pokemonInventoryInfosToshow = ""
        pokemonStorageInfosToshow = ""
        stayInInventory = True
        for element in ball:
            pokeBallInfosToShow += element["name"] + " : " + str(element["nbInInventory"]) + "   "
        for element in pokemonInventory :
            pokemonInventoryInfosToshow += "  " + element["name"] +":  Attaque : "+ str(element["attaque"]) +"   Défense : "+ str(element["defense"]) +"   PV : "+ str(element["PV"]) + "\n"
        for element in pokemonStorage :
            pokemonStorageInfosToshow += "  " + element["name"] +":  Attaque : "+ str(element["attaque"]) +"   Défense : "+ str(element["defense"]) +"   PV : "+ str(element["PV"]) + "\n"
        print("PokeDollars : ", pokedollars)
        print(pokeBallInfosToShow)
        print("Pokémon dans l'inventaire : \n", pokemonInventoryInfosToshow)
        print("Pokémon dans le stockage : \n", pokemonStorageInfosToshow)
        print("\n \n Appuyez sur 'Échap' pour retourner au menu")
        while stayInInventory == True:
            if msvcrt.kbhit() and msvcrt.getch()[0] == 27 :
                stayInInventory = False
                mainMenu()