FROM node:16-alpine

ARG MYSQL_HOST=localhost
ARG MYSQL_USER=root
ARG MYSQL_PASSWORD=22suarez
ARG MYSQL_DATABASE=employeedb

RUN apk add --no-cache mysql-client

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD ["npm", "start"]