# Usar la imagen de Node.js para compilar la aplicación
FROM node:16 as build-stage

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo package.json y package-lock.json para instalar dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar todo el código fuente a la imagen
COPY . .

# Compilar la aplicación para producción
RUN npm run build

# Usar una imagen ligera de NGINX para servir la aplicación
FROM nginx:alpine as production-stage

# Copiar los archivos generados por Vue.js a la carpeta de NGINX
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Exponer el puerto 80 para que se pueda acceder a la aplicación
EXPOSE 80

# Comando por defecto para ejecutar NGINX
CMD ["nginx", "-g", "daemon off;"]
