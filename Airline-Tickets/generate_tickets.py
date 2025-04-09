from datetime import datetime, timedelta
import random
import json
from astrapy import DataAPIClient
import os
from datetime import datetime, timedelta
from dotenv import load_dotenv
import sys
import json
load_dotenv(override=True)

ASTRA_DB_APPLICATION_TOKEN = os.getenv("ASTRA_DB_APPLICATION_TOKEN")
ASTRA_DB_API_ENDPOINT = os.getenv("ASTRA_DB_API_ENDPOINT")

# Connect and create the Database object
client = DataAPIClient(ASTRA_DB_APPLICATION_TOKEN)
database = client.get_database(ASTRA_DB_API_ENDPOINT)

print("Connected to Astra DB")
print(database)

# Create a vector collection
airline_tickets_collection = database.get_collection(
    "latam_tickets1",
)
# Helper data
origins = ["GRU", "SCL", "LIM", "BOG", "EZE"]
destinations = ["JFK", "MIA", "CDG", "SYD", "MAD", "LAX", "MEX"]
aircrafts = [
    "Airbus A320", "Airbus A319", "Boeing 767", "Airbus A320neo",
    "Boeing 787-8 Dreamliner", "Boeing 777-300ER", "Airbus A321",
    "Boeing 787-9 Dreamliner", "Airbus A350-900"
]

# Generate 50 ticket
def generate_tickets(tickets_count):
    tickets = []
    start_date = datetime(2025, 4, 8)
    # airline_tickets_collection.delete_many({})
    for i in range(tickets_count):
        for j in range(0, 100):
            origin = random.choice(origins)
            destination = random.choice([d for d in destinations if d != origin])
            departure = start_date + timedelta(days=random.randint(0, 22), hours=random.randint(0, 23), minutes=random.randint(0, 59))
            arrival = departure + timedelta(hours=random.randint(2, 14))
            aircraft = random.choice(aircrafts)
            economy_price = round(random.uniform(220, 1300), 2)
            executive_price = round(economy_price * 1.8, 2)
            first_class_price = round(economy_price * 2.7, 2)
            ticket = {
                "flightNumber": f"LA{800 + i}",
                "airline": "LATAM Airlines",
                "origin": origin,
                "destination": destination,
                "departureTime": departure.isoformat(),
                "arrivalTime": arrival.isoformat(),
                "aircraft": aircraft,
                "pricesUSD": {
                    "economy": economy_price,
                    "executive": executive_price,
                    "firstClass": first_class_price
                },
                "seatsAvailable": random.randint(3, 20)
            }
            # res = airline_tickets_collection.insert_one(ticket)
            # print(f"Inserted ticket {res.inserted_id}")
            tickets.append(ticket)
        print(f"Inserting {len(tickets)} tickets")
        res = airline_tickets_collection.insert_many(tickets)
        print(f"Inserted {len(res.inserted_ids)} tickets")
        tickets = []


if __name__ == "__main__":
    generate_tickets(50)
