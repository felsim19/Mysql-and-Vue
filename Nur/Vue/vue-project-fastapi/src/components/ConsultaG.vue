<template>
  <section class="con">
    <h1>Clientes</h1>
    <table>
      <thead>
        <tr>
          <th>Apellido</th>
          <th>Celular</th>
          <th>Correo</th>
          <th>Documento</th>
          <th>Nombre</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="i in data" :key="i">
          <td>{{ i.Apellido }}</td>
          <td>{{ i.Celular }}</td>
          <td>{{ i.Correo }}</td>
          <td>{{ i.Documento }}</td>
          <td>{{ i.Nombre }}</td>
        </tr>
      </tbody>
    </table>
  </section>
</template>

<script>
import { ref, onMounted } from "vue";
import axios from "axios";
export default {
  setup() {
    const data = ref([]);
    const consultarCliente = async () => {
      try {
        const res = await axios.get("http://127.0.0.1:8000/datosfire");
        if (Array.isArray(res.data)) {
          data.value = res.data;
        } else {
          console.error("No se cargaron los datos", res.data);
        }
      } catch (error) {
        console.error("Error no hay respuesta", error);
      }
    };

    let intervalo = null
    onMounted(() => {
      consultarCliente();
      intervalo = setInterval(consultarCliente,1000)
    })
    onMounted(consultarCliente);
    return { data };
  },
};
</script>

<style>
table,th,td{
  border: 2px solid black;
  background-color: cyan;
}
.con{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
</style>
