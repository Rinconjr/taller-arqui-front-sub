<template>
  <div id="app">
    <NavBar />
    <h1>Aplicación Suscriptor</h1>
    <div>
      <select v-model="selectedTopic" @change="onTopicChange">
        <option value="" disabled>Selecciona un tópico</option>
        <option value="topico1">Tópico 1</option>
        <option value="topico2">Tópico 2</option>
      </select>
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
      webSocket: null,
      selectedTopic: '' // Variable para almacenar el tópico seleccionado
    };
  },
  watch: {
    // Observar cambios en el tópico seleccionado
    selectedTopic(newTopic) {
      if (newTopic) {
        this.connectWebSocket(newTopic);
        this.messages = []; // Limpiar mensajes al cambiar de tópico
      }
    }
  },
  methods: {
    // Conectar al WebSocket según el tópico seleccionado
    connectWebSocket(topic) {
      if (this.webSocket) {
        console.log('Cerrando WebSocket existente...');
        this.webSocket.close();
      }

      const wsUrl = `wss://localhost:7016/ws?topic=${topic}`; // Ajusta la URL del WebSocket según el tópico
      console.log('Conectando a:', wsUrl);

      this.webSocket = new WebSocket(wsUrl);

      this.webSocket.onopen = () => {
        console.log('Conectado al WebSocket');
      };

      this.webSocket.onmessage = (event) => {
        // Añadir el mensaje recibido al array de mensajes
        console.log('Mensaje recibido:', event.data);
        this.messages.push(event.data);
      };

      this.webSocket.onclose = (event) => {
        console.log('Desconectado del WebSocket', event);
        // Implementar lógica de reconexión si es necesario
      };

      this.webSocket.onerror = (error) => {
        console.error('Error en WebSocket:', error);
      };
    },
    onTopicChange() {
      // Conectar al WebSocket con el nuevo tópico seleccionado
      this.connectWebSocket(this.selectedTopic);
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

select {
  margin-bottom: 1em;
  padding: 0.5em;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  margin-bottom: 0.5em;
}
</style>
