FROM node:20

WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json package-lock.json prisma ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build TypeScript
RUN npx tsc

# Set working directory for app to run
CMD ["node", "dist/index.js"]