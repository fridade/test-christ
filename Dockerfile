# Use the official Python base image from the Docker Hub
FROM python:3.9-slim

# Set environment variables to avoid writing .pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1
# Set environment variable for unbuffered output
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Define the command to run the application
CMD ["python", "app.py"]
