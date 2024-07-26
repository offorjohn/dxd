# Use a Node.js 18 base image
FROM node:20


# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and yarn.lock files to the container
COPY package*.json ./

# Install dependencies inside the container
RUN npm install

# Copy the rest of the application code to the container
COPY . .

RUN npx prisma generate

# Run database migrations
RUN npx prisma migrate deploy

# Build the Next.js application inside the container
RUN npm run build

# Expose the port on which the application will run
EXPOSE 3000

# Start the application
CMD ["npm", "start"]