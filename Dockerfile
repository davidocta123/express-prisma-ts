FROM node:20

WORKDIR /app

# Salin file dependensi dulu untuk cache
COPY package.json package-lock.json prisma ./

# Install dependensi
RUN npm install

# Salin seluruh source code (termasuk file TypeScript)
COPY . .

# Build TypeScript
RUN npx tsc

# Verifikasi hasil build (opsional, tapi bagus buat debug)
RUN ls -l dist

# Jalankan aplikasi
CMD ["node", "dist/index.js"]
