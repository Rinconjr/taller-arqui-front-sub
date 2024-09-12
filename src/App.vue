<template>
  <div id="app">
    <NavBar />
    <h1>Aplicación Suscriptor</h1>
    <div>
      <h2>Mensajes Recibidos:</h2>
      <ul>
        <li v-for="(msg, index) in messages" :key="index">{{ msg }}</li>
      </ul>
    </div>
  </div>
</template>

<script>
import NavBar from './components/NavBar.vue';

export default {
  name: 'App',
  components: {
    NavBar
  },
  data() {
    return {
      messages: [], // Array para almacenar mensajes recibidos
      webSocket: null
    };
  },
  mounted() {
    this.connectWebSocket();
  },
  methods: {
  connectWebSocket() {
    const wsUrl = 'wss://localhost:7016/ws'; // Ajusta la URL del WebSocket al puerto HTTPS
    this.webSocket = new WebSocket(wsUrl);

    this.webSocket.onopen = () => {
      console.log('Conectado al WebSocket');
    };

    this.webSocket.onmessage = (event) => {
      // Añadir el mensaje recibido al array de mensajes
      this.messages.push(event.data);
    };

    this.webSocket.onclose = () => {
      console.log('Desconectado del WebSocket');
    };

    this.webSocket.onerror = (error) => {
      console.error('Error en WebSocket:', error);
    };
  }
}

}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
}

h1 {
  margin-top: 1em;
  font-size: 2.5em;
  font-weight: bold;
  color: #42b983;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  margin-bottom: 0.5em;
}
</style>