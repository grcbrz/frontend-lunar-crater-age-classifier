# Base stage
FROM python:3.10.6-slim

# Set the working directory
WORKDIR /prod

# Leverage Docker's build cache
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --upgrade pip

COPY . .

EXPOSE 8501

# Define the startup command
CMD ["streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0"]
