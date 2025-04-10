# #old docker file start

# #Stage 1: Build the React app
# FROM node:18

# WORKDIR /vr-docker-react-jenkins-app

# # Copy package.json and install dependencies
# COPY package.json package-lock.json ./ 
# RUN npm install

# # Copy the rest of the app
# COPY . .

# # Expose port 3000
# EXPOSE 5173

# # Run the development server
# CMD ["npm", "run", "dev"]

# #old docker file end

# Stage 1: Build the React app (for production)
FROM node:18 AS builder

WORKDIR /vr-docker-react-jenkins-app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the app
COPY . ./

# Build the React app
RUN npm run build

# Stage 2: Serve the app using Nginx (production mode)
FROM nginx:1.23 AS production

# Copy the production build from the builder stage
COPY --from=builder /vr-docker-react-jenkins-app/dist /usr/share/nginx/html

# Expose port 80 for production
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

FROM node:18 As developmet  

WORKDIR /vr-docker-react-jenkins-app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./ 
RUN npm install

# Copy the rest of the app
COPY . .

# Expose port 3000
EXPOSE 5173

# Run the development server
CMD ["npm", "run", "dev"]