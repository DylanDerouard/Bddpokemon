import random, os, time, msvcrt
from collections import Counter

from code_pokemon.game import Game
from code_pokemon.inventory import Inventory
from code_pokemon.pokeball import Pokeball
from code_pokemon.shop import Shop

class Game(Inventory, Pokeball, Shop):

    def _init_(self, pokedollars, ball, inventory):
        global pokedollars
        os.system('cls')
        action = int(input("Sélectionner l'action souhaitée : 1- Allez au Shop  2-Afficher l'inventaire  3- Allez chasser du Pokémon  4-Quitter "))
        if action == 1:
            os.system('cls')
            Shop.shop(ball)
        elif action == 2 :
            os.system('cls')
            showInventory()
        elif action == 3 :
            os.system('cls')
            goFindAPokemon()
        elif action == 4 :
            os.system('cls')
            exit()

    def mainMenu():
        global pokedollars
        os.system('cls')
        action = int(input("Sélectionner l'action souhaitée : 1- Allez au Shop  2-Afficher l'inventaire  3- Allez chasser du Pokémon  4-Quitter "))
        if action == 1:
            os.system('cls')
            shop(ball)
        elif action == 2 :
            os.system('cls')
            showInventory()
        elif action == 3 :
            os.system('cls')
            goFindAPokemon()
        elif action == 4 :
            os.system('cls')
            exit()

