#!/usr/bin/env python3
"""
8-all.py - Provides one function:
    list_all(mongo_collection)
"""
from typing import List
from pymongo.collection import Collection


def list_all(mongo_collection: Collection) -> List:
    """
    Function that lists all documents in a collection

    mongo_collection(Collection): MongoDB collection object

    Returns: A list of documents
    """
    return [doc for doc in mongo_collection.find()]
