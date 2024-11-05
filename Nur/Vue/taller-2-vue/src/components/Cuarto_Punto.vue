<template>
  <div :style="{ backgroundColor: colorFondo }">
    <button @click="cambiocolor">Change Background Color</button>
  </div>
</template>

<script setup>
import { ref } from "vue";
const colorFondo = ref("#1515ff");

const obtenerColorAleatorio = () => {
  const lista = "0123456789ABCDEF";
  let color = "#";
  for (let i = 0; i < 6; i++) {
    color += lista[Math.floor(Math.random() * 16)];
  }
  return color;
};

const cambiocolor = () => {
  colorFondo.value = obtenerColorAleatorio();
};
</script>

<style scoped>
.color-changer {
  padding: 20px;
  text-align: center;
}
button {
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}
</style>
