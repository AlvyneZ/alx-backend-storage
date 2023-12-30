#!/usr/bin/env python3
"""
8-all.py - Provides one function:
    list_all(mongo_collection)
"""
from pymongo.collection import Collection


def list_all(mongo_collection: Collection):
    """
    Function that lists all documents in a collection

    mongo_collection(Collection): MongoDB collection object

    Returns: A list of documents
    """
    return [doc for doc in mongo_collection.find()]


if __name__ == "__main__":
    from pymongo import MongoClient

    client = MongoClient('mongodb://root:rootroot@127.0.0.1:27017')
    school_collection = client.my_db.school
    schools = list_all(school_collection)
    for school in schools:
        print("[{}] {}".format(school.get('_id'), school.get('name')))
