# Improve RAG Livestream

Youtube URL: https://www.youtube.com/watch?v=dYBAZ9oa5y0

## Langflow components code

Create a custom component and use the code from the following files:

- Astra DB Tool code: (./astradb.py)
- Astra DB CQL Tool code: (./astradb_cql.py)

# Flows

- (Agentic RAG Basic.json): Simple Agentic RAG with Astra DB Tool
- (Agentic RAG Hybrid.json): Advanced Agentic RAG with Astra DB Tool with hybrid search (Vector Search + Metadata Filtering)
- (Agentic RAG CQL.json): Strutured data from Astra DB tables connected to an agent

## Loading Transactional data

Run the script from the file (transactions.sql) to create the table, index and insert some data into the Astra DB table.
