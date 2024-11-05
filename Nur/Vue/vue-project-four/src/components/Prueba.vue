<template>
  <div :class="{menorcero: menor , mayorcero : mayor }">{{ contador }}</div>
  <button @click="Micontador()">+</button>
  <button @click="MicontadorMenor()">-</button>
  <button @click="resetear()">Reset</button>
</template>

<script setup>
import { ref, computed } from "vue";
let contador = ref(0);

const Micontador = () => {
  contador.value++;
};

const MicontadorMenor = () => {
  contador.value--;
};

const mayor = computed(() => {
  return contador.value > 0;
});

const menor = computed(() => {
  return contador.value < 0;
});

const resetear = () => {
  contador.value = 0
}
</script>

<style>
.menorcero {
  color: red;
}

.mayorcero {
  color: green;
}
</style>
