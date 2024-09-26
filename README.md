
# Vue.js Suscriptor

Este proyecto es una aplicación frontend construida con Vue.js que se conecta a un WebSocket para recibir mensajes en tiempo real desde un servicio backend .NET. Los mensajes son enviados a la aplicación a través de RabbitMQ y distribuidos mediante un WebSocket.

## Requisitos

- Node.js 12.x o superior
- npm o yarn
- Servicio .NET configurado con WebSocket y suscrito a RabbitMQ

## Configuración del Proyecto

1. Clona el repositorio:
    ```bash
    git clone <URL-del-repositorio>
    cd nombre-del-repositorio
    ```

2. Instala las dependencias:
    ```bash
    npm install
    ```

## Comandos

### Compilar y recargar automáticamente para desarrollo

```bash
npm run serve
```

Este comando levanta un servidor local en `http://localhost:8080` con hot-reloading para facilitar el desarrollo.

### Compilar y minificar para producción

```bash
npm run build
```

Este comando genera los archivos optimizados para producción, listos para ser desplegados en un servidor.

### Corregir y arreglar archivos de linting

```bash
npm run lint
```

Ejecuta ESLint para corregir problemas de código y mantener una buena calidad de código.

## Despliegue

1. Luego de ejecutar `npm run build`, toma los archivos generados en la carpeta `dist/` y despliega en un servidor web (Nginx, Apache, etc.).
2. Asegúrate de configurar el proxy en el servidor web para redirigir al WebSocket si es necesario.

## Interacción con otros componentes

- La aplicación Vue.js recibe mensajes en tiempo real desde un WebSocket, el cual está siendo manejado por un servicio .NET que se suscribe a los mensajes publicados en RabbitMQ.
- Asegúrate de que RabbitMQ esté correctamente configurado y que el servicio .NET esté distribuyendo los mensajes por el WebSocket a esta aplicación.

## Personalizar configuración

Para más detalles sobre cómo personalizar la configuración del proyecto Vue.js, consulta la [documentación de Vue CLI](https://cli.vuejs.org/config/).
