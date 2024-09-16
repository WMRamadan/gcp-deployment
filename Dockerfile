# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container to /app
WORKDIR /app

# Copy the package.json and package-lock.json into the container
COPY ./app ./

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app in production mode
CMD ["node", "build/index.js"]
