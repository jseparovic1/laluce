FROM node:18-alpine as base
WORKDIR /app
COPY package*.json ./

# Development stage
FROM base as dev
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]

# Production stage
FROM base as prod
RUN npm install --production
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "run", "preview"] 