from dataclasses import dataclass
from cassandra.query import SimpleStatement, PreparedStatement, BatchStatement
from cassandra.cluster import Cluster, PlainTextAuthProvider
from dotenv import load_dotenv, find_dotenv
import os
import json
from datetime import datetime
import uuid

dotenv_file = find_dotenv('.env')
load_dotenv(dotenv_file, override=True)

ASTRA_DB_SECURE_BUNDLE_PATH = os.environ["ASTRA_DB_SECURE_BUNDLE_PATH"]
ASTRA_DB_CLIENT_ID = os.environ["ASTRA_DB_CLIENT_ID"]
ASTRA_DB_CLIENT_SECRET = os.environ["ASTRA_DB_CLIENT_SECRET"]
ASTRA_DB_APPLICATION_TOKEN = os.environ["ASTRA_DB_APPLICATION_TOKEN"]
ASTRA_DB_KEYSPACE = os.environ["ASTRA_DB_KEYSPACE"]

cluster = Cluster(
    cloud={
        "secure_connect_bundle": ASTRA_DB_SECURE_BUNDLE_PATH,
    },
    auth_provider=PlainTextAuthProvider(
        ASTRA_DB_CLIENT_ID,
        ASTRA_DB_CLIENT_SECRET,
    ),
)
session = cluster.connect()
customer_id =  uuid.uuid4()

print("Connected to Astra DB")


def load_miles():
    listings = []
    
    # Read CSV file
    with open("miles.json", 'r') as file:
        listings = json.load(file)

    print(f"{len(listings)} listings to be loaded")

    stmt = f"""
        INSERT INTO {ASTRA_DB_KEYSPACE}.latam_miles
        (customer_id,
        date,
        description,
        type,
        source,
        miles,
        monetary_amount,
        balance)
        VALUES
        (:customer_id,
        :date,
        :description,
        :type,
        :source,
        :miles,
        :monetary_amount,
        :balance)
    """

    query = session.prepare(stmt)
    batch_size = 10

    for i in range(0, len(listings), batch_size):
        batch = BatchStatement()
        batch_data = listings[i:i + batch_size]

        for row in batch_data:
            new_row = {
                'customer_id': customer_id,
                'date': datetime.strptime(row['date'], '%Y-%m-%d'),
                'description': row['description'],
                'type': row['type'],
                'source': row['source'],
                'miles': row['miles'],
                'monetary_amount': row['monetary_amount'],
                'balance': row['balance']
            }

            batch.add(query, new_row)

        session.execute(batch)
        print(f'Batch {i} done')

    return f"{len(listings)} miles transactions loaded"


load_miles()
