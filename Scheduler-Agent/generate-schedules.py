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

# Create a vector collection
schedule_collection = database.get_collection(
    "schedule_appointment",
)

def generate_schedules():
    
    specialties = ["cardiology", "dentist", "general_practice", "pediatrician", "psychiatrist", "surgeon"]
    locations = ["New York", "Los Angeles", "Chicago", "Houston", "Miami", "San Francisco", "Seattle", "Washington D.C."]
    providers = ["Dr. John Smith", "Dr. Jane Doe", "Dr. Jim Beam", "Dr. Jill Hill", "Dr. Jack Daniels", "Dr. John Doe", "Dr. Jane Smith"]
    working_hours = {"start_time": "9:00", "end_time": "17:00"}
    appointment_duration = 30
    appointment_buffer = 15
    dates = ["2025-03-19", "2025-03-20", "2025-03-21",  "2025-03-24", "2025-03-25", "2025-03-26", "2025-03-27", "2025-03-28"]

    for specialty in specialties:
        for location in locations:
            appointments = []
            for provider in providers:
                start_time = datetime.strptime(working_hours["start_time"], "%H:%M")
                end_time = datetime.strptime(working_hours["end_time"], "%H:%M")
                current_time = start_time
                
                while current_time + timedelta(minutes=appointment_duration + appointment_buffer) < end_time:
                    for date in dates:
                        appointments.append({
                            "specialty": specialty,
                            "location": location,
                            "provider": provider,
                            "date": date,
                            "timestamp": datetime.strptime(f"{date}T{current_time.strftime('%H:%M')}:00.000+00:00", 
                                                         "%Y-%m-%dT%H:%M:%S.%f%z"),
                            "start_timestamp": current_time.strftime("%H:%M"),
                            "end_timestamp": (current_time + timedelta(minutes=appointment_duration)).strftime("%H:%M")
                        })
                        current_time += timedelta(minutes=appointment_duration + appointment_buffer)
            
            print(f"Inserting {len(appointments)} appointments for {specialty} in {location} with {provider}")
            res = schedule_collection.insert_many(appointments)
            print(f"Inserted {len(res.inserted_ids)} appointments")
            

def delete_schedules():
    res = schedule_collection.delete_many({})
    print(f"Deleted {res.deleted_count} schedules")

def get_schedules(condition):
    condition = condition.replace("'", '"')
    print("Condition:")
    print(condition)
    res = schedule_collection.find(json.loads(condition))
    print("Result:")
    print(res)
    for schedule in res:
        print(schedule)

if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "generate":
        generate_schedules()
    elif len(sys.argv) > 1 and sys.argv[1] == "delete":
        delete_schedules()
    elif len(sys.argv) > 1 and sys.argv[1] == "get":
        get_schedules(sys.argv[2])
    else:
        print("Usage: python generate-schedules.py [generate|delete]")
