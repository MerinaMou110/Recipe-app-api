# Use the official Python 3.7 Alpine image
FROM python:3.7-alpine

# Set a label for the maintainer
LABEL maintainer="Bangladesh App Developer Ltd"

# Set environment variable to avoid Python buffering issues
ENV PYTHONUNBUFFERED=1

RUN mkdir /app
# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY ./requirements.txt /requirements.txt

# Install the dependencies from requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Copy the app code to the container's /app directory
COPY ./app /app

# Create a non-root user and switch to that user for better security
RUN adduser -D user
USER user

# Command to run the application (modify this based on how you start your app)
# CMD ["python", "app.py"]
