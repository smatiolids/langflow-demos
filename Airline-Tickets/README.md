# Airline Agent

This is a Langflow Agent to help the customer service agent to answer questions about the airline tickets and miles.

## Setup

1. Create an accounnt on DataStax Astra (astra.datastax.com)

2. Create a new database (Vector enabled)

3. Create a collection (latam_tickets1) not vector enabled

4. Create a collection (latam_faq) vector enabled. You can use Vectorize for the embedding generation.

5. Create the table latam_miles in the database. Use the script schema.sql to create the table on the CQL Console.

6. Download the secure connect bundle and save it in the root folder

7. Generate a token and save the credentials in the .env file

8. Update the .env file SCB file path

9. Install dependencies: 
```bash
pip install -r requirements.txt
```

10. Load the miles transactions: 
```bash
python load_miles.py
```

11. Generate tickets: 
```bash
python generate_tickets.py
```

12. Install Langflow 1.3 
```bash
uv pip install langflow
```

13. Run the agent
```bash
uv run langflow run
```