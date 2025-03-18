# Scheduler Agent

This is a simple agent that schedules appointments for a given specialty, location, and provider.

## Setup

1. Install the requirements

```bash
pip install -r requirements.txt
```

2. Create a `.env` file and add the following:

Get the Astra DB API endpoint and token from the Astra DB UI.
```bash
ASTRA_DB_API_ENDPOINT=
ASTRA_DB_APPLICATION_TOKEN=
```

3. Run the script

```bash
python generate-schedules.py
```
# Managing Schedules

## Generate Schedules

```bash
python generate-schedules.py generate
```

## Delete Schedules

```bash
python generate-schedules.py delete
```

## Get Schedules

```bash
python generate-schedules.py get '{"specialty": {"$eq": "surgeon"}, "timestamp": {"$gt": "2025-03-25T00:00:00Z", "$lte": "2025-03-26T00:00:00Z"}}'
```
