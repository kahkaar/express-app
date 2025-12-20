FROM node:lts-alpine

WORKDIR /usr/src/app

EXPOSE 8080

COPY . .

RUN npm install

CMD ["node", "index.js"]
