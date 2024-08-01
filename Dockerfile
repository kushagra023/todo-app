# Use the official Python image as a base image
FROM python:3.9-slim

# Set environment variables to prevent Python from writing pyc files to disc
# and to ensure the output is flushed directly to the terminal
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Set the working directory in the container
WORKDIR /app

# Copy the application code to the working directory
COPY . /app/

# Install dependencies
RUN pip install --no-cache-dir django

# Run migrations and create a superuser
RUN python manage.py makemigrations
RUN python manage.py migrate

# Expose the port on which the app will run
EXPOSE 8000

# Define the command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
