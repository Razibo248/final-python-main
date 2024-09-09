# Use an official Python runtime as a parent image
FROM python:3.7

# Set the working directory in the container
WORKDIR /app

# Copy the application code to the working directory
COPY . /app

# Install pipenv
RUN pip install pipenv

# Install project dependencies
RUN pipenv install --system --deploy

# Install pytest
RUN pip install pytest

# Expose port 5000 for the application
EXPOSE 5000

# Define the command to run the application
CMD ["python", "/app/app.py"]
