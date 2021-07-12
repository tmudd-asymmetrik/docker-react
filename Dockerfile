# Build Stage 1
FROM node:alpine

WORKDIR /app

COPY ./package.json ./
RUN npm install

COPY ./ ./

CMD [ "npm", "run", "build" ]

# Build Stage 2
FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html