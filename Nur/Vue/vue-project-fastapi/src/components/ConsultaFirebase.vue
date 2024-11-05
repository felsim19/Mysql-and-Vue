<template>
  <section>
    <h1>Aerolineas</h1>
    <table>
      <thead>
        <tr>
          <th>Origen</th>
          <th>Destino</th>
          <th>Tarifa</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="i in data" :key="i">
          <td>{{ i.Origen }}</td>
          <td>{{ i.Destino }}</td>
          <td>{{ i.Tarifa }}</td>
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
    const consultaFatosCliente = async () => {
      try {
        const respuesta = await axios.get("http://127.0.0.1:8000/TarifasVuelo");
        if (Array.isArray(respuesta.data)) {
          data.value = respuesta.data;
        } else {
          console.error("No se cargaron los datos", respuesta.data);
        }
      } catch (error) {
        console.error("Error no hay respuesta", error);
      }
    };

    let intervalo = null;

    onMounted(() => {
      consultaFatosCliente();
      intervalo = setInterval(consultaFatosCliente, 1000);
    });
    onMounted(consultaFatosCliente);
    return { data };
  },
};
</script>

<style></style>
