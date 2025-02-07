FROM node:18-alpine as base
WORKDIR /app
COPY package*.json ./

# Development stage
FROM base as dev
EXPOSE 3000
ENV HOST=0.0.0.0
CMD ["npm", "run", "dev", "--", "--host"]

# Production stage
FROM base as prod
COPY . .
RUN npm install
RUN npm run build
ENV HOST=0.0.0.0
CMD ["npm", "run", "preview", "--", "--host"] 