# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the application (for production)
RUN npm run build

# Expose the Nuxt.js default port
EXPOSE 4000

# Start the application
CMD ["npm", "run", "start"]
