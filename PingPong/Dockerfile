# Use an official Node.js runtime as the base image
FROM node:18-alpine

# Set the working directory inside the Docker image
WORKDIR /app

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define shell script for starting Node.js (assuming script exists)
CMD ["/bin/sh", "./migration.sh"]
