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


# Set environment variables for Prisma migration
ENV DATABASE_URL="mysql://root:1101@localhost:3306/jon"


RUN npx prisma generate

# Set environment variables for Prisma migration
ENV DATABASE_URL="mysql://root:1101@localhost:3306/jon"


# Run database migrations
RUN npx prisma migrate deploy

# Build the Next.js application inside the container
RUN npm run build

# Expose the port on which the application will run
EXPOSE 3000

# Start the application
CMD ["npm", "start"]