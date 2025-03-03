# Mastering the Loop Component & Agentic RAG in Langflow

This demo showcases how to use the Loop Component in Langflow to create an agentic RAG system. The system processes job listings data and demonstrates iterative refinement through looping.


## ATTENTION

If you are facing issues with the structured output component, depending on the version, you will have to update the `build_structured_output` method as follows:

```python
    def build_structured_output(self) -> Data:
        output = self.build_structured_output_base()
        if isinstance(output, list) and len(output) > 0:
            return Data(data=output[0])
        return Data(data=output)
```

### Files Included
- `hn_jobs copy.csv`: Sample job listings data
- `Loop Component & Agentic RAG Demo.json`: Langflow flow configuration file

### Features
- Implementation of Loop Component for iterative processing
- Agentic RAG system for intelligent data handling
- Job listings analysis and processing
- Demonstrates advanced Langflow capabilities

### Getting Started
1. Import the JSON flow file into Langflow
2. Load the provided CSV data
3. Execute the flow to see the Loop Component and Agentic RAG in action

### References

YouTube video in English: https://www.youtube.com/watch?v=9Wx7WODSKTo
YouTube video in Portuguese: https://www.youtube.com/watch?v=DmqzJkoFb6M

CSV file: https://www.kaggle.com/datasets/cshefali/hackernews-150-job-listings-oct-2024-jan-2025
Flow: Loop Component & Agentic RAG.json
