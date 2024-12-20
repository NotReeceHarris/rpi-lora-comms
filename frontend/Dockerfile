# Use node:22.12.0-alpine to ensure you're using Node.js version 22.12.0 with Alpine Linux as the base
FROM node:22.12.0-alpine

WORKDIR /app

# Copy package.json and package-lock.json for npm install
COPY package*.json ./
# Install npm dependencies
RUN npm install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Build your app
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app using sirv-cli, assuming your build artifacts are in 'public'
CMD ["node", "build/index.js"]