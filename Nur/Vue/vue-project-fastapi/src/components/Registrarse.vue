<script>
import axios from "axios";
import { ref } from "vue";

export default {
  setup() {
    const Cliente = ref({
      Apellido: "",
      Celular: "",
      Correo: "",
      Documento: "",
      Nombre: "",
    });

    const mensaje = ref("");
    const insertarCliente = async () => {
      try {
        const respuesta = await axios.post(
          "http://127.0.0.1:8000/insertar",
          Cliente.value
        );
        mensaje.value = respuesta.data.mensaje;
      } catch (error) {
        if (error.respuesta) {
          console.error(
            "Error con al registrar los datos",
            error.respuesta.data
          );
        } else {
          console.error("Error al refistrar datos", error.mensaje);
        }
      }
    };
    return { Cliente, insertarCliente, mensaje };
  },
};
</script>

<template>
  <div class="container">
    <h1>Registrar datos</h1>
    <form @submit.prevet="insertarCliente">
      <label for=""
        >Apellido
        <input v-model="Cliente.Apellido" type="text" required />
      </label>
      <label for=""
        >Celular
        <input v-model="Cliente.Celular" type="text" required />
      </label>
      <label for=""
        >Correo
        <input v-model="Cliente.Correo" type="text" />
      </label>
      <label for=""
        >Documento
        <input v-model="Cliente.Documento" type="text" />
      </label>
      <label for=""
        >Nombre
        <input v-model="Cliente.Nombre" type="text" />
      </label>
      <button type="submit">Registrar</button>
    </form>
    <div v-if="mensaje">{{ mensaje }}</div>
  </div>
</template>

<style>
.container {
    display: flex;
    flex-direction: column;
    margin: 0 30px;
    padding: 30px;
    align-items: center;
}
form{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    height: 440px;
}
label{
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 10px;
    margin: 5px 0;
}
</style>
