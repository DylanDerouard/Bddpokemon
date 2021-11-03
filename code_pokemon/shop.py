import random, os, time, msvcrt
from collections import Counter

from code_pokemon.game import Game
from code_pokemon.inventory import Inventory
from code_pokemon.pokeball import Pokeball
from code_pokemon.shop import Shop

class Shop:

    def _init_(self, pokeball):
        self.pokeball = pokeball
        global pokedollars
        print("Votre solde :", pokedollars)
        chosenPokeball = int(input("Séléctionner une PokeBall à acheter : 1-Pokeball 200$  2-Superball 600$  3-Hyperball 1200$  4-Materball 50000$ "))
        if chosenPokeball == 1 :
            addBallToInventory(200, pokeball[chosenPokeball-1])
        elif chosenPokeball == 2 :
            addBallToInventory(600, pokeball[chosenPokeball-1])
        elif chosenPokeball == 3 :
            addBallToInventory(1200, pokeball[chosenPokeball-1])
        elif chosenPokeball == 4 :
            addBallToInventory (50000, pokeball[chosenPokeball-1])
        else :
            print("Touche Incorrecte")

    # Ajout des pokeballs acheter, mise à jour du pokedollars, vérification si solde suffisant
    def addBallToInventory(price, pokeball) :
        global pokedollars
        quantity = int(input("Choisir une quantité "))
        if quantity*price > pokedollars:
            print("Vous n'avez pas assez d'argent")
            time.sleep(2)
            os.system('cls')
            return shop(ball)
        else :
            pokeball["nbInInventory"] += quantity
            print("Merci de votre achat de",quantity, pokeball["name"])
            pokedollars -= quantity*price
            print("Nouveau solde : ", pokedollars,"$")
            time.sleep(4)
            mainMenu()
