import os
from pymongo import MongoClient

def mongo_client():
    try:
        client = MongoClient(os.getenv('MONGO_URI'), )
        db = client["test"]
        return db
    except Exception as e:
        print(e)
