#magen base será la imagen oficial de Node.js versión 20.13.1 alias node
FROM node:20.13.1  as node 
#establece el directorio de trabajo dentro del contenedor a /app
WORKDIR /app
#copia todos los archivos del directorio donde se encuentra el Dockerfile
COPY . .
#instala todas las dependencias listadas en el archivo
RUN npm install -f
#generalmente genera una versión optimizada para producción de la aplicación 
RUN npm run build --prod

#servir la aplicación web generada en la primera fase
FROM nginx:1.26.1-alpine
#utiliza la imagen generada en la fase anterior, para copiar los archivos de la aplicación compilada.
COPY --from=node app/dist/cinema-app /usr/share/nginx/html
# manejo de rutas, la configuración de proxy o ajustes de rendimiento y seguridad para que Nginx funcione
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
