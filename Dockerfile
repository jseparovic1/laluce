FROM node:18-alpine as base
WORKDIR /app

# Add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Do not run commands as root.
USER node

COPY . .

FROM base as dev
RUN npm install
EXPOSE 3000
CMD ["npm", "run", "dev"]

FROM base as prod
COPY . .
RUN npm install
RUN npm run build
CMD ["npm", "run", "preview"] 