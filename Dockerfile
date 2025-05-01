FROM node:20

WORKDIR /app

# Copy package.json and lock first
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy all source files, including TypeScript and prisma folder
COPY . .

# Build TypeScript (pastikan ada tsconfig.json)
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
