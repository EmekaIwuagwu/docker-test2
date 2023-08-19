# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the application code to the container
COPY . .

# Expose the port that the Node.js application will run on
EXPOSE 3000

# Set environment variables for MySQL
ENV MYSQL_HOST=localhost
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=22suarez
ENV MYSQL_DATABASE=employeedb

# Install MySQL client
RUN apt-get update && apt-get install -y mysql-client

# Start the Node.js application
CMD [ "node", "app.js" ]
