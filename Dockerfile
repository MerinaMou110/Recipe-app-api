# Use the official Python 3.9 Alpine image
FROM python:3.9-alpine

# Set a label for the maintainer
LABEL maintainer="Bangladesh App Developer Ltd"

# Set environment variable to avoid Python buffering issues
ENV PYTHONUNBUFFERED=1

# Install system dependencies (if needed, for packages like psycopg2)
RUN apk add --no-cache gcc musl-dev libffi-dev postgresql-dev

# Create a non-root user and switch to that user for better security
RUN adduser -D user

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY ./requirements.txt /requirements.txt

# Install the dependencies from requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Copy the app code to the container's /app directory
COPY ./app /app

# Switch to the non-root user
USER user

# Command to run the application (modify based on your app)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]  # For Django
