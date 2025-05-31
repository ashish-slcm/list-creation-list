# Step 1: Use an official Node.js image as the base image
FROM node:18 AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Build the React app for production
RUN npm run build

# Step 7: Use an Nginx image to serve the built app
FROM nginx:alpine

# Step 8: Copy the build output to the Nginx HTML directory
COPY --from=build /app/build /usr/share/nginx/html

# Step 9: Expose the port Nginx will use
EXPOSE 80

# Step 10: Start Nginx
CMD ["nginx", "-g", "daemon off;"]
