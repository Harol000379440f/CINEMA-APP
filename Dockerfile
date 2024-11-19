FROM node:20.13.1  as node
WORKDIR /app
COPY . .
RUN npm install -f
RUN npm run build --prod


FROM nginx:1.26.1-alpine
COPY --from=node app/dist/cinema-app /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
