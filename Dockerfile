# Use an official Node.js runtime as the base image
FROM node:16-alpine

# Install Docker
RUN apk add --no-cache \
    docker \
    bash \
    curl \
    git

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to start the application
CMD ["node", "app.js"]
