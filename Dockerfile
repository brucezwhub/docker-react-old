FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#CMD ["npm", "run", "start"]  do not need to start

#/app/build will have all the content we need.
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#default nginx will start the service automatically
