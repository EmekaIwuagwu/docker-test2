# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port that the application will run on
EXPOSE 3000

# Set up environment variables for MySQL configuration
ENV MYSQL_HOST=localhost
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=pass1234
ENV MYSQL_DATABASE=employeedb

# Install MySQL client
RUN apt-get update && \
    apt-get install -y mysql-client

# Start the Node.js application
CMD ["node", "app.js"]
