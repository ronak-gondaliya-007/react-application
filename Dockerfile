#old docker file start

#Stage 1: Build the React app
FROM node:18

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

#old docker file end

