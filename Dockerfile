### STAGE 1: Build ###

FROM node:10-alpine AS build


WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH
COPY package.json /usr/src/app/package.json

RUN npm config set unsafe-perm true
RUN npm install --silent
RUN npm install react-scripts -g --silent
COPY . /usr/src/app
RUN npm run build
EXPOSE 8080

CMD ["npm","start"]