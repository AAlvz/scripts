#!/usr/bin/python
import pymongo
from pymongo import MongoClient
#client = MongoClient('localhost', 27017) #Para especificar host y puerto.
client = MongoClient() #Entra al default
db = client.frases_db
collection = db.peliculas
#nuevaFrase = {"autor":"Darth Vader","frase":"I am your father", "pelicula":"Star Wars", "estrellas":"****", "categoria":"Superioridad"}
#collection_id = collection.insert(nuevaFrase) #Insert devuelve el valor del ID
#print "El id fueee: " + str(collection_id)
#autor = collection.find_one()
#for valor in autor:
#    print autor[valor]
for resultado in collection.find():
    for valor in resultado:
        print resultado[valor]
print "en total fueron: " + str(collection.count())
print "en total Yoda: " + str(collection.find({"autor":"Yoda"}).count())
print "en total Darth: " + str(collection.find({"autor":"Darth Vader"}).count())

#print db.collection_names() 
