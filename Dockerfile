FROM node:20.10.0-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.27.0-alpine

COPY --from=builder /app/build /usr/share/nginx/html

