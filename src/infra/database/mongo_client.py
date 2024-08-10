import os
from pymongo import MongoClient, errors


def mongo_client():
    try:
        client = MongoClient(
            os.getenv("MONGO_URI"),
        )
        db = client[os.getenv("DATABASE_NAME")]
        return db
    except errors:
        return errors
