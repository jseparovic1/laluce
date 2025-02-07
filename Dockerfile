FROM node:18-alpine as base
WORKDIR /app

FROM base as dev
COPY . .
RUN npm install
EXPOSE 3000
CMD ["npm", "run", "dev"]

FROM base as prod
COPY package*.json ./
RUN npm install
COPY . .
RUN mkdir -p dist && npm run build