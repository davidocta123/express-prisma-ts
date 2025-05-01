FROM node:20

WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json package-lock.json prisma ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

RUN npm run build

EXPOSE 3000

# Set working directory for app to run
CMD ["node", "dist/index.js"]
