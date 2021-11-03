import random, os, time, msvcrt
from collections import Counter

from code_pokemon.game import Game
from code_pokemon.inventory import Inventory
from code_pokemon.pokeball import Pokeball
from code_pokemon.shop import Shop


class Pokemon(Game, Inventory, Pokeball, Shop):

    # On fais spawn un pokemon et on affiche le menu d'action
    def goFindAPokemon() :
        randomGetIndex = random.randint(0, len(pokemon)-1)
        spawnedPokemon = spawn(pokemon[randomGetIndex])
        menuChoice = int(input("Appuyer au choix sur : 1-Combattre   2-Capturer   3-Fuir "))
        if menuChoice == 1 :
            fight(pokemonInventory, spawnedPokemon)
            print("")
        elif menuChoice == 2 :
            catchPokemon(spawnedPokemon, ball)
        elif menuChoice == 3 : 
            print("Vous avez fuit \n")
        else :
            print("Touche incorrecte \n")
        mainMenu()

    def spawn(pokemonToSpawn):
        randomNumber = random.randint(0, 100)
        if randomNumber <= pokemonToSpawn["percent"] :
            pokemonToSpawn = generatePokemonStats(pokemonToSpawn)
            print("Un ", pokemonToSpawn["name"], "SAUVAGE est appraru")
            # listOfSpawnedPokemon.append(pokemonToSpawn["name"])
            return pokemonToSpawn
        else :
            randomGetIndex = random.randint(0, len(pokemon)-1)
            return spawn(pokemon[randomGetIndex])

    # Genère les stastisitiques d'attaque, de défense et PV du pokemon qui a spawn
    def generatePokemonStats(pokethon):
        pokethon["attaque"] = random.randint(0, 15)
        pokethon["defense"] = random.randint(0, 15)
        pokethon["PV"] = random.randint(0, 15)
        return pokethon

    # Gestion de la capture du pokemon qui a spawn
    def catchPokemon(pokemon, ball):
        randomCatchNumber = random.randint(0, 100)
        pokeBallType = int(input("Choisir le type de PokeBall :  1-PokeBall   2-SuperBall   3-HyperBall   4-MasterBall "))
        if ball[pokeBallType-1]["nbInInventory"] > 0 :
            tryCatch = ball[pokeBallType-1]["catchRate"]/(1 +(pokemon["resistance"]/100))
            ball[pokeBallType-1]["nbInInventory"] -= 1
            pokemonToAddToInventory = {
                "name" : pokemon["name"],
                "percent" : pokemon["percent"],
                "counter" : pokemon["counter"],
                "resistance" : pokemon["resistance"],
                "attaque" : pokemon["attaque"],
                "defense" : pokemon["defense"],
                "PV" : pokemon["PV"]
            }
            if ball[pokeBallType-1]["name"] == "MasterBall" :
                if len(pokemonInventory) < 6 :
                    pokemonInventory.append(pokemonToAddToInventory)  
                else :
                    pokemonStorage.append(pokemonToAddToInventory)  
                return print(pokemon["name"], "capturé avec succès"), time.sleep(5)
            elif randomCatchNumber <= tryCatch :
                pokemonInventory.append(pokemon)
                return print(pokemon["name"], "capturé avec succès"), time.sleep(5)
            else :
                return print("Le pokémon s'est échappé"), time.sleep(3)
        else :
            print("Vous n'avez pas de", ball[pokeBallType-1]["name"]), time.sleep(2)
            catchPokemon(pokemon, ball)
