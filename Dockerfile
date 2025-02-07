FROM node:18-alpine as base
WORKDIR /app

# Add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

FROM base as dev
COPY . .
RUN npm install
EXPOSE 3000
CMD ["npm", "run", "dev"]

FROM base as prod
COPY package*.json ./
RUN npm install --only=production
COPY . .
RUN npm run build
CMD ["npm", "run", "preview"] 