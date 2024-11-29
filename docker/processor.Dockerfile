# Use the official Node.js 18 image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY packages/marketplace-processor/ .

# Install dependencies
RUN npm i && npm run build

# # Expose the port that the application will run on
EXPOSE 3005

# # Start the application
CMD ["npm", "run", "start:prod"]